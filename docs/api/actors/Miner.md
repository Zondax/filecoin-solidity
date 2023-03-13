---
title: "Miner Actor"
sidebar_position: 4
---

# Miner Actor

The miner built-in actor responsible to deal with storage mining operations and collect proof. 

To interact with specific miner, you need to use this miner address to invoke the methods in miner built-in actor. You also need to specify method number of which method you want to invoke. Please refer the each method for its method number.

### GetPeerID

```solidity
function getPeerId(CommonTypes.FilActorId FilActorId) internal returns (CommonTypes.FilAddress memory) {}
```

Return the Peer ID for the caller/miner address.

`uint` GetPeerIDMethodNum = 2812875329.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with

**Results**:

+ `FilAddress` PeerID - the peer ID for the specified storage provider/miner.


### ChangePeerID

```solidity
function changePeerId(CommonTypes.FilActorId target, CommonTypes.FilAddress memory newId) internal {}
```

Change the peer ID for the caller/miner address.

`uint`  ChangePeerIDMethodNum = 1236548004.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with
+ `FilAddress` NewID - the new peer ID.

**Results**:

+ `struct` EmptyValue

### GetMultiaddrs

```solidity
function getMultiaddresses(CommonTypes.FilActorId target) internal returns (MinerTypes.GetMultiaddrsReturn memory) {}
```

Returns the multi-signature address for this caller/miner address.

`uint` GetMultiaddrsMethodNum = 1332909407.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with

**Results**:

+ `struct` GetMultiaddrsReturn
  + `FilAddress[]` MultiAddrs - the multi-signature address.

### ChangeMultiaddrs

```solidity
function changeMultiaddresses(CommonTypes.FilActorId target, MinerTypes.ChangeMultiaddrsParams memory params) internal {}
```

Change the multi-signature address for this caller/miner address.

`uint`  ChangeMultiaddrsMethodNum = 1063480576.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with
+ `struct` ChangeMultiaddrsParams
  + `FilAddress[]` NewMultiaddrs - the new multi-signature address.

**Results**:

+ `struct` EmptyValue

### ChangeWorkerAddress

```solidity
function changeWorkerAddress(CommonTypes.FilActorId target, MinerTypes.ChangeWorkerAddressParams memory params) internal {}
```

Change the worker address for the caller/miner address, and overwrite the existing addresses with the new control addresses passed in the params.

`uint` ChangeOwnerAddressMethodNum = 1010589339.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with
+ `struct` ChangeWorkerAddressParams
  + `FilAddress` NewWorker - the new worker address.
  + `FilAddress[]` NewControlAddrs - the new controller addresses.


**Results**:

+ `struct` EmptyValue

### ConfirmChangeWorkerAddress

```solidity
function confirmChangeWorkerAddress(CommonTypes.FilActorId target) internal {}
```

Confirm the worker address has been changed for the caller/miner address.

`uint` ConfirmChangeWorkerAddressMethodNum = 2354970453.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with

**Results**:

+ `struct` EmptyValue

### RepayDebt

```solidity
function repayDebt(CommonTypes.FilActorId target) internal {}
```

Repay as much fee debt as possible for the caller/miner address.

`uint`  RepayDebtMethodNum = 3665352697.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with

**Results**:

+ `struct` EmptyValue

### GetOwner

```solidity
function getOwner(CommonTypes.FilActorId target) internal returns (MinerTypes.GetOwnerReturn memory){}
```

Return the owner address of the caller/miner address.

`uint` GetOwnerMethodNum = 3275365574.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with

**Results**:

+ `GetOwnerReturn` GetOwnerReturn
  + `FilAddress` Owner - owner address.
  + `FilAddress` Proposed - proposed owner address.


### ChangeOwnerAddress

```solidity
function changeOwnerAddress(CommonTypes.FilActorId target, CommonTypes.FilAddress memory addr) internal {}
```

Proposes or confirms a change of owner address.

`uint` ChangeOwnerAddressMethodNum = 1010589339.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with
+ `FilAddress` Address - the new owner address.

