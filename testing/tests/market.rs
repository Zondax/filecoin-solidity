use bls_signatures::Serialize;
use cid::Cid;
use fil_actor_eam::Return;
use fil_actor_evm::Method as EvmMethods;
use fil_actors_runtime::{
    runtime::builtins, EAM_ACTOR_ADDR, REWARD_ACTOR_ADDR, STORAGE_MARKET_ACTOR_ADDR,
    STORAGE_POWER_ACTOR_ADDR, SYSTEM_ACTOR_ADDR,
};
use fvm::executor::{ApplyKind, Executor};
use fvm::state_tree::ActorState;
use fvm_integration_tests::dummy::DummyExterns;
use fvm_integration_tests::tester::Account;
use fvm_ipld_encoding::BytesDe;
use fvm_ipld_encoding::BytesSer;
use fvm_ipld_encoding::CborStore;
use fvm_ipld_encoding::RawBytes;
use fvm_ipld_encoding::{serde_bytes, strict_bytes, tuple::*};
use fvm_shared::address::Address;
use fvm_shared::clock::ChainEpoch;
use fvm_shared::crypto::signature::Signature;
use fvm_shared::econ::TokenAmount;
use fvm_shared::message::Message;
use fvm_shared::piece::PaddedPieceSize;
use fvm_shared::sector::RegisteredPoStProof;
use libipld_core::ipld::Ipld;
use multihash::Code;
use rand_core::OsRng;
use serde::{Deserialize as SerdeDeserialize, Serialize as SerdeSerialize};
use std::str::FromStr;

use testing::helpers;
use testing::parse_gas;
use testing::setup;
use testing::GasResult;

const WASM_COMPILED_PATH: &str = "../build/v0.8/tests/MarketApiTest.bin";

