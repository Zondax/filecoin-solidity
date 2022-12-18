use fvm_integration_tests::tester::{Account, Tester};
use fvm_integration_tests::dummy::DummyExterns;
use fvm_integration_tests::bundle;
use fvm_ipld_encoding::{strict_bytes, tuple::*};
use fvm_shared::state::StateTreeVersion;
use fvm_shared::version::NetworkVersion;
use fvm_shared::econ::TokenAmount;
use fvm_ipld_blockstore::MemoryBlockstore;
use fvm_shared::address::Address;
use std::env;
use fvm_shared::message::Message;
use fvm::executor::{ApplyKind, Executor};
use fil_actor_eam::Return;
use fvm_ipld_encoding::RawBytes;
use fil_actors_runtime::{EAM_ACTOR_ADDR};
use fvm_shared::crypto::signature::Signature;
use std::str::FromStr;
use cid::Cid;
use fvm_shared::piece::PaddedPieceSize;
use fvm_shared::clock::ChainEpoch;
use serde::{de, Deserialize, Deserializer, Serialize, Serializer};
use fvm_ipld_encoding::{BytesSer, Cbor};
use libipld_core::ipld::Ipld;

const WASM_COMPILED_PATH: &str =
   "../../build/v0.8/MarketAPI.bin";

#[derive(Serialize_tuple, Deserialize_tuple)]
pub struct Create2Params {
    #[serde(with = "strict_bytes")]
    pub initcode: Vec<u8>,
    #[serde(with = "strict_bytes")]
    pub salt: [u8; 32],
}

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum Label {
    String(String),
    Bytes(Vec<u8>),
}

/// Serialize the Label like an untagged enum.
impl Serialize for Label {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: Serializer,
    {
        match self {
            Label::String(v) => v.serialize(serializer),
            Label::Bytes(v) => BytesSer(v).serialize(serializer),
        }
    }
}

/// Deserialize the Label like an untagged enum.
impl<'de> Deserialize<'de> for Label {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: Deserializer<'de>,
    {
        Ipld::deserialize(deserializer).and_then(|ipld| ipld.try_into().map_err(de::Error::custom))
    }
}

impl TryFrom<Ipld> for Label {
    type Error = String;

    fn try_from(ipld: Ipld) -> Result<Self, Self::Error> {
        match ipld {
            Ipld::String(s) => Ok(Label::String(s)),
            Ipld::Bytes(b) => Ok(Label::Bytes(b)),
            other => Err(format!("Expected `Ipld::String` or `Ipld::Bytes`, got {:#?}", other)),
        }
    }
}

#[derive(Clone, Debug, PartialEq, Eq, Serialize_tuple, Deserialize_tuple)]
pub struct ClientDealProposal {
    pub proposal: DealProposal,
    pub client_signature: Signature,
}

#[derive(Serialize_tuple, Deserialize_tuple, Debug, Clone, Eq, PartialEq)]
pub struct PublishStorageDealsParams {
    pub deals: Vec<ClientDealProposal>,
}   

#[derive(Clone, Debug, PartialEq, Eq, Serialize_tuple, Deserialize_tuple)]
pub struct DealProposal {
    pub piece_cid: Cid,
    pub piece_size: PaddedPieceSize,
    pub verified_deal: bool,
    pub client: Address,
    pub provider: Address,
    pub label: Label,
    pub start_epoch: ChainEpoch,
    pub end_epoch: ChainEpoch,
    pub storage_price_per_epoch: TokenAmount,
    pub provider_collateral: TokenAmount,
    pub client_collateral: TokenAmount,
}

