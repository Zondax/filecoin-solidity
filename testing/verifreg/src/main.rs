use fil_actor_eam::Return;
use fil_actors_runtime::EAM_ACTOR_ADDR;
use fil_actors_runtime::VERIFIED_REGISTRY_ACTOR_ADDR;
//use fil_actors
use fvm_shared::bigint::{bigint_ser, BigInt};

use fvm::executor::{ApplyKind, Executor};
use fvm_integration_tests::bundle;
use fvm_integration_tests::dummy::DummyExterns;
use fvm_integration_tests::tester::{Account, Tester};
use fvm_ipld_blockstore::MemoryBlockstore;
use fvm_ipld_encoding::RawBytes;
use fvm_ipld_encoding::{strict_bytes, tuple::*};
use fvm_shared::address::Address;

use fvm::state_tree::ActorState;
use fvm_shared::bigint::bigint_ser::{BigIntDe, BigIntSer};
use fvm_shared::message::Message;
use fvm_shared::sector::StoragePower;
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

#[derive(Clone, Debug, PartialEq, Eq, Serialize_tuple, Deserialize_tuple)]
pub struct VerifierParams {
    pub address: Address,
    #[serde(with = "bigint_ser")]
    pub allowance: StoragePower,
}

fn main() {
    println!("Testing solidity API");

    let bs = MemoryBlockstore::default();
    let actors = std::fs::read("../builtin-actors/output/builtin-actors-devnet-wasm.car")
        .expect("Unable to read actor devnet file");
    let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

    let mut tester =
        Tester::new(NetworkVersion::V18, StateTreeVersion::V5, bundle_root, bs).unwrap();

    let accounts: [Account; 2] = tester.create_accounts().unwrap();
    let (sender, _verified_client) = (accounts[0], accounts[1]);

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
        from: sender.1,
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

    // the  dataCap and  verified client use in the add_verified_client  call.
    //let verifier_allowance = fvm_shared::sector::StoragePower::from(2 * 1048576u64);
    //let x = RawBytes::serialize(BigIntSer(&verifier_allowance)).unwrap();
    //let data: Address = verified_client.1;
    //let params = fil_actor_verifreg::AddVerifiedClientParams {
    //address: verified_client,
    //allowance: verifier_allowance,
    //};

    println!("Calling `add_verified_client`");
    let message = Message {
        from: sender.1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        // get method number for method add_verified_client
        method_num: 2,
        sequence: 1,
        params: RawBytes::new(hex::decode("58E455707461000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000001501DCE5B7F69E73494891556A350F8CC357614916D5000000000000000000000000000000000000000000000000000000000000000000000000000000000000060044002000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // FIXME: "caller f0102 is not a verifier"
    // it necessary to instantiate a state with a verifier so this call returns success
    //dbg!("add_verified_client {:?}", &res);
    println!("add_verified_client {:?}", &res);
    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `get_claims`");

    let message = Message {
        from: sender.1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 2,
        //  get_claims params [201, [0,1]]
        params: RawBytes::new(hex::decode("58C4DBCB98AB000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000C90000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // Should not fail as actor would return an empty list of claims
    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `extend_claim_term`");
    let message = Message {
        from: sender.1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 3,
        params: RawBytes::new(hex::decode("58C4D8308B8C000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000660000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    //dbg!("extend_claim_term result {:?}", &res);
    // does not fails as  f0102 is not the provider
    // for claims "allocation/claim references id 0 that does not belong to 102"
    // better to set up  the verifier actor with claims
    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `remove_expired_allocations`");

    let message = Message {
        from: sender.1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 4,
        //  remove_expired_allocations params [actorId(101), []] empty list which means remove all
        params: RawBytes::new(hex::decode("5884DF5527250000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000006500000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // Should not fail as actor would return an empty list of allocations
    assert_eq!(
        res.msg_receipt.exit_code.value(),
        33,
        "remove_expired_allocations assertion failed"
    );

    println!("Calling `remove_expired_claims`");
    let message = Message {
        from: sender.1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 5,
        params: RawBytes::new(hex::decode("58C4D8308B8C000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000660000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    //dbg!("claims result {:?}", &res);
    //
    // FIX: fails with: Actor sequence invalid: 5 != 4
    // related to verifier actor state which has not been
    // instantiated yet
    assert_eq!(res.msg_receipt.exit_code.value(), 33);

    println!("Calling `universal_receiver_hook`");
    let message = Message {
        from: sender.1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 6,
        params: RawBytes::new(hex::decode("58A4AA7E0F7B000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000C9000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000031245AB0000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // this fails with: message: "caller f0102 is not one of supported"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
}
