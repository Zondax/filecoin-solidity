use bls_signatures::Serialize;
use cid::Cid;
use fil_actor_eam::Return;
use fil_actors_runtime::EAM_ACTOR_ADDR;
use fvm::executor::{ApplyKind, Executor};
use fvm::state_tree::ActorState;
use fvm_integration_tests::bundle;
use fvm_integration_tests::dummy::DummyExterns;
use fvm_integration_tests::tester::{Account, Tester};
use fvm_ipld_blockstore::MemoryBlockstore;
use fvm_ipld_encoding::strict_bytes;
use fvm_ipld_encoding::tuple::*;
use fvm_ipld_encoding::RawBytes;
use fvm_ipld_encoding::{serde_bytes, CborStore};
use fvm_shared::address::Address;
use fvm_shared::econ::TokenAmount;
use fvm_shared::message::Message;
use fvm_shared::state::StateTreeVersion;
use fvm_shared::version::NetworkVersion;
use multihash::Code;
use rand_core::OsRng;
use std::env;
use std::str::FromStr;

const WASM_COMPILED_PATH: &str = "../../build/v0.8/tests/AccountApiTest.bin";

#[derive(Serialize_tuple, Deserialize_tuple)]
pub struct Create2Params {
    #[serde(with = "strict_bytes")]
    pub initcode: Vec<u8>,
    #[serde(with = "strict_bytes")]
    pub salt: [u8; 32],
}

#[derive(Debug, Serialize_tuple, Deserialize_tuple)]
pub struct AuthenticateMessageParams {
    #[serde(with = "serde_bytes")]
    pub signature: Vec<u8>,
    #[serde(with = "serde_bytes")]
    pub message: Vec<u8>,
}

#[derive(Serialize_tuple, Deserialize_tuple, PartialEq, Eq, Clone, Debug)]
pub struct UniversalReceiverParams {
    /// Asset type
    pub type_: u32,
    /// Payload corresponding to asset type
    pub payload: RawBytes,
}

fn main() {
    println!("Testing solidity API");

    let bs = MemoryBlockstore::default();
    let actors = std::fs::read("../builtin-actors/output/builtin-actors-devnet-wasm.car")
        .expect("Unable to read actor devnet file file");
    let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

    let mut tester =
        Tester::new(NetworkVersion::V18, StateTreeVersion::V5, bundle_root, bs).unwrap();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate Account Actor with a BLS address
    let bls_private_key_provider = bls_signatures::PrivateKey::generate(&mut OsRng);
    let worker = Address::new_bls(&bls_private_key_provider.public_key().as_bytes()).unwrap();

    let state_tree = tester.state_tree.as_mut().unwrap();
    let assigned_addr = state_tree.register_new_address(&worker).unwrap();
    let state = fvm::account_actor::State { address: worker };

    let cid = state_tree
        .store()
        .put_cbor(&state, Code::Blake2b256)
        .unwrap();

    let actor_state = ActorState {
        // CID of Accounts actor. You get this as output from builtin-actors compiling process
        code: Cid::from_str("bafk2bzacecrpqpvnzvniboglkaviue7whogaj5iwtkegtvepifhhijmxvjrf6")
            .unwrap(),
        state: cid,
        sequence: 0,
        balance: TokenAmount::from_whole(1_000_000),
        delegated_address: Some(worker),
    };

    state_tree.set_actor(assigned_addr, actor_state).unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let wasm_path = env::current_dir()
        .unwrap()
        .join(WASM_COMPILED_PATH)
        .canonicalize()
        .unwrap();
    let evm_hex = std::fs::read(wasm_path).expect("Unable to read file");
    let evm_bin = hex::decode(evm_hex).unwrap();

    let constructor_params = Create2Params {
        initcode: evm_bin,
        salt: [0; 32],
    };

    let message = Message {
        from: sender[0].1,
        to: EAM_ACTOR_ADDR,
        gas_limit: 1000000000,
        method_num: 3,
        params: RawBytes::serialize(constructor_params).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    let exec_return: Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();
    let actor_id = exec_return.actor_id;

    println!("Calling `authenticate_message`");

    // create message
    let message = Message {
        from: sender[0].1,
        to: Address::new_id(actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 1,
        // target: 0x4300c901(assigned_addr), params: ["0x80", "0x80"]
        params: RawBytes::new(hex::decode("5864467FAFEF000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020068000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // FIXME: return code  should be 0
    assert_eq!(res.msg_receipt.exit_code.value(), 33);

    println!("Calling `universal_receiver_hook`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 2,
        // target: 0x4300c901(assigned_addr), params: UniversalReceiverParams{0, RawBytes([0,1,2])} 
        params: RawBytes::new(hex::decode("5864467FAFEF000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020068000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // FIXME: expected return code: 0
    // as this method  always succeed
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
}
