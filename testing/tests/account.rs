#[cfg(test)]
mod tests {
    use bls_signatures::Serialize;
    use cid::Cid;
    use fil_actor_eam::Return;
    use fil_actor_evm::{Method as EvmMethods};
    use fil_actors_runtime::EAM_ACTOR_ADDR;
    use fvm::executor::{ApplyKind, Executor};
    use fvm::state_tree::ActorState;
    use fvm_integration_tests::bundle;
    use fvm_integration_tests::dummy::DummyExterns;
    use fvm_integration_tests::tester::{Account, Tester};
    use fvm_ipld_blockstore::MemoryBlockstore;
    use fvm_ipld_encoding::strict_bytes;
    use fvm_ipld_encoding::tuple::*;
    use fvm_ipld_encoding::RawBytes;
    use fvm_ipld_encoding::{serde_bytes, CborStore};
    use fvm_shared::address::Address;
    use fvm_shared::econ::TokenAmount;
    use fvm_shared::message::Message;
    use fvm_shared::state::StateTreeVersion;
    use fvm_shared::version::NetworkVersion;
    use multihash::Code;
    use std::env;
    use std::str::FromStr;
    use serde::{Deserialize as SerdeDeserialize, Serialize as SerdeSerialize};

    const WASM_COMPILED_PATH: &str = "../build/v0.8/tests/AccountApiTest.bin";

