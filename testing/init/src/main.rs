use fvm_integration_tests::tester::{Account, Tester};
use fvm_integration_tests::dummy::DummyExterns;
use fvm_integration_tests::bundle;
use fvm_ipld_encoding::{strict_bytes, tuple::*};
use fvm_shared::state::StateTreeVersion;
use fvm_shared::version::NetworkVersion;
use fvm_ipld_blockstore::MemoryBlockstore;
use std::env;
use fvm_shared::message::Message;
use fvm::executor::{ApplyKind, Executor};
use fil_actor_eam::Return;
use fvm_ipld_encoding::RawBytes;
use fil_actors_runtime::{EAM_ACTOR_ADDR};
use fvm_shared::address::Address;
use cid::Cid;
use std::str::FromStr;

const WASM_COMPILED_PATH: &str =
   "../../build/v0.8/tests/InitApiTest.bin";

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

    println!("Calling `exec`");

    //let multisig_cid = Cid::from_str("bafk2bzaceawblu7i2c2ghriamzkiqixbt6fcvvs2ka3kn5q7xgpd7rijlyauu").unwrap();
    let multisig_cid = Cid::from_str("bafk2bzacecwtqcftyz3y2yqdyiuo5vxp2fgvpk72e2cdso2whyblx2jetx774").unwrap();
    dbg!(hex::encode(multisig_cid.to_bytes()));

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 1,
        params: RawBytes::new(hex::decode("59012408853AFC0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000A00000000000000000000000000000000000000000000000000000000000000027000155a0e40220ad3808b3c6778d6203c228eed6efd14d57abfa2684393b563e02bbe9249dfffe000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000031848255011EAF1C8A4BBFEEB0870B1745B1F57503470B71165501DFE49184D46ADC8F89D44638BEB45F78FCAD2590010000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58e000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001502a526fc35cb62e5b1810ab92c02e0b37c8e7f47dd0000000000000000000000");

    println!("Calling `exec4`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 2,
        params: RawBytes::new(hex::decode("5901A4782128310000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000C000000000000000000000000000000000000000000000000000000000000001400000000000000000000000000000000000000000000000000000000000000027000155a0e40220ad3808b3c6778d6203c228eed6efd14d57abfa2684393b563e02bbe9249dfffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005F82D82A5827000155A0E402204EB19534C71DDAFC0C89DFD7E8D9AEA0EEEBFD4D27C00DA1C3FBE2DD56C74A035831848255011EAF1C8A4BBFEEB0870B1745B1F57503470B71165501DFE49184D46ADC8F89D44638BEB45F78FCAD2590010000000000000000000000000000000000000000000000000000000000000000000006666F6F6261720000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();



    // FIXME: "caller f0101 of method 3 must be built-in"
    // However there is no exported method for EXEC4 yet. Tests cant pass until the builtin-actors export the exec4 method.
    assert_eq!(res.msg_receipt.exit_code.value(), 33);

}
