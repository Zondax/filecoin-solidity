---
title: "Introduction"
sidebar_position: 1
---

### What is the Filecoin blockchain?
Filecoin is making the web more secure and efficient with a decentralized data storage marketplace, protocol, and cryptocurrency.
It is a blockchain-based cooperative digital storage and data retrieval method, allowing users to rent unused hard drive space.

For more information, please refer to the [Filecoin web page](https://filecoin.io).

### What is the FVM?
Filecoin today lacks general programmability. As a result, it is not possible to deploy user-defined behaviour, or "smart contracts", to the blockchain. The goal of the FVM project is to add general programmability to the Filecoin blockchain.
They predict this will unleash a proliferation of new services and tools that can be built and deployed to the Filecoin network, without requiring network upgrades, involvement from core implementation maintainers, changes in the embedded actors, or spec alterations.

For more information, please refer to the FVM Specs [context-and-goals web page](https://github.com/filecoin-project/fvm-specs#context-and-goals).

### What is the FEVM?
Foreign actors are smart contracts or programs targeting non-FVM runtimes, running inside the Filecoin network through emulation.

The ability to run foreign actors is useful for cross-chain interoperability, and to extend Filecoin's reach and utility to other blockchains, allowing them to access the network's storage capabilities more seamlessly.

The first kind of foreign actor we aim to support are Ethereum smart contracts, through the deployment of EVM bytecode. This allows for straightforward and relatively risk-free porting of existing battle-tested Ethereum smart contracts to the Filecoin network.

For more information, please refer to the FEVM [details web page](https://github.com/filecoin-project/FIPs/blob/master/FIPS/fip-0030.md#foreign-actors).
