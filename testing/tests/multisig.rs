
use bls_signatures::Serialize;
use cid::Cid;
use fil_actor_eam::Return;
use fil_actor_evm::Method as EvmMethods;
use fil_actor_init::ExecReturn;
use fil_actors_runtime::{runtime::builtins, EAM_ACTOR_ADDR, INIT_ACTOR_ADDR};
use fvm::executor::{ApplyKind, Executor};
use fvm::machine::Manifest;
use fvm::state_tree::ActorState;
use fvm_integration_tests::bundle;
use fvm_integration_tests::dummy::DummyExterns;
use fvm_integration_tests::tester::{Account, Tester};
use fvm_ipld_blockstore::MemoryBlockstore;
use fvm_ipld_encoding::strict_bytes;
use fvm_ipld_encoding::CborStore;
use fvm_ipld_encoding::RawBytes;
use fvm_shared::address::Address;
use fvm_shared::econ::TokenAmount;
use fvm_shared::message::Message;
use fvm_shared::state::StateTreeVersion;
use fvm_shared::version::NetworkVersion;
use multihash::Code;
use rand_core::OsRng;
use serde::{Deserialize as SerdeDeserialize, Serialize as SerdeSerialize};

use testing::setup;

const WASM_COMPILED_PATH: &str = "../build/v0.8/tests/MultisigApiTest.bin";

#[derive(SerdeSerialize, SerdeDeserialize)]
#[serde(transparent)]
pub struct CreateExternalParams(#[serde(with = "strict_bytes")] pub Vec<u8>);

#[test]
fn multisig_tests() {
    println!("Testing solidity API");

    let bs = MemoryBlockstore::default();
    let actors = std::fs::read("./builtin-actors/output/builtin-actors-devnet-wasm.car")
        .expect("Unable to read actor devnet file file");
    let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

    let (manifest_version, manifest_data_cid): (u32, Cid) =
        bs.get_cbor(&bundle_root).unwrap().unwrap();
    let manifest = Manifest::load(&bs, &manifest_data_cid, manifest_version).unwrap();

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

    let state_tree = tester.state_tree.as_mut().unwrap();
    let assigned_addr = state_tree.register_new_address(&worker).unwrap();
    let state = fvm::account_actor::State { address: worker };

    let cid = state_tree
        .store()
        .put_cbor(&state, Code::Blake2b256)
        .unwrap();

    let actor_state = ActorState {
        // CID of Accounts actor. You get this as output from builtin-actors compiling process
        code: *manifest
            .code_by_id(builtins::Type::Multisig as u32)
            .unwrap(),
        state: cid,
        sequence: 0,
        balance: TokenAmount::from_atto(10000),
        delegated_address: Some(worker),
    };

    state_tree.set_actor(assigned_addr, actor_state).unwrap();
    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    /**************************
     *
     * Machine instantiated
     *
     **************************/

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_PATH);

    let constructor_params = CreateExternalParams(evm_bin);

    let message = Message {
        from: sender[0].1,
        to: EAM_ACTOR_ADDR,
        gas_limit: 1000000000,
        method_num: 4,
        sequence: 0,
        params: RawBytes::serialize(constructor_params).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    let exec_return: Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    println!("Contract actor id");
    dbg!(&exec_return.actor_id);
    let contract_actor_id = exec_return.actor_id;

    println!("Create Multisig actor for solidity contract to interact with");

    let constructor_params = fil_actor_multisig::ConstructorParams {
        num_approvals_threshold: 1,
        signers: vec![
            Address::new_id(sender[0].0),
            Address::new_id(contract_actor_id),
        ],
        start_epoch: 1670873233,
        unlock_duration: 1670873234,
    };

    let exec_params = fil_actor_init::ExecParams {
        // CID of MultiSig actor. You get this as output from builtin-actors compiling process
        code_cid: *manifest
            .code_by_id(builtins::Type::Multisig as u32)
            .unwrap(),
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

    let exec_return: ExecReturn = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    println!("Multisig actor address bytes");
    dbg!(hex::encode(&exec_return.id_address.to_bytes()));

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `propose`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 2,
            params: RawBytes::new(hex::decode("590164C0987260000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000002006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000457000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0000000000000000000000000000000000000000000000000000000000000000200640000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // FIXME
    assert_eq!(res.msg_receipt.exit_code.value(), 33);

    println!("Calling `add_signer`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 3,
            params: RawBytes::new(hex::decode("5901041339400D00000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000200670000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000020064000000000000000000000000000000000000000000000000000000000000").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // FIXME
    assert_eq!(res.msg_receipt.exit_code.value(), 33);

    // FIXME: As propose is failing, we cannot execute the rest of the methods...
}