**Results**:

+ `struct` EmptyValue

### GetBeneficiary

```solidity
function getBeneficiary(CommonTypes.FilActorId target) internal returns (MinerTypes.GetBeneficiaryReturn memory) {}
```

Return the currently active and proposed beneficiary information.

`uint` GetBeneficiaryMethodNum = 4158972569.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with

**Results**:

+ `struct` GetBeneficiaryReturn
  + `struct` ActiveBeneficiary - current active beneficiary.
    + `FilAddress` Beneficiary - the address of the beneficiary.
    + `struct` BeneficiaryTerm
      + `BigInt` Quota - the quota token amount.
      + `BigInt` UsedQuota - the used quota token amount.
      + `ChainEpoch` Expiration - the epoch that the quota will be expired.

  + `struct` PendingBeneficiaryChange - the proposed and pending beneficiary.
    + `FilAddress` newBeneficiary - the new beneficiary address.
    + `BigInt` NewQuota - the new quota token amount.
    + `ChainEpoch` NewExpiration - the epoch that the new quota will be expired. 
    + `bool` ApprovedByBeneficiary - if this proposal is approved by beneficiary or not.
    + `bool` ApprovedByNominee -  if this proposal is approved by nominee or not.


### ChangeBeneficiary

```solidity
function changeBeneficiary(CommonTypes.FilActorId target, MinerTypes.ChangeBeneficiaryParams memory params) internal {}
```

Propose or confirm a change of beneficiary information.

`uint` ChangeBeneficiaryMethodNum = 1570634796.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with
+ `struct` ChangeBeneficiaryParams
  + `FilActorId` newBeneficiary - the new beneficiary address.
  + `BigInt` NewQuota - the new quota token amount.
  + `ChainEpoch` NewExpiration - the epoch that the new quota will be expired. 


**Results**:

+ `struct` EmptyValue

### IsControllingAddress

```solidity
 function isControllingAddress(CommonTypes.FilActorId target, CommonTypes.FilAddress memory addr) internal returns (bool) {}
```

Returns whether the provided address is the Owner, the Worker, or any of the control addresses.

`uint` IsControllingAddressMethodNum = 348244887.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with
+ `FilAddress` Address - the address to be verified.

**Results**:

+ `bool` IsControllingAddressReturn - if the specified address is the control address.

### GetSectorSize

```solidity
function getSectorSize(CommonTypes.FilActorId target) internal returns (uint64) {}
```

Returns the miner's sector size.

`uint` GetSectorSizeMethodNum = 3858292296;

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with

**Results**:

+ `unit64` SectorSize - the sector size of this miner.


### GetAvailableBalance

```solidity
function getAvailableBalance(CommonTypes.FilActorId target) internal returns (CommonTypes.BigInt memory) {}
```

Returns the available balance of this miner.

`uint` GetAvailableBalanceMethodNum = 4026106874.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with

**Results**:

+ `BigInt` GetAvailableBalanceReturn - the available token balance amount.

### WithdrawBalance

```solidity
function withdrawBalance(CommonTypes.FilActorId target, CommonTypes.BigInt memory amount) internal returns (CommonTypes.BigInt memory) {}
```

Withdraw the token balance for this miner.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with
+ `BigInt` AmountRequested - withdraw token amount.

**Results**:

+ `BigInt`  WithdrawBalanceReturn - the token amount withdraw.

### GetVestingFunds

```solidity
function getVestingFunds(CommonTypes.FilActorId target) internal returns (MinerTypes.GetVestingFundsReturn memory) {}
```

Return the funds vesting in this miner as a list of (vesting_epoch, vesting_amount) tuples.

`uint` GetVestingFundsMethodNum = 1726876304.

**Params**:

+ `FilActorId` FilActorId - miner actor id to interact with

**Results**:

+ `struct` GetVestingFundsReturn 
  + `struct VestingFunds[]` Funds
    + `ChainEpoch` Epoch - the epoch of funds vested.
    + `BigInt` Amount - the amount of funds vested.