    #[derive(SerdeSerialize, SerdeDeserialize)]
    #[serde(transparent)]
    pub struct CreateExternalParams(#[serde(with = "strict_bytes")] pub Vec<u8>);

    #[derive(Debug, Serialize_tuple, Deserialize_tuple)]
    pub struct AuthenticateMessageParams {
        #[serde(with = "serde_bytes")]
        pub signature: Vec<u8>,
        #[serde(with = "serde_bytes")]
        pub message: Vec<u8>,
    }

    #[derive(Serialize_tuple, Deserialize_tuple, PartialEq, Eq, Clone, Debug)]
    pub struct UniversalReceiverParams {
        /// Asset type
        pub type_: u32,
        /// Payload corresponding to asset type
        pub payload: RawBytes,
    }

    #[test]
    fn account_tests() {
        println!("Testing solidity API");

        let bs = MemoryBlockstore::default();
        let actors = std::fs::read("./builtin-actors/output/builtin-actors-devnet-wasm.car")
            .expect("Unable to read actor devnet file");
        let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

        let mut tester =
            Tester::new(NetworkVersion::V18, StateTreeVersion::V5, bundle_root, bs).unwrap();

        let sender: [Account; 1] = tester.create_accounts().unwrap();

        // Instantiate Account Actor with a BLS address (not secure private key! Only use for tests!)
        let bls_private_key_provider = bls_signatures::PrivateKey::new(hex::decode("deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef").unwrap());
        let worker = Address::new_bls(&bls_private_key_provider.public_key().as_bytes()).unwrap();

        let state_tree = tester.state_tree.as_mut().unwrap();
        let assigned_addr = state_tree.register_new_address(&worker).unwrap();
        let state = fvm::account_actor::State { address: worker };

        let cid = state_tree
            .store()
            .put_cbor(&state, Code::Blake2b256)
            .unwrap();

        let actor_state = ActorState {
            // CID of Accounts actor. You get this as output from builtin-actors compiling process
            code: Cid::from_str("bafk2bzaced4egdjgpdpxgg37rz7zrqegwioeqbeo7gfw3a4il6tkdrssfjsoy").unwrap(),
            //code: Cid::from_str("bafk2bzaceanfxc6rtvtyjv2wk3ud4cx7qb6iwgif55sq43htuea2gtgfcbd22").unwrap(),
            state: cid,
            sequence: 0,
            balance: TokenAmount::from_whole(1_000_000),
            delegated_address: Some(worker),
        };

        state_tree.set_actor(assigned_addr, actor_state).unwrap();

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
        let actor_id = exec_return.actor_id;

        println!("Calling `authenticate_message`");

        let sig = bls_private_key_provider.sign(hex::decode("8bd82a5828000181e203922020b51bcc94bb0977c984c093770289dea4e83ef08c355145d412c6673e06152a091a00800000f45831039216096d4dbc72ebdb22d0c8bd4af3f40e4396592200a95300d7ce319fb740048e01eece7a181cdad6fbe25374a9cb4542006778346d41584367354149673859425862466a7464427931695a6a704459417752537430656c474c463547765471756c4569693156634d19629d1a0008517e470001001d1bf8004800038d7ea4c680004800038d7ea4c68000").unwrap());
        dbg!(hex::encode(sig.as_bytes()));
        dbg!(hex::encode(worker.to_bytes()));

        // create message
        let message = Message {
            from: sender[0].1,
            to: Address::new_id(actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            // target: 0x0x0390a40613dfb06445dfc3759ec22146d66b832afe57b4ac441e5209d154131b1540e937cb837831855553e17eefeeeed1(assigned_addr), params: ["0x8eabea2a4001061ac4c9fe3c517725b8829b159149a863b2a2320cc628d026a871d3cb34947371f384a9eb49ff9bd56a019fa70e10c06ac5ca93df3c1d6f54d540c57cbe2f5209cafdc12146d5d59172dd4d8359015e10584fa6327de0ce5a6a", "0x8bd82a5828000181e203922020b51bcc94bb0977c984c093770289dea4e83ef08c355145d412c6673e06152a091a00800000f45831039216096d4dbc72ebdb22d0c8bd4af3f40e4396592200a95300d7ce319fb740048e01eece7a181cdad6fbe25374a9cb4542006778346d41584367354149673859425862466a7464427931695a6a704459417752537430656c474c463547765471756c4569693156634d19629d1a0008517e470001001d1bf8004800038d7ea4c680004800038d7ea4c68000"]
            params: RawBytes::new(hex::decode("59026443B41668000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000A000000000000000000000000000000000000000000000000000000000000000310390A40613DFB06445DFC3759EC22146D66B832AFE57B4AC441E5209D154131B1540E937CB837831855553E17EEFEEEED1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000C000000000000000000000000000000000000000000000000000000000000000608EABEA2A4001061AC4C9FE3C517725B8829B159149A863B2A2320CC628D026A871D3CB34947371F384A9EB49FF9BD56A019FA70E10C06AC5CA93DF3C1D6F54D540C57CBE2F5209CAFDC12146D5D59172DD4D8359015E10584FA6327DE0CE5A6A00000000000000000000000000000000000000000000000000000000000000C18BD82A5828000181E203922020B51BCC94BB0977C984C093770289DEA4E83EF08C355145D412C6673E06152A091A00800000F45831039216096D4DBC72EBDB22D0C8BD4AF3F40E4396592200A95300D7CE319FB740048E01EECE7A181CDAD6FBE25374A9CB4542006778346D41584367354149673859425862466A7464427931695A6A704459417752537430656C474C463547765471756C4569693156634D19629D1A0008517E470001001D1BF8004800038D7EA4C680004800038D7EA4C6800000000000000000000000000000000000000000000000000000000000000000").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        dbg!(&res);
        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        println!("Calling `universal_receiver_hook`");

        let message = Message {
            from: sender[0].1,
            to: Address::new_id(actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 2,
            // target: 0x0x0390a40613dfb06445dfc3759ec22146d66b832afe57b4ac441e5209d154131b1540e937cb837831855553e17eefeeeed1(assigned_addr), params: UniversalReceiverParams{0, RawBytes([0,1,2])}
            params: RawBytes::new(hex::decode("5901249EDDCE1C000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000A000000000000000000000000000000000000000000000000000000000000000310390A40613DFB06445DFC3759EC22146D66B832AFE57B4AC441E5209D154131B1540E937CB837831855553E17EEFEEEED10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000030102030000000000000000000000000000000000000000000000000000000000").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
    }

}
