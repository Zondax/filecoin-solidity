use fil_actor_eam::ext::evm::ConstructorParams;
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
use fvm_ipld_encoding::RawBytes;
use fil_actors_runtime::{EAM_ACTOR_ADDR, INIT_ACTOR_ADDR};
use cid::Cid;
use std::str::FromStr;
use rand_core::OsRng;
use bls_signatures::Serialize;

const WASM_COMPILED_PATH: &str =
   "../build/v0.8/MinerAPI.bin";

// const WASM_COMPILED_PATH: &str =
// "../build/SimpleCoin.bin";

#[derive(Serialize_tuple, Deserialize_tuple, Clone, Debug)]
struct State {
    empty: bool,
}

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
    let actors = std::fs::read("./builtin-actors-devnet-wasm.car").expect("Unable to read actor devnet file file");
    let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

    let mut tester =
        Tester::new(NetworkVersion::V18, StateTreeVersion::V5, bundle_root, bs).unwrap();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    let bls_private_key = bls_signatures::PrivateKey::generate(&mut OsRng);
    let worker = Address::new_bls(&bls_private_key.public_key().as_bytes()).unwrap();

    tester.state_tree.as_mut().unwrap().register_new_address(&worker).unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Create Miner actor for solidity contract to interact with");

    let constructor_params = fil_actor_miner::MinerConstructorParams{
        owner: sender[0].1,
        worker,
        control_addresses: vec![],
        window_post_proof_type: fvm_shared::sector::RegisteredPoStProof::StackedDRGWindow2KiBV1,
        peer_id: vec![1, 2, 3],
        multi_addresses: vec![BytesDe(vec![1, 2, 3])],
    };

    let exec_params = fil_actor_init::ExecParams{
        code_cid: Cid::from_str("bafk2bzacec7gj7tiyiaanver7wxj6celzrbjo5f2qcrsattjtffhk32k3cl34").unwrap(),
        constructor_params: RawBytes::serialize(constructor_params).unwrap(),
    };

    let message = Message {
        from: sender[0].1,
        to: INIT_ACTOR_ADDR,
        gas_limit: 1000000000,
        method_num: 2,
        params: RawBytes::serialize(exec_params).unwrap(),
        ..Message::default()
    };

    let res = executor
    .execute_message(message, ApplyKind::Explicit, 100)
    .unwrap();

    dbg!(&res);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

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
        sequence: 1,
        params: RawBytes::serialize(constructor_params).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    dbg!(&res);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    let exec_return : Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    // println!("Calling `get_owner`");

    // let message = Message {
    //     from: sender[0].1,
    //     to: Address::new_id(exec_return.actor_id),
    //     gas_limit: 1000000000,
    //     method_num: 2,
    //     sequence: 1,
    //     params: RawBytes::new(hex::decode("44f8a8fd6d").unwrap()),
    //     ..Message::default()
    // };

    // let res_test = executor
    //     .execute_message(message, ApplyKind::Explicit, 100)
    //     .unwrap();

    // assert_eq!(res_test.msg_receipt.exit_code.value(), 0);
}
