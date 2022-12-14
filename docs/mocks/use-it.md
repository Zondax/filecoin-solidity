---
title: How to use it on my project?
sidebar_position: 3
---

In order to use these APIs in your project, you will need to deploy them first. As they are contracts themselves, they need to be present on the chain first. Then, using the address you get from deploying them,
you can reference them on your project. 

## Steps

### Deploy API

In order to deploy these libraries, please refer to [this section](../deploy-it.md). You will find useful information about it. 

### Import API contract on your project 

#### Local files
You will need to copy these files to a folder inside your project. Let's name it `libs`. In your smart contract, copy and paste these lines.

```solidity
import { MarketAPI } from "./libs/mocks/MarketAPI.sol";
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
import { MarketAPI } from "@zondax/filecoin-solidity/contracts/v0.8/mocks/MarketAPI.sol";
import { CommonTypes } from "@zondax/filecoin-solidity/contracts/v0.8/types/CommonTypes.sol";
import { MarketTypes } from "@zondax/filecoin-solidity/contracts/v0.8/types/MarketAPI.sol";
```


### Create a callable instance 
```solidity
MarketAPI marketApiInstance = MarketAPI(marketApiAddress);
```

### Do a call to a particular method

```solidity
bytes memory addr = bytes("0x1111");
MarketTypes.WithdrawBalanceParams memory params = MarketTypes.WithdrawBalanceParams(addr, 1);

MarketTypes.WithdrawBalanceReturn memory response = marketApiInstance.withdraw_balance(params);
```

## Working examples
In order to see a complete demo you can use as example, please refer to [tests folder](https://github.com/Zondax/filecoin-solidity/tree/master/contracts/v0.8/tests). You will find some smart contracts as examples
