#[cfg(test)]
mod tests {
    use fvm_integration_tests::tester::{Account, Tester};
    use fvm_integration_tests::dummy::DummyExterns;
    use fvm_integration_tests::bundle;
    use fvm_ipld_encoding::{strict_bytes};
    use fvm_shared::state::StateTreeVersion;
    use fvm_shared::version::NetworkVersion;
    use fvm_ipld_blockstore::MemoryBlockstore;
    use std::env;
    use fvm_shared::address::Address;
    use fvm_shared::message::Message;
    use fvm::executor::{ApplyKind, Executor};
    use fil_actor_eam::Return;
    use fil_actor_evm::{Method as EvmMethods};
    use fvm_ipld_encoding::RawBytes;
    use fil_actors_runtime::{EAM_ACTOR_ADDR};
    use fvm_shared::econ::TokenAmount;
    use serde::{Deserialize as SerdeDeserialize, Serialize as SerdeSerialize};

    const WASM_COMPILED_PATH: &str =
       "../build/v0.8/tests/SendApiTest.bin";

    #[derive(SerdeSerialize, SerdeDeserialize)]
    #[serde(transparent)]
    pub struct CreateExternalParams(#[serde(with = "strict_bytes")] pub Vec<u8>);

    #[test]
    fn send_tests() {
        println!("Testing solidity API");

        let bs = MemoryBlockstore::default();
        let actors = std::fs::read("./builtin-actors/output/builtin-actors-devnet-wasm.car").expect("Unable to read actor devnet file");
        let bundle_root = bundle::import_bundle(&bs, &actors).unwrap();

        let mut tester =
            Tester::new(NetworkVersion::V18, StateTreeVersion::V5, bundle_root, bs).unwrap();

        // As the governor address for datacap is 200, we create many many address in order to initialize the ID 200 with some tokens
        // and make it a valid address to use.
        let sender: [Account; 300] = tester.create_accounts().unwrap();

        println!("{}", format!("Sender address id [{}] and bytes [{}]", &sender[0].0, hex::encode(&sender[0].1.to_bytes())));
        println!("{}", format!("Sender address id [{}] and bytes [{}]", &sender[1].0, hex::encode(&sender[1].1.to_bytes())));
        println!("{}", format!("Sender address id [{}] and bytes [{}]", &sender[2].0, hex::encode(&sender[2].1.to_bytes())));
        println!("{}", format!("Sender address id [{}] and bytes [{}]", &sender[3].0, hex::encode(&sender[3].1.to_bytes())));

        // Instantiate machine
        tester.instantiate_machine(DummyExterns).unwrap();

        let executor = tester.executor.as_mut().unwrap();


        // First we deploy the contract in order to actually have an actor running on the embryo address
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
            sequence: 0,
            params: RawBytes::serialize(constructor_params).unwrap(),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        let exec_return : Return = RawBytes::deserialize(&res.msg_receipt.return_data).unwrap();

        println!("Contract address ID type on decimal [{}]",exec_return.actor_id);
        println!("Contract address ID type on hex [{}]", hex::encode(Address::new_id(exec_return.actor_id).to_bytes()));
        match exec_return.robust_address {
            Some(addr) => println!("Contract address robust type [{}]",addr),
            None => ()
        }

        println!("Contract address eth address type [{}]",hex::encode(exec_return.eth_address.0));

        let contract_actor_id = exec_return.actor_id;


        // Send some tokens to the smart contract
        let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: 0,
            value: TokenAmount::from_atto(100),
            sequence: 1,
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);

        println!("Calling `send`");

        let message = Message {
            from: sender[0].1,
            to: Address::new_id(contract_actor_id),
            gas_limit: 1000000000,
            method_num: EvmMethods::InvokeContract as u64,
            sequence: 2,
            params: RawBytes::new(hex::decode("58849372C4AB0000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000A000000000000000000000000000000000000000000000000000000000000001501DCE5B7F69E73494891556A350F8CC357614916D50000000000000000000000").unwrap()),
            ..Message::default()
        };

        let res = executor
            .execute_message(message, ApplyKind::Explicit, 100)
            .unwrap();

        assert_eq!(res.msg_receipt.exit_code.value(), 0);
    }
}
