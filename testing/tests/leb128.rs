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

const WASM_COMPILED_PATH: &str = "../build/v0.8/tests/Leb128Test.bin";
const WASM_COMPILED_GENERATED1_PATH: &str = "../build/v0.8/tests/Leb128Generated1Test.bin";
const WASM_COMPILED_GENERATED2_PATH: &str = "../build/v0.8/tests/Leb128Generated2Test.bin";
const WASM_COMPILED_GENERATED3_PATH: &str = "../build/v0.8/tests/Leb128Generated3Test.bin";
const WASM_COMPILED_GENERATED4_PATH: &str = "../build/v0.8/tests/Leb128Generated4Test.bin";
const WASM_COMPILED_GENERATED5_PATH: &str = "../build/v0.8/tests/Leb128Generated5Test.bin";
const WASM_COMPILED_GENERATED6_PATH: &str = "../build/v0.8/tests/Leb128Generated6Test.bin";
const WASM_COMPILED_GENERATED7_PATH: &str = "../build/v0.8/tests/Leb128Generated7Test.bin";
const WASM_COMPILED_GENERATED8_PATH: &str = "../build/v0.8/tests/Leb128Generated8Test.bin";
const WASM_COMPILED_GENERATED9_PATH: &str = "../build/v0.8/tests/Leb128Generated9Test.bin";
const WASM_COMPILED_GENERATED10_PATH: &str = "../build/v0.8/tests/Leb128Generated10Test.bin";
const WASM_COMPILED_GENERATED11_PATH: &str = "../build/v0.8/tests/Leb128Generated11Test.bin";
const WASM_COMPILED_GENERATED12_PATH: &str = "../build/v0.8/tests/Leb128Generated12Test.bin";

#[derive(SerdeSerialize, SerdeDeserialize)]
#[serde(transparent)]
pub struct CreateExternalParams(#[serde(with = "strict_bytes")] pub Vec<u8>);

#[test]
fn leb128_tests() {
    println!("Testing Leb128 lib");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

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

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("4439f87ced").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated1_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED1_PATH);

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

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated2_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED2_PATH);

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

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated3_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED3_PATH);

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

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated4_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED4_PATH);

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

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated5_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED5_PATH);

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

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated6_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED6_PATH);

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

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated7_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED7_PATH);

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

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated8_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED8_PATH);

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

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated9_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED9_PATH);

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

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated10_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED10_PATH);

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

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated11_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED11_PATH);

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

    dbg!(&res.failure_info);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    let exec_return: Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}

#[test]
fn leb128_generated12_tests() {
    println!("Testing Leb128 lib with more tests");

    let (mut tester, _manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_GENERATED12_PATH);

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

    dbg!(&res.failure_info);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    let exec_return: Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    let contract_actor_id = exec_return.actor_id;

    println!("Calling `encodeUnsignedLeb128FromUInt64`");

    let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("44cb3dcfa7").unwrap()),
            ..Message::default()
        };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // show gas usage for curiosity
    dbg!(&res.msg_receipt.gas_used);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
}