#[derive(SerdeSerialize, SerdeDeserialize)]
#[serde(transparent)]
pub struct CreateExternalParams(#[serde(with = "strict_bytes")] pub Vec<u8>);

#[derive(Clone, Debug, PartialEq, Eq)]
pub enum Label {
    String(String),
    Bytes(Vec<u8>),
}

/// Serialize the Label like an untagged enum.
impl serde::Serialize for Label {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: serde::Serializer,
    {
        match self {
            Label::String(v) => v.serialize(serializer),
            Label::Bytes(v) => BytesSer(v).serialize(serializer),
        }
    }
}

/// Deserialize the Label like an untagged enum.
impl<'de> serde::Deserialize<'de> for Label {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: serde::Deserializer<'de>,
    {
        Ipld::deserialize(deserializer)
            .and_then(|ipld| ipld.try_into().map_err(serde::de::Error::custom))
    }
}

impl TryFrom<Ipld> for Label {
    type Error = String;

    fn try_from(ipld: Ipld) -> Result<Self, Self::Error> {
        match ipld {
            Ipld::String(s) => Ok(Label::String(s)),
            Ipld::Bytes(b) => Ok(Label::Bytes(b)),
            other => Err(format!(
                "Expected `Ipld::String` or `Ipld::Bytes`, got {:#?}",
                other
            )),
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

#[derive(Serialize_tuple, Deserialize_tuple, Debug, Clone, Eq, PartialEq)]
pub struct CreateMinerParams {
    pub owner: Address,
    pub worker: Address,
    pub window_post_proof_type: RegisteredPoStProof,
    #[serde(with = "strict_bytes")]
    pub peer: Vec<u8>,
    pub multiaddrs: Vec<BytesDe>,
}

pub const AUTHENTICATE_MESSAGE_METHOD: u64 = 2643134072;

#[derive(Serialize_tuple, Deserialize_tuple)]
pub struct AuthenticateMessageParams {
    #[serde(with = "serde_bytes")]
    pub signature: Vec<u8>,
    #[serde(with = "serde_bytes")]
    pub message: Vec<u8>,
}

#[test]
fn market_tests() {
    println!("Testing solidity API");

    let mut gas_result: GasResult = vec![];
    let (mut tester, manifest) = setup::setup_tester();

    let sender: [Account; 1] = tester.create_accounts().unwrap();
    //let client: [Account; 1] = tester.create_accounts().unwrap();

    // Set storagemarket actor
    let state_tree = tester.state_tree.as_mut().unwrap();
    helpers::set_storagemarket_actor(
        state_tree,
        *manifest.code_by_id(builtins::Type::Market as u32).unwrap(),
    )
    .unwrap();
    // Set storagepower actor
    helpers::set_storagepower_actor(
        state_tree,
        *manifest.code_by_id(builtins::Type::Power as u32).unwrap(),
    )
    .unwrap();
    helpers::set_reward_actor(
        state_tree,
        *manifest.code_by_id(builtins::Type::Reward as u32).unwrap(),
    )
    .unwrap();

    /***********************************************
     *
     * Instantiate Account Actor with a BLS address
     *
     ***********************************************/
    let bls_private_key_client = bls_signatures::PrivateKey::new(
        hex::decode("deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef").unwrap(),
    );
    let client = Address::new_bls(&bls_private_key_client.public_key().as_bytes()).unwrap();

    let state_tree = tester.state_tree.as_mut().unwrap();
    let assigned_addr = state_tree.register_new_address(&client).unwrap();
    let state = fvm::account_actor::State { address: client };

    let cid = state_tree
        .store()
        .put_cbor(&state, Code::Blake2b256)
        .unwrap();

    let actor_state = ActorState {
        code: *manifest.get_account_code(),
        state: cid,
        sequence: 0,
        balance: TokenAmount::from_whole(1_000_000),
        delegated_address: Some(client),
    };

    state_tree.set_actor(assigned_addr, actor_state).unwrap();

    let bls_private_key_provider = bls_signatures::PrivateKey::generate(&mut OsRng);
    let worker = Address::new_bls(&bls_private_key_provider.public_key().as_bytes()).unwrap();

    let state_tree = tester.state_tree.as_mut().unwrap();
    let assigned_addr = state_tree.register_new_address(&worker).unwrap();
    let state = fvm::account_actor::State { address: worker };

    let cid = state_tree
        .store()
        .put_cbor(&state, Code::Blake2b256)
        .unwrap();

    let actor_state = ActorState {
        code: *manifest.get_account_code(),
        state: cid,
        sequence: 0,
        balance: TokenAmount::from_whole(1_000_000),
        delegated_address: Some(worker),
    };

    state_tree.set_actor(assigned_addr, actor_state).unwrap();

    // Create embryo address to deploy the contract on it (assign some FILs to it)
    let tmp = hex::decode("DAFEA492D9c6733ae3d56b7Ed1ADB60692c98Bc5").unwrap();
    let embryo_eth_address = tmp.as_slice();
    let embryo_delegated_address = Address::new_delegated(10, embryo_eth_address).unwrap();
    tester
        .create_placeholder(&embryo_delegated_address, TokenAmount::from_whole(100))
        .unwrap();

    dbg!(hex::encode(&embryo_delegated_address.to_bytes()));

    // Instantiate machine
    tester.instantiate_machine(DummyExterns).unwrap();

    let executor = tester.executor.as_mut().unwrap();

    // Try to call "constructor"
    println!("Try to call constructor on storage power actor");

    let message = Message {
        from: SYSTEM_ACTOR_ADDR,
        to: STORAGE_POWER_ACTOR_ADDR,
        gas_limit: 1000000000,
        method_num: 1,
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Implicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    // Try to call "constructor"
    println!("Try to call constructor on storage market actor");

    let message = Message {
        from: SYSTEM_ACTOR_ADDR,
        to: STORAGE_MARKET_ACTOR_ADDR,
        gas_limit: 1000000000,
        method_num: 1,
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Implicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    // Try to call "constructor"
    println!("Try to call constructor on reward actor");

    let message = Message {
        from: SYSTEM_ACTOR_ADDR,
        to: REWARD_ACTOR_ADDR,
        gas_limit: 1000000000,
        params: RawBytes::new(vec![0]), // I have to send the power start value (0)
        method_num: 1,
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Implicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Create Miner actor to be able to publish deal");

    let constructor_params = CreateMinerParams {
        owner: sender[0].1,
        worker,
        window_post_proof_type: fvm_shared::sector::RegisteredPoStProof::StackedDRGWindow32GiBV1,
        peer: vec![1, 2, 3],
        multiaddrs: vec![BytesDe(vec![1, 2, 3])],
    };

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(4),
        gas_limit: 1000000000,
        method_num: 2,
        params: RawBytes::serialize(constructor_params).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling init actor (EVM)");

    let evm_bin = setup::load_evm(WASM_COMPILED_PATH);

    let constructor_params = CreateExternalParams(evm_bin);

    let message = Message {
        from: embryo_delegated_address,
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

    println!("Adding a deal!");

    let proposal = DealProposal {
        piece_cid: Cid::from_str(
            "baga6ea4seaqlkg6mss5qs56jqtajg5ycrhpkj2b66cgdkukf2qjmmzz6ayksuci",
        )
        .unwrap(),
        piece_size: PaddedPieceSize(8388608),
        verified_deal: false,
        client: client,
        provider: Address::new_id(104),
        label: Label::String("mAXCg5AIg8YBXbFjtdBy1iZjpDYAwRSt0elGLF5GvTqulEii1VcM".to_string()),
        start_epoch: ChainEpoch::from(25245),
        end_epoch: ChainEpoch::from(545150),
        storage_price_per_epoch: TokenAmount::from_atto(1_100_000_000_000_i64),
        provider_collateral: TokenAmount::from_atto(1_000_000_000_000_000_i64),
        client_collateral: TokenAmount::from_atto(1_000_000_000_000_000_i64),
    };

    let deal = RawBytes::serialize(&proposal).unwrap();
    let sig = bls_private_key_client.sign(deal.to_vec());

    dbg!("serialized deal {}", hex::encode(deal.to_vec()));
    dbg!("sig deal {}", hex::encode(sig.as_bytes()));

    let params = AuthenticateMessageParams {
        signature: sig.as_bytes(),
        message: deal.to_vec(),
    };

    let message = Message {
        from: client, // from need to be the miner
        to: client,
        gas_limit: 1000000000,
        method_num: AUTHENTICATE_MESSAGE_METHOD,
        sequence: 0,
        params: RawBytes::serialize(params).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    let message = Message {
        from: client,
        to: Address::new_id(5),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 1,
        value: TokenAmount::from_whole(100),
        params: RawBytes::serialize(client).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    let message = Message {
        from: worker,
        to: Address::new_id(5),
        gas_limit: 1000000000,
        method_num: 2,
        sequence: 0,
        value: TokenAmount::from_whole(100_000),
        params: RawBytes::serialize(Address::new_id(104)).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    // We need to add our solidity contract as a control address

    dbg!(&exec_return.actor_id);

    let params = fil_actor_miner::ChangeWorkerAddressParams {
        new_worker: worker,
        new_control_addresses: vec![Address::new_id(exec_return.actor_id)],
    };

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(104),
        gas_limit: 1000000000,
        method_num: fil_actor_miner::Method::ChangeWorkerAddress as u64,
        sequence: 1,
        params: RawBytes::serialize(params).unwrap(),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    /*let deal = ClientDealProposal {
        proposal,
        client_signature: Signature::new_bls(sig.as_bytes()),
    };

    let params = PublishStorageDealsParams { deals: vec![deal] };

    let message = Message {
        from: worker, // from need to be the miner
        to: Address::new_id(5),
        gas_limit: 1000000000,
        method_num: 4,
        sequence: 1,
        params: RawBytes::serialize(params).unwrap(),
        //params: RawBytes::new(hex::decode("8181828bd82a5828000181e2039220206b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b190800f4420068420066656c6162656c0a1a0008ca0a42000a42000a42000a584d028bd82a5828000181e2039220206b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b190800f4420068420066656c6162656c0a1a0008ca0a42000a42000a42000a").unwrap()),
        ..Message::default()
    };*/

    println!("Calling `publish_storage_deals`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 2,
        params: RawBytes::new(
            // [[[[["0x000181E203922020B51BCC94BB0977C984C093770289DEA4E83EF08C355145D412C6673E06152A09"], 8388608, false, ["0x0390A40613DFB06445DFC3759EC22146D66B832AFE57B4AC441E5209D154131B1540E937CB837831855553E17EEFEEEED1"], ["0x0068"], ["0x6d41584367354149673859425862466a7464427931695a6a704459417752537430656c474c463547765471756c4569693156634d", true], 25245, 545150, ["0x01001D1BF800", false], ["0x038D7EA4C68000", false], ["0x038D7EA4C68000", false]], "0x02B7E4AD239896D5DF3491AFE01F9A6F9D5C4A1E59C16E6B386CE16797C00A1224D5ABB8EFE0EDC7B052FC0AB5772BA4DA10C064537320FEFCADA4167017508D882207B23DD457966DAF21393710A26CC5509AC079EC9A0846028B279435BD5F22" ]]]
            hex::decode(
                "5906443b61c67200000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000052000000000000000000000000000000000000000000000000000000000000001600000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E0000000000000000000000000000000000000000000000000000000000000026000000000000000000000000000000000000000000000000000000000000002C0000000000000000000000000000000000000000000000000000000000000629D000000000000000000000000000000000000000000000000000000000008517E000000000000000000000000000000000000000000000000000000000000036000000000000000000000000000000000000000000000000000000000000003E0000000000000000000000000000000000000000000000000000000000000046000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000028000181E203922020B51BCC94BB0977C984C093770289DEA4E83EF08C355145D412C6673E06152A09000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000310390A40613DFB06445DFC3759EC22146D66B832AFE57B4AC441E5209D154131B1540E937CB837831855553E17EEFEEEED10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000200680000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000346D41584367354149673859425862466A7464427931695A6A704459417752537430656C474C463547765471756C4569693156634D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000601001D1BF8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007038D7EA4C6800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007038D7EA4C6800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006102B7E4AD239896D5DF3491AFE01F9A6F9D5C4A1E59C16E6B386CE16797C00A1224D5ABB8EFE0EDC7B052FC0AB5772BA4DA10C064537320FEFCADA4167017508D882207B23DD457966DAF21393710A26CC5509AC079EC9A0846028B279435BD5F2200000000000000000000000000000000000000000000000000000000000000",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("publish_storage_deals".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);

    println!("Calling `add_balance`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 3,
        value: TokenAmount::from_atto(1_000),
        params: RawBytes::new(hex::decode("58A44DFAD08C00000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000064000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020069000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("add_balance".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "40");

    println!("Calling `withdraw_balance`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 4,
        params: RawBytes::new(hex::decode("590144D3C69C430000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000A00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000200690000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016400000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("withdraw_balance".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58a000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016400000000000000000000000000000000000000000000000000000000000000");

    println!("Calling `get_balance`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 5,
        params: RawBytes::new(hex::decode("5884C961F5430000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020065000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("get_balance".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "5901600000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009056bc75e2d63100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000807f3556c02eb7800000000000000000000000000000000000000000000000000");

    println!("Calling `get_deal_data_commitment`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 6,
        params: RawBytes::new(
            hex::decode(
                "5824915BD52A0000000000000000000000000000000000000000000000000000000000000000",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("get_deal_data_commitment".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58c00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000000028000181e203922020b51bcc94bb0977c984c093770289dea4e83ef08c355145d412c6673e06152a09000000000000000000000000000000000000000000000000");

    println!("Calling `get_deal_client`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 7,
        params: RawBytes::new(
            hex::decode(
                "5824AABB67B40000000000000000000000000000000000000000000000000000000000000000",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();

    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("get_deal_client".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(
        hex::encode(res.msg_receipt.return_data.bytes()),
        "58200000000000000000000000000000000000000000000000000000000000000065"
    );

    println!("Calling `get_deal_provider`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 8,
        params: RawBytes::new(
            hex::decode(
                "58240E2F33670000000000000000000000000000000000000000000000000000000000000000",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();
    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("get_deal_provider".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(
        hex::encode(res.msg_receipt.return_data.bytes()),
        "58200000000000000000000000000000000000000000000000000000000000000068"
    );

    println!("Calling `get_deal_label`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 9,
        params: RawBytes::new(
            hex::decode(
                "5824B6D312EA0000000000000000000000000000000000000000000000000000000000000000",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();
    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("get_deal_label".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58c000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000346d41584367354149673859425862466a7464427931695a6a704459417752537430656c474c463547765471756c4569693156634d000000000000000000000000");

    println!("Calling `get_deal_term`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 10,
        params: RawBytes::new(
            hex::decode(
                "58249CFC4C330000000000000000000000000000000000000000000000000000000000000000",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();
    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("get_deal_term".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "5840000000000000000000000000000000000000000000000000000000000000629d000000000000000000000000000000000000000000000000000000000007eee1");

    println!("Calling `get_deal_total_price`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 11,
        params: RawBytes::new(
            hex::decode(
                "5824614C34150000000000000000000000000000000000000000000000000000000000000000",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();
    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("get_deal_total_price".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58a0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000807efc7ed5e24f800000000000000000000000000000000000000000000000000");

    println!("Calling `get_deal_client_collateral`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 12,
        params: RawBytes::new(
            hex::decode(
                "5824D5E7B9DB0000000000000000000000000000000000000000000000000000000000000000",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();
    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("get_deal_client_collateral".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007038d7ea4c6800000000000000000000000000000000000000000000000000000");

    println!("Calling `get_deal_provider_collateral`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 13,
        params: RawBytes::new(
            hex::decode(
                "58242F2229FE0000000000000000000000000000000000000000000000000000000000000000",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();
    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("get_deal_provider_collateral".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58a00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007038d7ea4c6800000000000000000000000000000000000000000000000000000");

    println!("Calling `get_deal_verified`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 14,
        params: RawBytes::new(
            hex::decode(
                "58243219A6290000000000000000000000000000000000000000000000000000000000000000",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();
    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("get_deal_verified".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(
        hex::encode(res.msg_receipt.return_data.bytes()),
        "58200000000000000000000000000000000000000000000000000000000000000000"
    );

    println!("Calling `get_deal_activation`");

    let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 15,
        params: RawBytes::new(
            hex::decode(
                "5824F5C036580000000000000000000000000000000000000000000000000000000000000000",
            )
            .unwrap(),
        ),
        ..Message::default()
    };

    let res = executor
        .execute_message(message, ApplyKind::Explicit, 100)
        .unwrap();
    let gas_used = parse_gas(res.exec_trace);
    gas_result.push(("get_deal_activation".into(), gas_used));
    assert_eq!(res.msg_receipt.exit_code.value(), 0);
    assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "584000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");

    let table = testing::create_gas_table(gas_result);
    testing::save_gas_table(&table, "market");

    table.printstd();
}
