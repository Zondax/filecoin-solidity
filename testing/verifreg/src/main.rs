use fil_actor_eam::Return;
use fil_actors_runtime::EAM_ACTOR_ADDR;

use fvm::executor::{ApplyKind, Executor};
use fvm_integration_tests::bundle;
use fvm_integration_tests::dummy::DummyExterns;
use fvm_integration_tests::tester::{Account, Tester};
use fvm_ipld_blockstore::MemoryBlockstore;
use fvm_ipld_encoding::RawBytes;
use fvm_ipld_encoding::{strict_bytes, tuple::*};
use fvm_shared::address::Address;

use fvm_shared::message::Message;
use fvm_shared::state::StateTreeVersion;
use fvm_shared::version::NetworkVersion;
use std::env;

const WASM_COMPILED_PATH: &str = "../../build/v0.8/VerifRegAPI.bin";

pub const ROOT_ADDR: Address = Address::new_id(101);

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
    let actors = std::fs::read("../builtin-actors/output/builtin-actors-devnet-wasm.car")
        .expect("Unable to read actor devnet file");
    let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

    let mut tester =
        Tester::new(NetworkVersion::V18, StateTreeVersion::V5, bundle_root, bs).unwrap();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let wasm_path = env::current_dir()
        .unwrap()
        .join(WASM_COMPILED_PATH)
        .canonicalize()
        .expect("Unexpected wasm path");
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
        .expect("Fail to initialize verifiedReg actor");

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    let exec_return: Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    println!("Calling `add_verified_client`");
    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 1,
        params: RawBytes::new(hex::decode("58E4557074610000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000001C90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000031000000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // FIXME: "caller f0201 is not a verifier"
    // it necessary to instantiate a state with a verifier so this call returns success
    assert_eq!(res.msg_receipt.exit_code.value(), 33);

    println!("Calling `claim_allocations`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 2,
        params: RawBytes::new(hex::decode("58C4DBCB98AB00000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000065000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // Should not fail as actor would return an empty list of allocations
    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `universal_receiver_hook`");
    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 3,
        params: RawBytes::new(hex::decode("58A4AA7E0F7B000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000C9000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000031245AB0000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // this fails
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
}
