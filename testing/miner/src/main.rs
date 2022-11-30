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
   "../../build/v0.8/MinerAPI.bin";

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
    let actors = std::fs::read("../builtin-actors-devnet-wasm.car").expect("Unable to read actor devnet file file");
    let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

    let mut tester =
        Tester::new(NetworkVersion::V18, StateTreeVersion::V5, bundle_root, bs).unwrap();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

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
        //code: Cid::from_str("bafk2bzaceapwdyvowtd5v4blmntzqkdienejy4mlrl53mua55xgftdqoggoe4").unwrap(),
        code: Cid::from_str("bafk2bzacecj7v5ur5qk4vn3xbvgsizl35e42l3yaankmxu6dcoouv4mkphsjq").unwrap(),
        state: cid,
        sequence: 0,
        balance: TokenAmount::from_atto(10000),
        address: Some(worker),
    };

    state_tree
        .set_actor(&Address::new_id(assigned_addr), actor_state)
        .unwrap();
    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    /**************************
     *
     * Machine instantiated
     *
     **************************/

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
        //code_cid: Cid::from_str("bafk2bzaceazmjegx7urapdpohpos7tud5m4w7doxsetbjo5tx7y7wciyirphi").unwrap(),
        code_cid: Cid::from_str("bafk2bzacedgixfd465634uihet3u57vugbbp6s5sseb76phti3cexx66ers3i").unwrap(),
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

    let exec_return : ExecReturn = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    dbg!(hex::encode(&exec_return.id_address.to_bytes()));

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

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    let exec_return : Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    println!("Calling `change_owner_address`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 2,
        params: RawBytes::new(hex::decode("58645E1066B0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "08c379a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000e6163746f72206572726f72203138000000000000000000000000000000000000");

    println!("Calling `get_beneficiary`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 3,
        params: RawBytes::new(hex::decode("44d9fc907e").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 0 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `change_beneficiary`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 4,
        params: RawBytes::new(hex::decode("58C4DDBC6F030000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000004BC00000000000000000000000000000000000000000000000000000000000004BC00000000000000000000000000000000000000000000000000000000000000020067000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "08c379a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000e6163746f72206572726f72203138000000000000000000000000000000000000");

    println!("Calling `get_owner`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 5,
        params: RawBytes::new(hex::decode("440AC298DC").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 0 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `get_available_balance`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 6,
        params: RawBytes::new(hex::decode("4459CF9E17").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 0 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 0);


    println!("Calling `get_vesting_funds`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 7,
        params: RawBytes::new(hex::decode("44214C471C").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 0 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `repay_debt`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 8,
        params: RawBytes::new(hex::decode("4474C1F09D").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "08c379a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000e6163746f72206572726f72203138000000000000000000000000000000000000");


    println!("Calling `confirm_change_worker_address`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 9,
        params: RawBytes::new(hex::decode("4411FD5FBB").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "08c379a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000e6163746f72206572726f72203138000000000000000000000000000000000000");



    println!("Calling `get_peer_id`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 10,
        params: RawBytes::new(hex::decode("445BDA22A2").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 0 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 0);


    println!("Calling `get_multiaddresses`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 11,
        params: RawBytes::new(hex::decode("44B163EC58").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 0 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 0);


    println!("Calling `change_worker_address`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 12,
        params: RawBytes::new(hex::decode("5901248D74B5D8000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000200660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020067000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "08c379a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000e6163746f72206572726f72203136000000000000000000000000000000000000");

    println!("Calling `is_controlling_address`");

    let message = Message {
       from: sender[0].1,
       to: Address::new_id(exec_return.actor_id),
       gas_limit: 1000000000,
       method_num: 2,
       sequence: 13,
       params: RawBytes::new(hex::decode("5864BE3B757A000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
       ..Message::default()
    };

    let res = executor
       .execute_message(message, ApplyKind::Explicit, 100)
       .unwrap();

    if res.msg_receipt.exit_code.value() != 0 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `get_sector_size`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 14,
        params: RawBytes::new(hex::decode("44A9B494A1").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 0 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `change_multiaddresses`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 15,
        params: RawBytes::new(hex::decode("5901844219EFC7000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000A000000000000000000000000000000000000000000000000000000000000000E0000000000000000000000000000000000000000000000000000000000000000200660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "08c379a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000e6163746f72206572726f72203138000000000000000000000000000000000000");

    println!("Calling `change_peer_id`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 16,
        params: RawBytes::new(hex::decode("5884B22B8C9F0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "08c379a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000e6163746f72206572726f72203138000000000000000000000000000000000000");
}
