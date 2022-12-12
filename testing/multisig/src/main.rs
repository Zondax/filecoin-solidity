use fvm_integration_tests::tester::{Account, Tester};
use fvm_integration_tests::dummy::DummyExterns;
use fvm_integration_tests::bundle;
use fvm_ipld_encoding::{strict_bytes, BytesDe, tuple::*};
use fvm_shared::state::StateTreeVersion;
use fvm_shared::version::NetworkVersion;
use fvm_ipld_blockstore::MemoryBlockstore;
use fvm_shared::address::Address;
use std::env;
use fvm_shared::message::Message;
use fvm::executor::{ApplyKind, Executor};
use fil_actor_eam::Return;
use fil_actor_init::ExecReturn;
use fvm_ipld_encoding::RawBytes;
use fil_actors_runtime::{EAM_ACTOR_ADDR, INIT_ACTOR_ADDR};
use cid::Cid;
use std::str::FromStr;
use rand_core::OsRng;
use bls_signatures::Serialize;
use multihash::Code;
use fvm_ipld_encoding::CborStore;
use fvm::state_tree::{ActorState};
use fvm_shared::econ::TokenAmount;

const WASM_COMPILED_PATH: &str =
   "../../build/v0.8/MultisigAPI.bin";

#[derive(Serialize_tuple, Deserialize_tuple)]
pub struct Create2Params {
    #[serde(with = "strict_bytes")]
    pub initcode: Vec<u8>,
    #[serde(with = "strict_bytes")]
    pub salt: [u8; 32],
}

fn main() {
    println!("Testing solidity API");

    let bs = MemoryBlockstore::default();
    let actors = std::fs::read("../builtin-actors/output/builtin-actors-devnet-wasm.car").expect("Unable to read actor devnet file file");
    let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

    let mut tester =
        Tester::new(NetworkVersion::V18, StateTreeVersion::V5, bundle_root, bs).unwrap();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    println!("Sender address id");
    dbg!(&sender[0].0);
    println!("Sender address bytes");
    dbg!(hex::encode(&sender[0].1.to_bytes()));
    /***********************************************
     *
     * Instantiate Account Actor with a BLS address
     *
     ***********************************************/

    let bls_private_key = bls_signatures::PrivateKey::generate(&mut OsRng);
    let worker = Address::new_bls(&bls_private_key.public_key().as_bytes()).unwrap();

    let state_tree = tester
        .state_tree
        .as_mut()
        .unwrap();
    let assigned_addr = state_tree.register_new_address(&worker).unwrap();
    let state = fvm::account_actor::State {
        address: worker,
    };

    let cid = state_tree.store().put_cbor(&state, Code::Blake2b256).unwrap();

    let actor_state = ActorState {
        // CID of Accounts actor. You get this as output from builtin-actors compiling process
        code: Cid::from_str("bafk2bzacebu625ptoi4ssmpr3nndjs3ujybdcdoiozjx64jvnzugypo7sm7os").unwrap(),
        // code: Cid::from_str("bafk2bzacecj7v5ur5qk4vn3xbvgsizl35e42l3yaankmxu6dcoouv4mkphsjq").unwrap(),
        state: cid,
        sequence: 0,
        balance: TokenAmount::from_atto(10000),
        address: Some(worker),
    };

    state_tree
        .set_actor(assigned_addr, actor_state)
        .unwrap();
    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    /**************************
     *
     * Machine instantiated
     *
     **************************/


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
        sequence: 0,
        params: RawBytes::serialize(constructor_params).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    let exec_return : Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    println!("Contract actor id");
    dbg!(&exec_return.actor_id);
    let contractActorID = exec_return.actor_id;

    println!("Create Multisig actor for solidity contract to interact with");

    let constructor_params = fil_actor_multisig::ConstructorParams{
        num_approvals_threshold: 1,
        signers: vec![Address::new_id(contractActorID)],
        start_epoch: 1670873233,
        unlock_duration: 1670873234
    };

    let exec_params = fil_actor_init::ExecParams{
        // CID of StorageMiner actor. You get this as output from builtin-actors compiling process
        code_cid: Cid::from_str("bafk2bzacebjppmys5tqoq2fquf6vkb2bfcgsncfwy7bms7zgt37gowvphjsfk").unwrap(),
        // code_cid: Cid::from_str("bafk2bzacedgixfd465634uihet3u57vugbbp6s5sseb76phti3cexx66ers3i").unwrap(),
        constructor_params: RawBytes::serialize(constructor_params).unwrap(),
    };

    let message = Message {
        from: sender[0].1,
        to: INIT_ACTOR_ADDR,
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 1,
        params: RawBytes::serialize(exec_params).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    let exec_return : ExecReturn = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    println!("Multisig actor address bytes");
    dbg!(hex::encode(&exec_return.id_address.to_bytes()));

    assert_eq!(res.msg_receipt.exit_code.value(), 0);


    println!("Calling `propose`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(contractActorID),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 2,
        params: RawBytes::new(hex::decode("590164C0987260000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000002006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000457000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0000000000000000000000000000000000000000000000000000000000000000200640000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 0 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 0);


}
