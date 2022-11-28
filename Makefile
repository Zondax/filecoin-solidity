compile:
	mkdir -p hardhat/contracts && cp -rf contracts/* hardhat/contracts/. && cd hardhat && yarn hardhat compile

deploy_api: deploy_miner_api deploy_market_api deploy_verifreg_api
build: build_api

deploy_miner_api:
	mkdir -p hardhat/contracts && cp -rf contracts/* hardhat/contracts/. && cd hardhat && yarn hardhat deploy --tags MinerAPI

deploy_market_api:
	mkdir -p hardhat/contracts && cp -rf contracts/* hardhat/contracts/. && cd hardhat && yarn hardhat deploy --tags MarketAPI

deploy_verifreg_api:
	mkdir -p hardhat/contracts && cp -rf contracts/* hardhat/contracts/. && cd hardhat && yarn hardhat deploy --tags VerifRegAPI

build_api:
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/MarketAPI.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi
	./bin/solc solidity-cborutils=${PWD}/node_modules/solidity-cborutils/ @ensdomains=${PWD}/node_modules/@ensdomains/ contracts/v0.8/MinerAPI.sol --output-dir ./build/v0.8 --overwrite --bin --hashes --opcodes --abi

build_simple_coin:
	./bin/solc contracts/SimpleCoin.sol --output-dir ./build --overwrite --bin --hashes --opcodes --abi

deploy_simple_coin:
	cd hardhat && yarn hardhat deploy --tags SimpleCoin

test_miner_cbor_serialization:
	cd hardhat && yarn hardhat change-beneficiary --beneficiary 0xaaaa12 --quota 12222 --expiration 1111 --contractaddress $(CONTRACT_ADDRESS)

test_market_cbor_serialization:
	cd hardhat && yarn hardhat withdraw_balance --providerorclient 0xaaaa12 --tokenamount 12222 --contractaddress $(CONTRACT_ADDRESS)

download_bundle_actor:
	cd testing && wget https://github.com/filecoin-project/builtin-actors/releases/download/dev%2F20221123-fvm-m2/builtin-actors-devnet-wasm.car

install_solc_linux:
	wget https://binaries.soliditylang.org/linux-amd64/solc-linux-amd64-v0.8.15+commit.e14f2714
	mv solc-linux-amd64-v0.8.15+commit.e14f2714 bin/solc
	chmod +x bin/solc

install_solc_win:
	@echo "No Windows. Only Linux."

install_solc_mac:
	wget https://github.com/ethereum/solidity/releases/download/v0.8.15/solc-macos
	mv solc-macos bin/solc
	chmod +x bin/solc

install-llvm-ci:
	echo 'deb http://apt.llvm.org/focal/ llvm-toolchain-focal-13 main' | sudo tee /etc/apt/sources.list.d/llvm.list
	wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
	sudo apt-get update
	sudo apt-get install clang-13 llvm-13-dev lld-13 libclang-13-dev
