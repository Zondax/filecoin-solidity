
################ BUILD ################
build: build_api build_mock_api build_tests

build_tests: verify_solc build_leb128_test
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/market.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/miner.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/power.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/account.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/datacap.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/init.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/verifreg.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/precompiles.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/send.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/cbor.decode.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/address.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc @zondax/solidity-bignumber=${PWD}/node_modules/@zondax/solidity-bignumber/  solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/mocks/tests/market.test.sol --output-dir ./build/v0.8/mocks/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc @zondax/solidity-bignumber=${PWD}/node_modules/@zondax/solidity-bignumber/  solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/mocks/tests/miner.test.sol --output-dir ./build/v0.8/mocks/tests --overwrite --bin --hashes --opcodes --abi

build_api: verify_solc
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/MarketAPI.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/MinerAPI.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/VerifRegAPI.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/PowerAPI.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/DataCapAPI.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/InitAPI.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/AccountAPI.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/PrecompilesAPI.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/Utils.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/SendAPI.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi

build_mock_api: verify_solc
	./bin/solc @zondax/solidity-bignumber=${PWD}/node_modules/@zondax/solidity-bignumber/ solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/mocks/MarketMockAPI.sol --output-dir ./build/v0.8/mocks --overwrite --bin --hashes --opcodes --abi
	./bin/solc @zondax/solidity-bignumber=${PWD}/node_modules/@zondax/solidity-bignumber/ solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/mocks/MinerMockAPI.sol --output-dir ./build/v0.8/mocks --overwrite --bin --hashes --opcodes --abi

build_builtin_actors:
	cd testing/builtin-actors && make bundle-hyperspace

build_leb128_test: verify_solc
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated1.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated2.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated3.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated4.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated5.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated6.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated7.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated8.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated9.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated10.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated11.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated12.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated13.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/tests/leb128.generated14.test.sol --output-dir ./build/v0.8/tests --overwrite --bin --hashes --opcodes --abi

generate_leb128_tests:
	cd scripts/leb128 && python generate.py

################ DEPLOY ################

deploy_api: deploy_miner_api deploy_market_api deploy_verifreg_api deploy_power_api

deploy_miner_api:
	mkdir -p hardhat/contracts && cp -rf contracts/* hardhat/contracts/. && cd hardhat && yarn hardhat deploy --tags MinerAPI

deploy_market_api:
	mkdir -p hardhat/contracts && cp -rf contracts/* hardhat/contracts/. && cd hardhat && yarn hardhat deploy --tags MarketAPI

deploy_verifreg_api:
	mkdir -p hardhat/contracts && cp -rf contracts/* hardhat/contracts/. && cd hardhat && yarn hardhat deploy --tags VerifRegAPI

deploy_power_api:
	mkdir -p hardhat/contracts && cp -rf contracts/* hardhat/contracts/. && cd hardhat && yarn hardhat deploy --tags PowerAPI

deploy_simple_coin:
	cd hardhat && yarn hardhat deploy --tags SimpleCoin

################ TESTS RUST ################

test_miner_cbor_serialization:
	cd hardhat && yarn hardhat change-beneficiary --beneficiary 0xaaaa12 --quota 12222 --expiration 1111 --contractaddress $(CONTRACT_ADDRESS)

test_market_cbor_serialization:
	cd hardhat && yarn hardhat withdraw_balance --providerorclient 0xaaaa12 --tokenamount 12222 --contractaddress $(CONTRACT_ADDRESS)

test_integration: build build_builtin_actors
	cd testing && cargo test

test_miner_integration: build build_builtin_actors
	cd testing && cargo test miner_test -- --nocapture

test_market_integration: build build_builtin_actors
	cd testing && cargo test market_test -- --nocapture

test_power_integration: build build_builtin_actors
	cd testing && cargo test power_test -- --nocapture

test_verifreg_integration: build build_builtin_actors
	cd testing && cargo test verifreg_test -- --nocapture

test_datacap_integration: build build_builtin_actors
	cd testing && cargo test datacap_test -- --nocapture

test_init_integration: build build_builtin_actors
	cd testing && cargo test init_test -- --nocapture

test_account_integration: build build_builtin_actors
	cd testing && cargo test account_test -- --nocapture

test_precompiles_integration: build build_builtin_actors
	cd testing && cargo test precompiles_test -- --nocapture

test_send_integration: build build_builtin_actors
	cd testing && cargo test send_test -- --nocapture

test_frc0042:
	cd scripts/frc42 && cargo r

test_cbor_decode: build build_builtin_actors
	cd testing && cargo test cbor_decode_test -- --nocapture

test_leb128: build build_builtin_actors
	cd testing && cargo test leb128 -- --nocapture

test_address: build build_builtin_actors
	cd testing && cargo test address -- --nocapture

################ TESTS SECURITY ################

security_account_api:
	myth analyze contracts/v0.8/AccountAPI.sol --execution-timeout 300
	myth analyze contracts/v0.8/tests/account.test.sol --execution-timeout 300

security_market_api:
	myth analyze contracts/v0.8/MarketAPI.sol --execution-timeout 300
	myth analyze contracts/v0.8/tests/market.test.sol --execution-timeout 300

security_miner_api:
	myth analyze contracts/v0.8/MinerAPI.sol --execution-timeout 300
	myth analyze contracts/v0.8/tests/miner.test.sol --execution-timeout 300

security_verifreg_api:
	myth analyze contracts/v0.8/VerifRegAPI.sol --execution-timeout 300
	myth analyze contracts/v0.8/tests/verifreg.test.sol --execution-timeout 300

security_power_api:
	myth analyze contracts/v0.8/PowerAPI.sol --execution-timeout 300
	myth analyze contracts/v0.8/tests/power.test.sol --execution-timeout 300

security_datacap_api:
	myth analyze contracts/v0.8/DataCapAPI.sol --execution-timeout 300
	myth analyze contracts/v0.8/tests/datacap.test.sol --execution-timeout 300

security_init_api:
	myth analyze contracts/v0.8/InitAPI.sol --execution-timeout 300
	myth analyze contracts/v0.8/tests/init.test.sol --execution-timeout 300

security_send_api:
	myth analyze contracts/v0.8/SendAPI.sol --execution-timeout 300
	myth analyze contracts/v0.8/tests/send.test.sol --execution-timeout 300

security_precompiles_api:
	myth analyze contracts/v0.8/PrecompilesAPI.sol --execution-timeout 300
	myth analyze contracts/v0.8/tests/precompiles.test.sol --execution-timeout 300

################ DEPS ################

verify_solc:
	@[ ! -f ./bin/solc ] && echo "Please install solc using 'make install_solc_linux' or 'make install_solc_mac'" || true

install_solc_linux:
	wget https://github.com/ethereum/solidity/releases/download/v0.8.17/solc-static-linux
	mv solc-static-linux bin/solc
	chmod +x bin/solc

install_solc_win:
	@echo "No Windows. Only Linux."

install_solc_mac:
	wget https://github.com/ethereum/solidity/releases/download/v0.8.17/solc-macos
	mv solc-macos bin/solc
	chmod +x bin/solc

install-llvm-ci:
	echo 'deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main' | sudo tee /etc/apt/sources.list.d/llvm.list
	wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install clang-13 llvm-13-dev lld-13 libclang-13-dev ocl-icd-opencl-dev

install-opencl:
	sudo apt-get update
	sudo apt-get install ocl-icd-opencl-dev
