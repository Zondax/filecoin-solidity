#[cfg(test)]
mod tests {
    use bls_signatures::Serialize;
    use cid::Cid;
    use fil_actor_eam::Return;
    use fil_actors_runtime::EAM_ACTOR_ADDR;
    use fil_actor_evm::{Method as EvmMethods};
    use fvm::executor::{ApplyKind, Executor};
    use fvm::state_tree::ActorState;
    use fvm_integration_tests::bundle;
    use fvm_integration_tests::dummy::DummyExterns;
    use fvm_integration_tests::tester::{Account, Tester};
    use fvm_ipld_blockstore::MemoryBlockstore;
    use fvm_ipld_encoding::BytesDe;
    use fvm_ipld_encoding::CborStore;
    use fvm_ipld_encoding::RawBytes;
    use fvm_ipld_encoding::{strict_bytes, tuple::*};
    use fvm_shared::address::Address;
    use fvm_shared::econ::TokenAmount;
    use fvm_shared::message::Message;
    use fvm_shared::sector::RegisteredPoStProof;
    use fvm_shared::state::StateTreeVersion;
    use fvm_shared::version::NetworkVersion;
    use multihash::Code;
    use rand_core::OsRng;
    use std::env;
    use std::str::FromStr;
    use serde::{Deserialize as SerdeDeserialize, Serialize as SerdeSerialize};

    const WASM_COMPILED_PATH: &str = "../build/v0.8/tests/PowerApiTest.bin";

    #[derive(SerdeSerialize, SerdeDeserialize)]
    #[serde(transparent)]
    pub struct CreateExternalParams(#[serde(with = "strict_bytes")] pub Vec<u8>);

    #[derive(Serialize_tuple, Deserialize_tuple, Debug, Clone, Eq, PartialEq)]
    pub struct CreateMinerParams {
        pub owner: Address,
        pub worker: Address,
        pub window_post_proof_type: RegisteredPoStProof,
        #[serde(with = "strict_bytes")]
        pub peer: Vec<u8>,
        pub multiaddrs: Vec<BytesDe>,
    }

    #[test]
    fn power_tests() {
        println!("Testing solidity API");

        let bs = MemoryBlockstore::default();
        let actors = std::fs::read("./builtin-actors/output/builtin-actors-devnet-wasm.car")
            .expect("Unable to read actor devnet file file");
        let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

        let mut tester =
            Tester::new(NetworkVersion::V18, StateTreeVersion::V5, bundle_root, bs).unwrap();

        let sender: [Account; 1] = tester.create_accounts().unwrap();

        /***********************************************
         *
         * Instantiate Account Actor with a BLS address
         *
         ***********************************************/

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
            // CID of Accounts actor. You get this as output from builtin-actors compiling process
            code: Cid::from_str("bafk2bzaceddb65xkjgqgtcsbl2b3istnprim6j3lbf3ywyggxizb6ayzffbqe")
                .unwrap(),
            //code: Cid::from_str("bafk2bzaceddmas33nnn2izdexi5xjzuahzezl62aa5ah5bqwzzjceusskr6ty").unwrap(),
            state: cid,
            sequence: 0,
            balance: TokenAmount::from_whole(1_000_000),
            delegated_address: Some(worker),
        };

        state_tree.set_actor(assigned_addr, actor_state).unwrap();

        // Instantiate machine
        tester.instantiate_machine(DummyExterns).unwrap();

        let executor = tester.executor.as_mut().unwrap();

        println!("Create Miner actor to be able to claim power");

        let constructor_params = CreateMinerParams {
            owner: sender[0].1,
            worker,
            window_post_proof_type: fvm_shared::sector::RegisteredPoStProof::StackedDRGWindow2KiBV1,
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
            sequence: 1,
            params: RawBytes::serialize(constructor_params).unwrap(),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        let exec_return: Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

        println!("Calling `miner_count`");

        let message = Message {
            from: sender[0].1,
            to: Address::new_id(exec_return.actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 2,
            params: RawBytes::new(hex::decode("4487A8D7D6").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(
            hex::encode(res.msg_receipt.return_data.bytes()),
            "58200000000000000000000000000000000000000000000000000000000000000001"
        );

        println!("Calling `network_raw_power`");

        let message = Message {
            from: sender[0].1,
            to: Address::new_id(exec_return.actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 3,
            params: RawBytes::new(hex::decode("446C3D7356").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58800000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");

        println!("Calling `miner_raw_power`");

        let message = Message {
            from: sender[0].1,
            to: Address::new_id(exec_return.actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 4,
            params: RawBytes::new(
                hex::decode(
                    "58245D8543640000000000000000000000000000000000000000000000000000000000000066",
                )
                .unwrap(),
            ),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58c0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");

        println!("Calling `miner_consensus_count`");

        let message = Message {
            from: sender[0].1,
            to: Address::new_id(exec_return.actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 5,
            params: RawBytes::new(hex::decode("44DF16B842").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(
            hex::encode(res.msg_receipt.return_data.bytes()),
            "58200000000000000000000000000000000000000000000000000000000000000000"
        );
    }
}
