use fil_actor_eam::Return;
use fil_actor_evm::Method as EvmMethods;
use fil_actors_runtime::{runtime::builtins, EAM_ACTOR_ADDR};
use fvm::executor::{ApplyKind, Executor};
use fvm_integration_tests::dummy::DummyExterns;
use fvm_integration_tests::tester::Account;
use fvm_ipld_encoding::strict_bytes;
use fvm_ipld_encoding::RawBytes;
use fvm_shared::address::Address;
use fvm_shared::message::Message;
use serde::{Deserialize as SerdeDeserialize, Serialize as SerdeSerialize};

use testing::setup;
use testing::GasResult;

const WASM_COMPILED_PATH: &str = "../build/v0.8/tests/InitApiTest.bin";

#[derive(SerdeSerialize, SerdeDeserialize)]
#[serde(transparent)]
pub struct CreateExternalParams(#[serde(with = "strict_bytes")] pub Vec<u8>);

#[test]
fn init_tests() {
    println!("Testing solidity API");

    let mut gas_result: GasResult = vec![];

    let (mut tester, manifest) = setup::setup_tester();

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
        params: RawBytes::serialize(constructor_params).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    let exec_return: Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

    println!("Calling `exec`");

    //let multisig_cid = Cid::from_str("bafk2bzaceawblu7i2c2ghriamzkiqixbt6fcvvs2ka3kn5q7xgpd7rijlyauu").unwrap();
    let multisig_cid = *manifest
        .code_by_id(builtins::Type::Multisig as u32)
        .unwrap();
    // This value is used as input data for the exec contract call down below
    dbg!(hex::encode(multisig_cid.to_bytes()));

    let mulstisig_cid_hex = hex::encode(multisig_cid.to_bytes());
    let mut params = "".to_owned();

    params.push_str("59012408853AFC0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000A0000000000000000000000000000000000000000000000000000000000000002700");
    params.push_str(mulstisig_cid_hex.as_str());
    params.push_str("000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000031848255011EAF1C8A4BBFEEB0870B1745B1F57503470B71165501DFE49184D46ADC8F89D44638BEB45F78FCAD2590010000000000000000000000000000000000");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 1,
        params: RawBytes::new(hex::decode(params).unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    gas_result.push(("exec".into(), res.msg_receipt.gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58e000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001502a526fc35cb62e5b1810ab92c02e0b37c8e7f47dd0000000000000000000000");

    println!("Calling `exec4`");

    let mut params = "".to_owned();

    params.push_str("5901A4782128310000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000C00000000000000000000000000000000000000000000000000000000000000140000000000000000000000000000000000000000000000000000000000000002700");
    params.push_str(mulstisig_cid_hex.as_str());
    params.push_str("00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005F82D82A5827000155A0E402204EB19534C71DDAFC0C89DFD7E8D9AEA0EEEBFD4D27C00DA1C3FBE2DD56C74A035831848255011EAF1C8A4BBFEEB0870B1745B1F57503470B71165501DFE49184D46ADC8F89D44638BEB45F78FCAD2590010000000000000000000000000000000000000000000000000000000000000000000006666F6F6261720000000000000000000000000000000000000000000000000000");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 2,
        params: RawBytes::new(hex::decode(params).unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    gas_result.push(("exec4".into(), res.msg_receipt.gas_used));

    // FIXME: "caller f0101 of method 3 must be built-in"
    // However there is no exported method for EXEC4 yet. Tests cant pass until the builtin-actors export the exec4 method.
    assert_eq!(res.msg_receipt.exit_code.value(), 33);

    let table = testing::create_gas_table(gas_result);
    testing::save_gas_table(&table, "init");

    table.printstd();
}
