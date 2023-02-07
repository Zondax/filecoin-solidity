#[cfg(test)]
mod tests {
    use fvm_integration_tests::bundle;
    use fvm_integration_tests::dummy::DummyExterns;
    use fvm_integration_tests::tester::{Account, Tester};
    use fvm_ipld_encoding::{strict_bytes, tuple::*};
    use fvm_shared::bigint::bigint_ser;

    use cid::Cid;
    use fil_actor_eam::Return;
    use fil_actor_evm::Method as EvmMethods;
    use fil_actors_runtime::{
        runtime::builtins, DATACAP_TOKEN_ACTOR_ADDR, EAM_ACTOR_ADDR, SYSTEM_ACTOR_ADDR,
        VERIFIED_REGISTRY_ACTOR_ADDR,
    };
    use fvm::executor::{ApplyKind, Executor};
    use fvm::machine::Manifest;
    use fvm_ipld_blockstore::MemoryBlockstore;
    use fvm_ipld_encoding::CborStore;
    use fvm_ipld_encoding::RawBytes;
    use fvm_shared::address::Address;
    use fvm_shared::message::Message;
    use fvm_shared::sector::StoragePower;
    use fvm_shared::state::StateTreeVersion;
    use fvm_shared::version::NetworkVersion;
    use serde::{Deserialize as SerdeDeserialize, Serialize as SerdeSerialize};
    use std::env;
    use testing::helpers;

    const WASM_COMPILED_PATH: &str = "../build/v0.8/tests/VerifRegApiTest.bin";

    #[derive(SerdeSerialize, SerdeDeserialize)]
    #[serde(transparent)]
    pub struct CreateExternalParams(#[serde(with = "strict_bytes")] pub Vec<u8>);

    #[derive(Clone, Debug, PartialEq, Eq, Serialize_tuple, Deserialize_tuple)]
    pub struct VerifierParams {
        pub address: Address,
        #[serde(with = "bigint_ser")]
        pub allowance: StoragePower,
    }

    #[test]
    fn verifreg_tests() {
        println!("Testing solidity API");

        let bs = MemoryBlockstore::default();
        let actors = std::fs::read("./builtin-actors/output/builtin-actors-hyperspace.car")
            .expect("Unable to read actor devnet file file");
        let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

        let (manifest_version, manifest_data_cid): (u32, Cid) =
            bs.get_cbor(&bundle_root).unwrap().unwrap();
        let manifest = Manifest::load(&bs, &manifest_data_cid, manifest_version).unwrap();

        let mut tester =
            Tester::new(NetworkVersion::V18, StateTreeVersion::V5, bundle_root, bs).unwrap();

        let accounts: [Account; 2] = tester.create_accounts().unwrap();
        let (sender, _verified_client) = (accounts[0], accounts[1]);
        // register address so we can use senderID 199 which is the governor address of the verifreg
        // actor
        let _accounts: [Account; 200] = tester.create_accounts().unwrap();

        // Set verifreg actor
        let state_tree = tester.state_tree.as_mut().unwrap();
        helpers::set_verifiedregistry_actor(
            state_tree,
            *manifest
                .code_by_id(builtins::Type::VerifiedRegistry as u32)
                .unwrap(),
        )
        .unwrap();
        helpers::set_datacap_actor(
            state_tree,
            *manifest.code_by_id(builtins::Type::DataCap as u32).unwrap(),
        )
        .unwrap();

        // Instantiate machine
        tester.instantiate_machine(DummyExterns).unwrap();

        let executor = tester.executor.as_mut().unwrap();

        // Try to call "constructor"
        println!("Try to call constructor on storage verifreg actor");

        let root_key = Address::new_id(199);

        let message = Message {
            from: SYSTEM_ACTOR_ADDR,
            to: VERIFIED_REGISTRY_ACTOR_ADDR,
            gas_limit: 1000000000,
            method_num: 1,
            params: RawBytes::serialize(root_key).unwrap(),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Implicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        // Try to call "constructor"
        println!("Try to call constructor on datacap actor");

        let message = Message {
            from: SYSTEM_ACTOR_ADDR,
            to: DATACAP_TOKEN_ACTOR_ADDR,
            gas_limit: 1000000000,
            method_num: 1,
            params: RawBytes::serialize(VERIFIED_REGISTRY_ACTOR_ADDR).unwrap(),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Implicit, 100)
            .unwrap();

        dbg!(&res);

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
            from: sender.1,
            to: EAM_ACTOR_ADDR,
            gas_limit: 1000000000,
            method_num: 4,
            sequence: 0,
            params: RawBytes::serialize(constructor_params).unwrap(),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap(); //use fil_actors

        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        let exec_return: Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();
        let contract_actor = exec_return.actor_id;

        let verifier_allowance = fvm_shared::sector::StoragePower::from(2 * 1024u64);
        let params = VerifierParams {
            address: Address::new_id(contract_actor),
            allowance: verifier_allowance,
        };

        println!("Registering contract-actor as verifier");
        // by this call we register our contract actor as a verifier
        let message = Message {
            //from: sender.1,
            from: Address::new_id(199),
            to: VERIFIED_REGISTRY_ACTOR_ADDR,
            gas_limit: 1000000000,
            method_num: 2,
            sequence: 0,
            params: RawBytes::serialize(params).unwrap(),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        dbg!(&res);

        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        println!("Calling `add_verified_client`");
        let message = Message {
            from: sender.1,
            to: Address::new_id(exec_return.actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 1,
            params: RawBytes::new(hex::decode("58E455707461000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000001501DCE5B7F69E73494891556A350F8CC357614916D5000000000000000000000000000000000000000000000000000000000000000000000000000000000000030008000000000000000000000000000000000000000000000000000000000000").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        println!("Calling `get_claims`");

        let message = Message {
            from: sender.1,
            to: Address::new_id(exec_return.actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 2,
            //  get_claims params [201, [0,1]]
            params: RawBytes::new(hex::decode("58C4DBCB98AB000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000C90000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        // Should not fail as actor would return an empty list of claims
        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        println!("Calling `extend_claim_term`");
        let message = Message {
            from: sender.1,
            to: Address::new_id(exec_return.actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 3,
            params: RawBytes::new(hex::decode("58C4D8308B8C000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000660000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        println!("Calling `remove_expired_allocations`");

        let message = Message {
            from: sender.1,
            to: Address::new_id(exec_return.actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 4,
            //  remove_expired_allocations params [actorId(101), []] empty list which means remove all
            params: RawBytes::new(hex::decode("5884DF5527250000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000006500000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        println!("Calling `remove_expired_claims`");
        let message = Message {
            from: sender.1,
            to: Address::new_id(exec_return.actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 5,
            params: RawBytes::new(hex::decode("58C4D8308B8C000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000660000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        /*
            universal_receiver_hook in Verifreg can only be call by DataCap actor.

            TODO: investigate how it is supposed to work.

        println!("Calling `universal_receiver_hook`");
        let message = Message {
            from: sender.1,
            to: Address::new_id(exec_return.actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 6,
            params: RawBytes::new(hex::decode("58A4AA7E0F7B000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000C9000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000031245AB0000000000000000000000000000000000000000000000000000000000").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);*/
    }
}
