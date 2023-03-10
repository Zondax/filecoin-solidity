---
title: "Storage Market Actor"
sidebar_position: 3
---

# Storage Market Actor

Storage market actor is responsible for managing storage and retrieval deals. 

The ActorCode for storage market actor is `hex"0005"` which will be used to call this actor. You also need to specify method number of which method you want to invoke. Please refer the each method for its method number.

### AddBalance

```solidity
function addBalance(CommonTypes.FilAddress memory providerOrClient, uint256 value) internal {}
```

Deposit the received FIL token, which is received along with this message,  into the balance held in escrow address of the provider or client address.

`uint`  AddBalanceMethodNum = 822473126.

**Params**:

+ `FilAddress` Address - the address of provider or client.
+ `uint256` value - the amount of FIL token you want to deposit into the balance 

**Results**:

+ `struct` EmptyValue.

### GetBalance

```solidity
function getBalance(CommonTypes.FilAddress memory addr) internal returns (MarketTypes.GetBalanceReturn memory) {}
```

Return the escrow balance and locked amount for an address.

`uint` GetBalanceMethodNum = 726108461.

**Params**:

+ `FilAddress` address - the wallet address to request balance.

**Results**:

+ `struct` GetBalanceReturn
  + `BigInt` Balance - the escrow balance for this address.
  + `BigInt` Locked - the escrow locked amount for this address.

### WithdrawBalance

```solidity
function withdrawBalance(MarketTypes.WithdrawBalanceParams memory params) internal returns (CommonTypes.BigInt memory) {}
```

Withdraw the specified amount from the balance held in escrow.

`uint`  WithdrawBalanceMethodNum = 2280458852.

**Params**:

+ `struct` WithdrawBalanceParams
  + `FilAddress` ProviderOrClientAddress - the address of provider or client.
  + `BigInt` TokenAmount - the token amount to withdraw.


**Results**:

+ `BigInt` AmountWithdraw - the token amount withdrawn.


### PublishStorageDeals

```solidity
function publishStorageDeals(MarketTypes.PublishStorageDealsParams memory params) internal returns (MarketTypes.PublishStorageDealsReturn memory) {}
```

Publish a new set of storage deals which are not yet included in a sector.

`uint` PublishStorageDealsMethodNum = 2236929350.

**Params**:

+ `struct` PublishStorageDealsParams
  + `struct ClientDealProposal[]` Deals - list of deal proposals signed by a client
    + `struct DealProposal` Proposal 
      + `Cid` PieceCID.
      + `uint64` PieceSize - the size of the piece.
      + `bool` VerifiedDeal - if the deal is verified or not.
      + `FilAddress` Client - the address of the storage client.
      + `FilAddress` Provider - the address of the storage provider.
      + `DealLabel` Label - any label that client choose for the deal.
      + `ChainEpoch` StartEpoch - the chain epoch to start the deal.
      + `ChainEpoch` EndEpoch - the chain epoch to end the deal.
      + `BigInt` StoragePricePerEpoch -  the token amount to pay to provider per epoch.
      + `BigInt` ProviderCollateral - the token amount as collateral paid by the provider.
      + `BigInt` ClientCollateral - the token amount as collateral paid by the client.

    + `bytes` ClientSignature - the signature signed by the client.


**Results**:

+ `struct` PublishStorageDealsReturn
  + `uint64[]` IDs - returned storage deal IDs.
  + `bytes` ValidDeals - represent all the valid deals.

### GetDealDataCommitment

```solidity
function getDealDataCommitment(uint64 dealID) internal returns (MarketTypes.GetDealDataCommitmentReturn memory) {}
```

Return the data commitment and size of a deal proposal.

`uint` GetDealDataCommitmentMethodNum = 1157985802.

**Params**:

+ `uint64` GetDealDataCommitmentParams - Deal ID.

**Results**:

+ `struct` GetDealDataCommitmentReturn
  + `bytes` Data - the data commitment of this deal.
  + `uint64` Size  - the size of this deal.


### GetDealClient

