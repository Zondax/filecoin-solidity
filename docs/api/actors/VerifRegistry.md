---
title: "Verified Registry Actor"
sidebar_position: 6
---

# Verified Registry Actor

Verified registry actor is responsible for managing verified clients. 

The ActorCode for verified registry built-in actor is `hex"0006"` which will be used to call the exported methods in verified registry built-in actor. You also need to specify method number of which method you want to invoke. Please refer the each method for its method number.

### AddVerifiedClient

```solidity
function addVerifiedClient(VerifRegTypes.AddVerifiedClientParams memory params) internal {}
```

To add a verified Client address to Filecoin Plus program.

`uint` constant AddVerifierClientMethodNum = 3916220144.

**Params**:

+ `struct` AddVerifierClientParams
  + `FilAddress` Address - the verified client address
  + `BigInt` Allowance - approved DataCap for this verified client

**Results**:

+ `struct` EmptyValue.

### RemoveExpiredAllocations

```solidity
function removeExpiredAllocations(
        VerifRegTypes.RemoveExpiredAllocationsParams memory params
    ) internal returns (VerifRegTypes.RemoveExpiredAllocationsReturn memory) {}
```

Remove the expired DataCap allocations and reclaimed those DataCap token back to Client. If the allocation amount is not specified, all expired DataCap allocation will be removed.

`uint`  RemoveExpiredAllocationsMethodNum = 2873373899.

**Params**:

+ `struct` RemoveExpiredAllocationsParams
  + `FilActorId` Client - the client address for which to expired allocations.
  + `FilActorId[]` AllocationIDs - List of allocation IDs to attempt to remove. If empty, will remove all eligible expired allocations.


**Results**:

+ `struct` RemoveExpiredAllocationsReturn
  + `FilActorId[] `Considered - Allocation IDs are either specified by the caller or discovered to be expired.
  + `BatachReturn` Results - results for each processed allocation.
  + `BigInt` DataCapRecoverd - The amount of DataCap token reclaimed for the client.


### GetClaims

```solidity
function getClaims(VerifRegTypes.GetClaimsParams memory params) internal returns (VerifRegTypes.GetClaimsReturn memory) {}
```

Return a list of claims corresponding to the requested claim ID for specific provider.

`uint`  GetClaimsMethodNum = 2199871187.

**Params**:

+ `struct`GetClaimsParams
  + `FilActorId` Provider - the provider address.
  + `FilActorId[]` ClaimIDs - A list of Claim IDs for specific provider.


**Results**:

+ `struct` GetClaimsReturn
  + `struct` BatchReturn
    + `uint32` SuccessCount - total successes in the batch.
    + `struct ` FailCode[] {`uint32` idx, `uint32` code} -  list of failure code and index for all failures in batch.

  + `struct Claim[]` Claims - list of Claims returned.
    + `FilActorId` Provider - The provider storing the data.
    + `FilActorId` Client - The client which allocated the DataCap.
    + `bytes` Data - Identifier for the data committed.
    + `uint64` Size - The size of the data.
    + `ChainEpoch` TermMin - The min period after term started which the provider must commit to storing data.
    + `ChainEpoch` TermMax - The max period after term started for which the provider can earn QA-power for the data.
    + `ChainEpoch` TermStart - the epoch at which the piece was committed.
    + `FilActorId` Sector - ID of the provider's sector in which the data is committed.


### ExtendClaimTerms

```solidity
function extendClaimTerms(VerifRegTypes.ExtendClaimTermsParams memory params) internal returns (CommonTypes.BatchReturn memory) {}
```

Extends the  maximum term of some claims up to the largest value they could have been originally allocated. This method can only be called by the claims' client.

`uint` ExtendClaimTermsMethodNum = 1752273514.

**Params**:

+ `struct` ExtendClaimTermsParams
  + `struct ClaimTerm[]` Terms
    + `FilActorId ` Provider - The provider address which storing the data.
    + `FilActorId ` CliamID - Claim ID.
    + `ChainEpoch` TermMax - The max chain epoch to extend.


**Results**:

+ `struct` ExtendClaimTermsReturn
  + `struct` BatchReturn
    + `uint32` SuccessCount - total successes in the batch.
    + `struct ` FailCodes[] {`uint32` idx, `uint32` code} -  list of failure code and index for all failures in batch.

### RemoveExpiredClaims

```solidity
function removeExpiredClaims(VerifRegTypes.RemoveExpiredClaimsParams memory params) internal returns (VerifRegTypes.RemoveExpiredClaimsReturn memory) {}
```

To remove a claim with its maximum term has elapsed.

`uint` RemoveExpiredClaimsMethodNum = 2873373899.

**Params**:

+ `struct` RemoveExpiredClaimsParams
  + `FilActorId` Provider - the provider address.
  + `FilActorId[]` ClaimIDs - A list of Claim IDs with expired term. If no claims are specified, all eligible claims will be removed.

**Results**:

+ `struct` RemoveExpiredClaimsReturn
  + `FilActorId[]` Considered - a list of IDs of the claims that were either specified by the caller or discovered to be expired.
  + `struct` BatchReturn
    + `uint32` SuccessCount - total successes in the batch
    + `struct ` FailCodes[] {`uint32` idx, `uint32` code} -  list of failure code and index for all failures in batch.

