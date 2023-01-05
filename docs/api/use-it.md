---
title: How to use it on my project?
sidebar_position: 2
---

In order to use these APIs in your project, you will need to import them on your own contract. 
As they are embeddable libraries, they don't need to be present on the chain first. You can just import the library you desire and call its methods.

## Steps

### Import API contract on your project 

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
import { MarketTypes } from "@zondax/filecoin-solidity/contracts/v0.8/types/MarketAPI.sol";
import { BigInt } from "@zondax/filecoin-solidity/contracts/v0.8/cbor/BigNumberCbor.sol";
```

### Do a call to a particular method

```solidity
bytes memory addr = bytes("0x1111");
BigInt memory amount = BigInt(hex'01', false);

MarketTypes.WithdrawBalanceParams memory params = MarketTypes.WithdrawBalanceParams(addr, amount);

MarketTypes.WithdrawBalanceReturn memory response = MarketAPI.withdrawBalance(params);
```

### Deploy your contract

In order to deploy your project, please refer to [this section](../deploy-it.md). You will find useful information about it.

### Apendix A: BigNumber
There are certain fields that are BigInt. This is a particular data type meant to handle arbitrary-length numbers. They are composed by a byte array and a flag for the sign.
In order to do operations between elements of this specific type, there is a package you can use, called `@zondax/solidity-bignumber` [:link:](https://github.com/Zondax/solidity-BigNumber).
Using the NPM package you can add it as a dependency in your project.

```yarn
yarn add @zondax/solidity-bignumber
```

Then you can import it on your contract and use it. 

```solidity
import { BigNumbers, BigNumber } from "@zondax/solidity-bignumber/src/BigNumbers.sol";

BigNumber memory numA = BigNumbers.init(10000, false);
BigNumber memory numB = BigNumbers.init(2000, false);
BigNumber result = BigNumbers.add(numA, numB);
```

Finally, if you need to use it to interact with the APIs, you can convert it to the BigInt type they use easily. 

```solidity
import { BigNumbers, BigNumber } from "@zondax/solidity-bignumber/src/BigNumbers.sol";
import { BigInt } from "@zondax/filecoin-solidity/contracts/v0.8/cbor/BigNumberCbor.sol";

BigNumber memory numA = BigNumbers.init(10000, false);
BigNumber memory numB = BigNumbers.init(2000, false);
BigNumber result = BigNumbers.add(numA, numB);

BigInt memory amount = BigInt(result.val, result.sig);

// use amount var as arguments for any api method
```


## Working examples
In order to see a complete demo you can use as example, please refer to [tests folder](https://github.com/Zondax/filecoin-solidity/tree/master/contracts/v0.8/tests). You will find some smart contracts as examples