```solidity
function getDealClient(uint64 dealID) internal returns (uint64) {}
```

Return the client of the deal proposal.

`uint` GetDealClientMethodNum = 128053329.

**Params**:

+ `uint64` GetDealClientParams - CID of the deal proposal.

**Results**:

+ `uint64` GetDealClientReturn - the wallet address of the client.

### GetDealProvider

```solidity
function getDealProvider(uint64 dealID) internal returns (uint64) {}
```

Return the provider of a deal proposal.

`uint` GetDealProviderMethodNum = 935081690.

**Params**:

+ `uint64` GetDealProviderParams - CID of the deal proposal.

**Results**:

+ `uint64` GetDealProviderReturn - the wallet address of the provider.

### GetDealLabel

```solidity
function getDealLabel(uint64 dealID) internal returns (CommonTypes.DealLabel memory) {}
```

Return the label of a deal proposal.

`uint` GetDealLabelMethodNum = 46363526.

**Params**:

+ `uint64` GetDealLabelParams - CID of the deal proposal.

**Results**:

+ `DealLabel` GetDealLabelReturn - the label of this deal.

### GetDealTerm

```solidity
function getDealTerm(uint64 dealID) internal returns (MarketTypes.GetDealTermReturn memory) {}
```

Return the start epoch and duration(in epochs) of a deal proposal. 

`uint` GetDealTermMethodNum = 163777312.

**Params**:

+ `uint64` GetDealTermParams - CID of the deal proposal.

**Results**:

+ `struct`GetDealTermReturn
  + `ChainEpoch` Start - the chain epoch to start the deal.
  + `ChainEpoch` End - the chain epoch to end the deal.


### GetDealTotalPrice

```solidity
function getDealTotalPrice(uint64 dealID) internal returns (CommonTypes.BigInt memory) {}
```

Return the total price that will be paid from the client to the provider for this deal.

`uint` GetDealEpochPriceMethodNum = 4287162428.

**Params**:

+ `uint64` GetDealTotalPriceParams - CID of the deal proposal.

**Results**:

+ `BigInt ` GetDealTotalPriceReturn - the token amount that will be paid by client to provider.

### GetDealClientCollateral

```solidity
function getDealClientCollateral(uint64 dealID) internal returns (CommonTypes.BigInt memory) {}
```

Return the client collateral requirement for a deal proposal.

`uint` GetDealClientCollateralMethodNum = 200567895.

**Params**:

+ `uint64` GetDealClientCollateralParams - CID of the deal proposal.

**Results**:

+ `BigInt` GetDealClientCollateralReturn - the token amount as collateral paid by the client.

### GetDealProviderCollateral

```solidity
function getDealProviderCollateral(uint64 dealID) internal returns (CommonTypes.BigInt memory) {}
```

Return the provide collateral requirement for a deal proposal.

`uint`  GetDealProviderCollateralMethodNum = 2986712137.

**Params**:

+ `uint64` GetDealProviderCollateralParams - CID of the deal proposal.

**Results**:

+ `BigInt` GetDealProviderCollateralReturn - the token amount as collateral paid by the provider.

### GetDealVerified

```solidity
function getDealVerified(uint64 dealID) internal returns (bool) {}
```

Return the verified flag for a deal proposal.

`uint` GetDealVerifiedMethodNum = 2627389465.

**Params**:

+ `uint64` GetDealVerifiedParams - CID of the deal proposal.

**Results**:

+ `bool` GetDealVerifiedReturn -  if the deal is verified or not.

### GetDealActivation

```solidity
function getDealActivation(uint64 dealID) internal returns (MarketTypes.GetDealActivationReturn memory) {}
```

Return the activation state for a deal.

`uint` GetDealActivationParams = 2567238399.

**Params**:

+ `uint64` GetDealVerifiedParams - CID of the deal proposal.

**Results**:

+ `struct` GetDealActivationReturn
  + `ChainEpoch` Activated - Epoch at which the deal was activated, or -1.
  + `ChainEpoch` Terminated -Epoch at which the deal was terminated abnormally, or -1.
