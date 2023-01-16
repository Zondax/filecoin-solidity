#[cfg(test)]
mod tests {
    use bls_signatures::Serialize;
    use cid::Cid;
    use fil_actor_eam::Return;
    use fil_actor_init::ExecReturn;
    use fil_actor_evm::{Method as EvmMethods};
    use fil_actors_runtime::{EAM_ACTOR_ADDR, INIT_ACTOR_ADDR};
    use fvm::executor::{ApplyKind, Executor};
    use fvm::state_tree::ActorState;
    use fvm_integration_tests::bundle;
    use fvm_integration_tests::dummy::DummyExterns;
    use fvm_integration_tests::tester::{Account, Tester};
    use fvm_ipld_blockstore::MemoryBlockstore;
    use fvm_ipld_encoding::CborStore;
    use fvm_ipld_encoding::RawBytes;
    use fvm_ipld_encoding::{strict_bytes, tuple::*, BytesDe};
    use fvm_shared::address::Address;
    use fvm_shared::econ::TokenAmount;
    use fvm_shared::message::Message;
    use fvm_shared::state::StateTreeVersion;
    use fvm_shared::version::NetworkVersion;
    use multihash::Code;
    use rand_core::OsRng;
    use std::env;
    use std::str::FromStr;
    use serde::{Deserialize as SerdeDeserialize, Serialize as SerdeSerialize};

    const WASM_COMPILED_PATH: &str = "../build/v0.8/tests/MinerApiTest.bin";

    #[derive(Serialize_tuple, Deserialize_tuple, Clone, Debug)]
    struct State {
        empty: bool,
    }

    #[derive(SerdeSerialize, SerdeDeserialize)]
    #[serde(transparent)]
    pub struct CreateExternalParams(#[serde(with = "strict_bytes")] pub Vec<u8>);

    #[test]
    fn miner_tests() {
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

        let bls_private_key = bls_signatures::PrivateKey::generate(&mut OsRng);
        let worker = Address::new_bls(&bls_private_key.public_key().as_bytes()).unwrap();

        let state_tree = tester.state_tree.as_mut().unwrap();
        let assigned_addr = state_tree.register_new_address(&worker).unwrap();
        let state = fvm::account_actor::State { address: worker };

        let cid = state_tree
            .store()
            .put_cbor(&state, Code::Blake2b256)
            .unwrap();

        let actor_state = ActorState {
            // CID of Accounts actor. You get this as output from builtin-actors compiling process
            code: Cid::from_str("bafk2bzaced4egdjgpdpxgg37rz7zrqegwioeqbeo7gfw3a4il6tkdrssfjsoy")
                .unwrap(),
            //code: Cid::from_str("bafk2bzaceddmas33nnn2izdexi5xjzuahzezl62aa5ah5bqwzzjceusskr6ty").unwrap(),
            state: cid,
            sequence: 0,
            balance: TokenAmount::from_atto(10000),
            delegated_address: Some(worker),
        };

        state_tree.set_actor(assigned_addr, actor_state).unwrap();
        // Instantiate machine
        tester.instantiate_machine(DummyExterns).unwrap();

        let executor = tester.executor.as_mut().unwrap();

        /**************************
         *
         * Machine instantiated
         *
         **************************/

        println!("Create Miner actor for solidity contract to interact with");

        let constructor_params = fil_actor_miner::MinerConstructorParams {
            owner: Address::new_id(103),
            worker,
            control_addresses: vec![],
            window_post_proof_type: fvm_shared::sector::RegisteredPoStProof::StackedDRGWindow2KiBV1,
            peer_id: vec![1, 2, 3],
            multi_addresses: vec![BytesDe(vec![1, 2, 3])],
        };

        let exec_params = fil_actor_init::ExecParams {
            // CID of StorageMiner actor. You get this as output from builtin-actors compiling process
            code_cid: Cid::from_str(
                "bafk2bzacebamubpsj66pspk2idx6bdx4uoephg565rjfvkbiwjibhyoilej4y",
            )
            .unwrap(),
            //code_cid: Cid::from_str("bafk2bzacea5ua7isdc4nx3huvbgsjdikfkxj2mhwveuyvtxtk5techk5rddl6").unwrap(),
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

        let exec_return: ExecReturn = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

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

        println!("Calling `change_owner_address`");

        dbg!(&sender[0]);

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 2,
        params: RawBytes::new(hex::decode("58C4F8CD5D3F000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000002006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "40");

        println!("Calling `get_beneficiary`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 3,
        params: RawBytes::new(hex::decode("586435275164000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "5903200000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000001e00000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000020067000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");

        println!("Calling `change_beneficiary`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 4,
        params: RawBytes::new(hex::decode("5901A449108B4A0000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000A0000000000000000000000000000000000000000000000000000000000000007B0000000000000000000000000000000000000000000000000000000000000002006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000204BC000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "40");

        println!("Calling `get_owner`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 5,
        params: RawBytes::new(hex::decode("586453B821C9000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58e00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000002006700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000");

        println!("Calling `get_available_balance`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 6,
        params: RawBytes::new(hex::decode("5864D8D0FF21000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58a000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");

        println!("Calling `get_vesting_funds`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 7,
        params: RawBytes::new(hex::decode("5864E5D427D0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "5860000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000");

        println!("Calling `repay_debt`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 8,
        params: RawBytes::new(hex::decode("58647F730B26000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "40");

        println!("Calling `confirm_change_worker_address`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 9,
        params: RawBytes::new(hex::decode("5864B8F72D5D000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "40");

        println!("Calling `get_peer_id`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 10,
        params: RawBytes::new(hex::decode("5864D4FD0ECF000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58800000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000030102030000000000000000000000000000000000000000000000000000000000");

        println!("Calling `get_multiaddresses`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 11,
        params: RawBytes::new(hex::decode("5864A3F6D8EC000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "58c0000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000030102030000000000000000000000000000000000000000000000000000000000");

        println!("Calling `change_worker_address`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 12,
        params: RawBytes::new(hex::decode("590124DAF85095000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000002006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000200650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "40");

        println!("Calling `is_controlling_address`");

        let message = Message {
       from: sender[0].1,
       to: Address::new_id(exec_return.actor_id),
       gas_limit: 1000000000,
       method_num: EvmMethods::InvokeContract as u64,
       sequence: 13,
       params: RawBytes::new(hex::decode("58C4F7EDD9D0000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000002006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
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

        println!("Calling `get_sector_size`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 14,
        params: RawBytes::new(hex::decode("58646EE4C7AE000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(
            hex::encode(res.msg_receipt.return_data.bytes()),
            "58200000000000000000000000000000000000000000000000000000000000000800"
        );

        println!("Calling `change_multiaddresses`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 15,
        params: RawBytes::new(hex::decode("590184AF96EC93000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000002006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000002006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "40");

        println!("Calling `change_peer_id`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 16,
        params: RawBytes::new(hex::decode("58E4525011E70000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "40");

        println!("Calling `withdraw_balance`");

        let message = Message {
        from: sender[0].1,
        to: Address::new_id(exec_return.actor_id),
        gas_limit: 1000000000,
        method_num: EvmMethods::InvokeContract as u64,
        sequence: 17,
        params: RawBytes::new(hex::decode("58E4F0F04C120000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000020066000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000020100000000000000000000000000000000000000000000000000000000000000").unwrap()),
        ..Message::default()
    };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
        assert_eq!(hex::encode(res.msg_receipt.return_data.bytes()), "5860000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000");
    }
}