fn main() {
    println!("Testing solidity API");

    let bs = MemoryBlockstore::default();
    let actors = std::fs::read("../builtin-actors/output/builtin-actors-devnet-wasm.car").expect("Unable to read actor devnet file file");
    let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

    let mut tester =
        Tester::new(NetworkVersion::V18, StateTreeVersion::V5, bundle_root, bs).unwrap();

    let sender: [Account; 1] = tester.create_accounts().unwrap();

    // Our account address is 100 so hex"0064"
    // dbg!(sender[0].1);

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

    println!("Adding a deal!");

    let proposal = DealProposal {
        piece_cid: Cid::from_str("baga6ea4seaqlkg6mss5qs56jqtajg5ycrhpkj2b66cgdkukf2qjmmzz6ayksuci").unwrap(),
        piece_size: PaddedPieceSize(8388608),
        verified_deal: false,
        client: Address::from_str("f01109").unwrap(),
        provider: Address::from_str("f01113").unwrap(),
        label: Label::String("mAXCg5AIg8YBXbFjtdBy1iZjpDYAwRSt0elGLF5GvTqulEii1VcM".to_string()),
        start_epoch: ChainEpoch::from(25245),
        end_epoch: ChainEpoch::from(545150),
        storage_price_per_epoch: TokenAmount::from_atto(1_100_000_000_000_i64),
        provider_collateral: TokenAmount::default(),
        client_collateral: TokenAmount::default(),
    };

    let deal = ClientDealProposal{
        proposal,
        client_signature: Signature::new_secp256k1([0u8;65].to_vec()),
    };

    let params = PublishStorageDealsParams{
        deals: vec![deal],
    };

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 4,
        sequence: 1,
        params: RawBytes::serialize(params).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    dbg!(&res);

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `add_balance`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 1,
        value: TokenAmount::from_atto(1_000),
        params: RawBytes::new(hex::decode("5864467FAFEF000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020065000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `withdraw_balance`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 2,
        params: RawBytes::new(hex::decode("58A46C4162E200000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000000000000000020065000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `get_balance`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 3,
        params: RawBytes::new(hex::decode("58643587a9fd000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020065000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `get_deal_data_commitment`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 4,
        params: RawBytes::new(hex::decode("5824991E04A40000000000000000000000000000000000000000000000000000000000000001").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    // FIXME : "no such deal"
    assert_eq!(res.msg_receipt.exit_code.value(), 33);

    println!("Calling `get_deal_client`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 5,
        params: RawBytes::new(hex::decode("58248b7f02fd0000000000000000000000000000000000000000000000000000000000000001").unwrap()),
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
    //assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "586408c379a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000136163746f72206572726f7220636f646520313700000000000000000000000000");


    println!("Calling `get_deal_provider`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 6,
        params: RawBytes::new(hex::decode("582455d956090000000000000000000000000000000000000000000000000000000000000001").unwrap()),
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
    //assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "586408c379a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000136163746f72206572726f7220636f646520313700000000000000000000000000");


    println!("Calling `get_deal_label`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 7,
        params: RawBytes::new(hex::decode("58249f4b7c7d0000000000000000000000000000000000000000000000000000000000000001").unwrap()),
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
    //assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "586408c379a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000136163746f72206572726f7220636f646520313700000000000000000000000000");


    println!("Calling `get_deal_term`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 8,
        params: RawBytes::new(hex::decode("5824ad36f1840000000000000000000000000000000000000000000000000000000000000001").unwrap()),
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
    //assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "586408c379a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000136163746f72206572726f7220636f646520313700000000000000000000000000");


    println!("Calling `get_deal_total_price`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 9,
        params: RawBytes::new(hex::decode("5824412a4b9a0000000000000000000000000000000000000000000000000000000000000001").unwrap()),
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
    //assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "586408c379a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000136163746f72206572726f7220636f646520313700000000000000000000000000");


    println!("Calling `get_deal_client_collateral`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 10,
        params: RawBytes::new(hex::decode("58248777b7c80000000000000000000000000000000000000000000000000000000000000001").unwrap()),
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
    //assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "586408c379a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000136163746f72206572726f7220636f646520313700000000000000000000000000");


    println!("Calling `get_deal_provider_collateral`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 11,
        params: RawBytes::new(hex::decode("58241a2811e70000000000000000000000000000000000000000000000000000000000000001").unwrap()),
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
    //assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "586408c379a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000136163746f72206572726f7220636f646520313700000000000000000000000000");


    println!("Calling `get_deal_verified`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 12,
        params: RawBytes::new(hex::decode("58245c4ddef30000000000000000000000000000000000000000000000000000000000000001").unwrap()),
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
    //assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "586408c379a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000136163746f72206572726f7220636f646520313700000000000000000000000000");


    println!("Calling `get_deal_activation`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 13,
        params: RawBytes::new(hex::decode("5824f241560c0000000000000000000000000000000000000000000000000000000000000001").unwrap()),
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
    //assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "586408c379a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000136163746f72206572726f7220636f646520313700000000000000000000000000");


    println!("Calling `publish_storage_deals`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 14,
        params: RawBytes::new(hex::decode("58246E65901F0000000000000000000000000000000000000000000000000000000000000001").unwrap()),
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
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "40");
}
