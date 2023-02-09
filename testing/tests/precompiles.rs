use fil_actor_eam::Return;
use fil_actor_evm::Method as EvmMethods;
use fil_actors_runtime::EAM_ACTOR_ADDR;
use fvm::executor::{ApplyKind, Executor};
use fvm_integration_tests::dummy::DummyExterns;
use fvm_integration_tests::tester::Account;
use fvm_ipld_encoding::strict_bytes;
use fvm_ipld_encoding::RawBytes;
use fvm_shared::address::Address;
use fvm_shared::econ::TokenAmount;
use fvm_shared::message::Message;
use serde::{Deserialize as SerdeDeserialize, Serialize as SerdeSerialize};

use testing::setup;
use testing::GasResult;

const WASM_COMPILED_PATH: &str = "../build/v0.8/tests/PrecompilesApiTest.bin";

#[derive(SerdeSerialize, SerdeDeserialize)]
#[serde(transparent)]
pub struct CreateExternalParams(#[serde(with = "strict_bytes")] pub Vec<u8>);

#[test]
fn precompiles_tests() {
    println!("Testing solidity API");

    let mut gas_result: GasResult = vec![];
    let (mut tester, _manifest) = setup::setup_tester();

    // As the governor address for datacap is 200, we create many many address in order to initialize the ID 200 with some tokens
    // and make it a valid address to use.
    let sender: [Account; 300] = tester.create_accounts().unwrap();

    println!(
        "{}",
        format!(
            "Sender address id [{}] and bytes [{}]",
            &sender[0].0,
            hex::encode(&sender[0].1.to_bytes())
        )
    );
    println!(
        "{}",
        format!(
            "Sender address id [{}] and bytes [{}]",
            &sender[1].0,
            hex::encode(&sender[1].1.to_bytes())
        )
    );
    println!(
        "{}",
        format!(
            "Sender address id [{}] and bytes [{}]",
            &sender[2].0,
            hex::encode(&sender[2].1.to_bytes())
        )
    );
    println!(
        "{}",
        format!(
            "Sender address id [{}] and bytes [{}]",
            &sender[3].0,
            hex::encode(&sender[3].1.to_bytes())
        )
    );

    // Create embryo address to deploy the contract on it (assign some FILs to it)
    let tmp = hex::decode("DAFEA492D9c6733ae3d56b7Ed1ADB60692c98Bc5").unwrap();
    let embryo_eth_address = tmp.as_slice();
    let embryo_delegated_address = Address::new_delegated(10, embryo_eth_address).unwrap();
    tester
        .create_placeholder(&embryo_delegated_address, TokenAmount::from_whole(100))
        .unwrap();

    println!(
        "Embryo address delegated type [{}]",
        embryo_delegated_address
    );
    println!(
        "Embryo address delegated type on hex [{}]",
        hex::encode(embryo_delegated_address.to_bytes())
    );
    // println!("Embryo address ID type on decimal [{}]",embryo_actor_id);
    // println!("Embryo address ID type on hex [{}]",hex::encode(Address::new_id(embryo_actor_id).to_bytes()));

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    // First we deploy the contract in order to actually have an actor running on the embryo address
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

    println!(
        "Contract address ID type on decimal [{}]",
        exec_return.actor_id
    );
    println!(
        "Contract address ID type on hex [{}]",
        hex::encode(Address::new_id(exec_return.actor_id).to_bytes())
    );
    match exec_return.robust_address {
        Some(addr) => println!("Contract address robust type [{}]", addr),
        None => (),
    }

    println!(
        "Contract address eth address type [{}]",
        hex::encode(exec_return.eth_address.0)
    );

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `resolve_address`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("586428EEDF4B00000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000015011EDA43D05CA6D7D637E7065EF6B8C5DB89E5FB0C0000000000000000000000").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    gas_result.push(("resolve_address".into(), res.msg_receipt.gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(
        hex::encode(res.msg_receipt.return_data.bytes()),
        "58200000000000000000000000000000000000000000000000000000000000000064"
    );

    println!("Calling `get_actor_type`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(contract_actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 2,
        params: RawBytes::new(
            hex::decode(
                "58247CF8C4440000000000000000000000000000000000000000000000000000000000000064",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    gas_result.push(("get_actor_type".into(), res.msg_receipt.gas_used));
    // FIXME
    assert_eq!(res.msg_receipt.exit_code.value(), 33);
    /*assert_eq!(
        hex::encode(res.msg_receipt.return_data.bytes()),
        "58200000000000000000000000000000000000000000000000000000000000000003"
    );*/

    println!("Calling `lookup_delegated_address (empty response)`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(contract_actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 3,
        params: RawBytes::new(
            hex::decode(
                "58249898B39A0000000000000000000000000000000000000000000000000000000000000064",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    gas_result.push((
        "lookup_delegated_address (empty response)".into(),
        res.msg_receipt.gas_used,
    ));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "584000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000");

    println!("Calling `lookup_delegated_address (address found)`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(contract_actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 4,
        params: RawBytes::new(
            hex::decode(
                "58249898B39A0000000000000000000000000000000000000000000000000000000000000190",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    gas_result.push((
        "lookup_delegated_address (address found)".into(),
        res.msg_receipt.gas_used,
    ));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "586000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000016040adafea492d9c6733ae3d56b7ed1adb60692c98bc500000000000000000000");

    println!("Calling `get_ripemd160_hash`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 5,
            params: RawBytes::new(hex::decode("586417C9F02D000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000071212121212344400000000000000000000000000000000000000000000000000").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    gas_result.push(("get_ripemd160_hash".into(), res.msg_receipt.gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "5860000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000001b8cf5bc0e542a1620184208f78c0cff516cce96");

    println!("Calling `resolve_eth_address`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 6,
            params: RawBytes::new(hex::decode("58640D6B2CE40000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000001476C499BE8821B5B9860144D292FFF728611BFD1A000000000000000000000000").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    gas_result.push(("resolve_eth_address".into(), res.msg_receipt.gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(
        hex::encode(res.msg_receipt.return_data.bytes()),
        "58200000000000000000000000000000000000000000000000000000000000000191"
    );

    let table = testing::create_gas_table(gas_result);
    table.printstd();
}
