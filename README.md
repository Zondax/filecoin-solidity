# Filecoin Solidity

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![GithubActions](https://github.com/Zondax/filecoin-solidity/actions/workflows/main.yaml/badge.svg)](https://github.com/Zondax/filecoin-solidity/blob/master/.github/workflows/main.yaml)

---

![zondax_light](docs/assets/zondax_light.png#gh-light-mode-only)
![zondax_dark](docs/assets/zondax_dark.png#gh-dark-mode-only)

_Please visit our website at [zondax.ch](https://www.zondax.ch)_

---

## DISCLAIMER :warning:

The libraries have been developed under the following set of assumptions. Take a look at them [here :link:](https://docs.zondax.ch/fevm/filecoin-solidity/introduction/assumptions)

---

## Notice

This is software is available under Apache 2.0 License. Use of this library implies your acceptance of this terms and conditions
This source code at this commit hash (https://github.com/Zondax/filecoin-solidity/commit/d6f20ea11b25e66b9a4fb94d0bb0d913edeb5873) was security-reviewed by Kudelski security (Not fully audited)

Things to keep in mind, while using this library:
- There are implicit invariants these contracts expect to hold.
- You should exhaustively read each contract you plan to use, top to bottom.
- **You can easily “shoot yourself in the foot” if you’re not careful with how you use the library.**


---

## Introduction

### Filecoin Virtual Machine (FVM)

Filecoin today lacks general programmability. As a result, it is not possible to deploy user-defined behaviour, or "smart contracts", to the blockchain. The goal of the FVM project is to add general programmability to the Filecoin blockchain.
They predict this will unleash a proliferation of new services and tools that can be built and deployed to the Filecoin network, without requiring network upgrades, involvement from core implementation maintainers, changes in the embedded actors, or spec alterations.

## Filecoin Solidity

It is a set of Solidity libraries that allow Solidity smart contracts to seamlessly call methods of Filecoin built-in actors. They do cross-platform calls to the real Filecoin built-in actors. A set of mock libraries are located too. They respond to specific scenarios based on the received parameters instead of doing real calls.

### Features

#### Libraries to interact with built-in actors

Querying an operating on the storage market, miner actors, verified registry for FIL+ automation, and more.

#### OpenZeppelin-like utilities specific to Filecoin

For developer convenience.

#### Filecoin data types

Sectors, deals, partitions, deadlines, and more.

#### Access to system features

via Filecoin precompiles

### How to use it

In order to use these APIs in your project, you will need to import them on your own contract.
As they are embeddable libraries, they don't need to be present on the chain first. You can just import the library you desire and call its methods.

#### Local files

You will need to copy these files to a folder inside your project. Let's name it `libs`. In your smart contract, copy and paste these lines.

```solidity
import { MarketAPI } from "./libs/MarketAPI.sol";
import { CommonTypes } from "./libs/types/CommonTypes.sol";
import { MarketTypes } from "./libs/types/MarketTypes.sol";

```

#### NPM Package

A better approach to import these libs is using the NPM package created for this. [:link:](https://www.npmjs.com/package/@zondax/filecoin-solidity).
Run on your project in order to add this package.

```yarn
yarn add @zondax/filecoin-solidity
```

In your smart contract, copy and paste these lines.

```solidity
import { MarketAPI } from "@zondax/filecoin-solidity/contracts/v0.8/MarketAPI.sol";
import { CommonTypes } from "@zondax/filecoin-solidity/contracts/v0.8/types/CommonTypes.sol";
import { MarketTypes } from "@zondax/filecoin-solidity/contracts/v0.8/types/MarketTypes.sol";
import { BigInt } from "@zondax/filecoin-solidity/contracts/v0.8/cbor/BigIntCbor.sol";

```

## Complementary lectures

### Introduction to Filecoin [:link:](https://docs.filecoin.io/intro/intro-to-filecoin/what-is-filecoin/)

Important explainers & concepts on Filecoin storage and retrieval markets, FVM as part of Filecoin and Lotus nodes that power the Filecoin network.

### Filecoin 101: conceptual read [:link:](https://hackernoon.com/the-filecoin-virtual-machine-everything-you-need-to-know)

If you’re starting totally new, we got you! Here’s a 101 conceptual read on understanding FVM from scratch.

### Past Hackathons

#### FVM Space Warp ETHGlobal Cheat Sheet [:link:](https://github.com/filecoin-project/community/discussions/585)

### Community Discussions [:link:](https://github.com/filecoin-project/community/discussions)

Find nice articles with rich and valuable content about different topics related to Filecoin network.

## Looking for the complete documentation? :books::books:

We have built this beautiful website for you!
[Let's go to docs web](https://docs.zondax.ch/fevm/filecoin-solidity) :arrow_upper_right:
 
