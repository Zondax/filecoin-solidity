---
title: "DataCap Actor"
sidebar_position: 2
---

# DataCap Actor

DataCap Actor is responsible for DataCap token management.  

The ActorCode for DataCap actor is `hex"0007"` which will be used to call DataCap actor APIs. You also need to specify method number of which method you want to invoke. Please refer each method for its method number.

### Name

```solidity
function name() internal returns (string memory) {}
```

Return the name of DataCap token which is 'DataCap'.

`Unit ` NameMethodNum : 48890204.

**Params**:

+ null

**Results**:

+ `String` : DataCap

### Symbol

```solidity
function symbol() internal returns (string memory) {}
```

Return the symbol of DataCap token which is 'DCAP'.

`unit` SymbolMethodNum: 2061153854.

**Params**:

+ null

**Results**:

+ `String` : DCAP

### TotalSupply

```solidity
function totalSupply() internal returns (CommonTypes.BigInt memory) {}
```

Return the total supply of DataCap token.

`uint` TotalSupplyMethodNum: 114981429.

**Params**:

+ null

**Results**:

+ `BigInt` TokenAmount - Total DataCap token supply.

### Balance

```solidity
function balance(CommonTypes.FilAddress memory addr) internal returns (CommonTypes.BigInt memory) {}
```

Return the DataCap token balance for the wallet address.

`unit` BalanceOfMethodNum: 3261979605.

**Params**:

+ `bytes` Address - the wallet address.

**Results**:

+ `BigInt` TokenAmount - the DataCap token balance for the specified wallet address.

### Transfer

```solidity
function transfer(DataCapTypes.TransferParams memory params) internal returns (DataCapTypes.TransferReturn memory) {}
```

Transfers DataCap tokens from caller address to the to address.

`uint`  TransferMethodNum = 80475954;

**Params**:

+ `struct` TransferParams
  + `FilAddress` To -  the address to receive DataCap token.
  + `BigInt` Amount -  A non-negative amount to transfer.
  + `bytes[]` OperatorData - Arbitrary data to pass on via the receiver hook.


**Results**:

+ `struct` TransferReturn
  + `BigInt` FromBalance - the balance of from_address.
  + `BigInt` ToBalance - the balance of to_address.
  + `bytes` RecipientData: data returned from receive hook.

### TransferFrom

```solidity
function transferFrom(DataCapTypes.TransferFromParams memory params) internal returns (DataCapTypes.TransferFromReturn memory) {}
```

Transfers DataCap tokens between from the from_address to the to_address.

`uint`  TransferFromMethodNum = 3621052141.

**Params**:

+ `struct` TransferFromParams 
  + `FilAddress` From - the address to send DataCap Token.
  + `FilAddress` To - the address to receive DataCap Token.
  + `BigInt` Amount - A non-negative amount to transfer.
  + `bytes` OperatorData: Arbitrary data to pass on via the receiver hook.

**Results**:

+ `struct` TransferFromReturn
  + `BigInt` FromBalance - the balance of from_address.
  + `BigInt` ToBalance -  the balance of to_address.
  + `BigInt` Allowance - the remaining allowance of owner address.
  + `bytes` RecipientData - data returned from receive hook.


### IncreaseAllowance

```solidity
function increaseAllowance(DataCapTypes.IncreaseAllowanceParams memory params) internal returns (CommonTypes.BigInt memory) {}
```

Increase the DataCap token allowance that an operator can control of the owner's balance by the requested amount.

`uint`  IncreaseAllowanceMethodNum = 1777121560.

**Params**:

+ `struct` IncreaseAllowanceParams
  +  `FilAddress` Operator - the  wallet address of the operator.
  +  `BigInt` increaseAmount - increase DataCap token allowance for the operator address.


**Results**:

+ `BigInt` TokenAmount - the new DataCap allowance of the operator address.

### DecreaseAllowance

```solidity
function decreaseAllowance(DataCapTypes.DecreaseAllowanceParams memory params) internal returns (CommonTypes.BigInt memory) {}
```

Decrease the DataCap token allowance that an operator controls of the owner's balance by the requested amount.

`uint` DecreaseAllowanceMethodNum = 1529376545;

**Params**:

+  `struct` DecreaseAllowanceParams
  +  `FilAddress` Operator - the  wallet address of the operator.
  +  `BigInt` IncreaseAmount - the decreased DataCap token allowance of the operator address.

**Results**:

+ `BigInt` TokenAmount - the new DataCap allowance of the operator address.

### RevokeAllowance

```solidity
function revokeAllowance(CommonTypes.FilAddress memory operator) internal returns (CommonTypes.BigInt memory) {}
```

Revoke the DataCap token allowance from the operator and set the operator's allowance in behave of owner/caller address to 0. 

`uint` RevokeAllowanceMethodNum = 2765635761.

**Params**:

+  `FilAddress` Operator - the wallet address of the operator.


**Results**:

+ `BigInt` TokenAmount - the old Allowance amount of the operator address.

### Burn

```solidity
function burn(CommonTypes.BigInt memory amount) internal returns (CommonTypes.BigInt memory) {}
```

Burn an amount of DataCap token from the owner/caller address, decreasing total token supply.

`uint` BurnMethodNum = 1434719642.

**Params**:

+ `BigInt` Amount - the amount the DataCap token to be burned.


**Results**:

+ `BigInt` TokenAmount - the updated DataCap token balance of the owner/caller address.

### BurnFrom

```solidity
function burnFrom(DataCapTypes.BurnFromParams memory params) internal returns (DataCapTypes.BurnFromReturn memory) {}
```

Burn an amount of DataCap token from the specified address (owner address), decrease the allowance of operator/caller, and decrease total token supply.

`uint` BurnFromMethodNum = 2979674018.

**Params**:

+ `struct` BurnFromParams
  + `FilAddress` Owner - the wallet address of the owner.
  + `BigInt` Amount - the amount of DataCap token to be burned.


**Results**:

+ `struct` BurnFromReturn
  + `BigInt`  balance - new balance in the account after the successful burn.
  + `BigInt` allowance - new remaining allowance between the owner and operator (caller)


### Allowance

```solidity
function allowance(DataCapTypes.GetAllowanceParams memory params) internal returns (CommonTypes.BigInt memory) {}
```

Return the allowance between owner and operator address.

`uint` AllowanceMethodNum = 4205072950;

**Params**:

+ `struct` GetAllowanceParams
  + `FilAddress` Owner : the wallet address of the owner.
  + `FilAddress` Operator : the wallet address of the owner.


**Results**:

+ `BigInt`  TokenAmount - the allowance that an operator can control of an owner's allowance.
