use fvm_integration_tests::tester::{Account, Tester};
use fvm_integration_tests::dummy::DummyExterns;
use fvm_integration_tests::bundle;
use fvm_ipld_encoding::{strict_bytes, tuple::*};
use fvm_shared::state::StateTreeVersion;
use fvm_shared::version::NetworkVersion;
use fvm_ipld_blockstore::MemoryBlockstore;
use fvm_shared::address::Address;
use std::env;
use fvm_shared::message::Message;
use fvm::executor::{ApplyKind, Executor};
use fil_actor_eam::Return;
use fvm_ipld_encoding::RawBytes;
use fil_actors_runtime::{EAM_ACTOR_ADDR};


const WASM_COMPILED_PATH: &str =
   "../../build/v0.8/MarketAPI.bin";

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

    let exec_return : Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    println!("Calling `add_balance`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 1,
        params: RawBytes::new(hex::decode("5864467FAFEF000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "08c379a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000136163746f72206572726f7220636f646520313600000000000000000000000000");


    println!("Calling `withdraw_balance`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 2,
        params: RawBytes::new(hex::decode("58A45BFFDFC40000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000004BC00000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);

    println!("Calling `get_balance`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 3,
        params: RawBytes::new(hex::decode("58643587a9fd000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "4e487b710000000000000000000000000000000000000000000000000000000000000001");


    println!("Calling `get_deal_data_commitment`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 4,
        params: RawBytes::new(hex::decode("5864991e04a4000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "4e487b710000000000000000000000000000000000000000000000000000000000000001");


    println!("Calling `get_deal_client`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 5,
        params: RawBytes::new(hex::decode("58648b7f02fd000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "4e487b710000000000000000000000000000000000000000000000000000000000000001");


    println!("Calling `get_deal_provider`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 6,
        params: RawBytes::new(hex::decode("586455d95609000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "4e487b710000000000000000000000000000000000000000000000000000000000000001");


    println!("Calling `get_deal_label`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 7,
        params: RawBytes::new(hex::decode("58649f4b7c7d000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "4e487b710000000000000000000000000000000000000000000000000000000000000001");


    println!("Calling `get_deal_term`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 8,
        params: RawBytes::new(hex::decode("5864ad36f184000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "4e487b710000000000000000000000000000000000000000000000000000000000000001");


    println!("Calling `get_deal_total_price`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 9,
        params: RawBytes::new(hex::decode("5864412a4b9a000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "4e487b710000000000000000000000000000000000000000000000000000000000000001");


    println!("Calling `get_deal_client_collateral`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 10,
        params: RawBytes::new(hex::decode("58648777b7c8000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "4e487b710000000000000000000000000000000000000000000000000000000000000001");


    println!("Calling `get_deal_provider_collateral`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 11,
        params: RawBytes::new(hex::decode("58641a2811e7000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "4e487b710000000000000000000000000000000000000000000000000000000000000001");


    println!("Calling `get_deal_verified`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 12,
        params: RawBytes::new(hex::decode("58645c4ddef3000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "4e487b710000000000000000000000000000000000000000000000000000000000000001");


    println!("Calling `get_deal_activation`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 13,
        params: RawBytes::new(hex::decode("5864f241560c000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "4e487b710000000000000000000000000000000000000000000000000000000000000001");


    println!("Calling `publish_storage_deals`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 14,
        params: RawBytes::new(hex::decode("58646E65901F000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();


    if res.msg_receipt.exit_code.value() != 33 {
        dbg!(&res);
    }

    // FIXME : "actor error"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "");
}
