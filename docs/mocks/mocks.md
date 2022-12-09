---
title: "Specifications"
sidebar_position: 1
---

## Actors and methods supported

| Actor/method                             | Supported?               |
|:-----------------------------------------|:-------------------------|
| Account                                  |                          |
| Constructor                              | :heavy_multiplication_x: |
| PubkeyAddress                            | :heavy_multiplication_x: |
| AuthenticateMessage                      | :heavy_multiplication_x: |
| UniversalReceiverHook                    | :heavy_multiplication_x: |
|                                          |                          |
| Cron                                     |                          |
| Constructor                              | :heavy_multiplication_x: |
| EpochTick                                | :heavy_multiplication_x: |
|                                          |                          |
| Datacap Token                            |                          |
| Constructor                              | :heavy_multiplication_x: |
| Mint                                     | :heavy_multiplication_x: |
| Destroy                                  | :heavy_multiplication_x: |
| Name                                     | :heavy_multiplication_x: |
| Symbol                                   | :heavy_multiplication_x: |
| TotalSupply                              | :heavy_multiplication_x: |
| BalanceOf                                | :heavy_multiplication_x: |
| Transfer                                 | :heavy_multiplication_x: |
| TransferFrom                             | :heavy_multiplication_x: |
| IncreaseAllowance                        | :heavy_multiplication_x: |
| DecreaseAllowance                        | :heavy_multiplication_x: |
| RevokeAllowance                          | :heavy_multiplication_x: |
| Burn                                     | :heavy_multiplication_x: |
| BurnFrom                                 | :heavy_multiplication_x: |
| Allowance                                | :heavy_multiplication_x: |
|                                          |                          |
| Init                                     |                          |
| Constructor                              | :heavy_multiplication_x: |
| Exec                                     | :heavy_multiplication_x: |
| Exec4                                    | :heavy_multiplication_x: |
|                                          |                          |
| Market                                   |                          |
| Constructor                              | :heavy_multiplication_x: |
| AddBalance                               | :heavy_check_mark:       |
| WithdrawBalance                          | :heavy_check_mark:       |
| PublishStorageDeals                      | :heavy_multiplication_x: |
| VerifyDealsForActivation                 | :heavy_multiplication_x: |
| ActivateDeals                            | :heavy_multiplication_x: |
| OnMinerSectorsTerminate                  | :heavy_multiplication_x: |
| ComputeDataCommitment                    | :heavy_multiplication_x: |
| CronTick                                 | :heavy_multiplication_x: |
| GetBalance                               | :heavy_check_mark:       |
| GetDealDataCommitment                    | :heavy_check_mark:       |
| GetDealClient                            | :heavy_check_mark:       |
| GetDealProvider                          | :heavy_check_mark:       |
| GetDealLabel                             | :heavy_check_mark:       |
| GetDealTerm                              | :heavy_check_mark:       |
| GetDealEpochPrice                        | :heavy_check_mark:       |
| GetDealClientCollateral                  | :heavy_check_mark:       |
| GetDealProviderCollateral                | :heavy_check_mark:       |
| GetDealVerified                          | :heavy_check_mark:       |
| GetDealActivation                        | :heavy_check_mark:       |
|                                          |                          |
| Miner                                    |                          |
| Constructor                              | :heavy_multiplication_x: |
| ControlAddresses                         | :heavy_multiplication_x: |
| ChangeWorkerAddress                      | :heavy_multiplication_x: |
| ChangePeerID                             | :heavy_multiplication_x: |
| SubmitWindowedPoSt                       | :heavy_multiplication_x: |
| PreCommitSector                          | :heavy_multiplication_x: |
| ProveCommitSector                        | :heavy_multiplication_x: |
| ExtendSectorExpiration                   | :heavy_multiplication_x: |
| TerminateSectors                         | :heavy_multiplication_x: |
| DeclareFaults                            | :heavy_multiplication_x: |
| DeclareFaultsRecovered                   | :heavy_multiplication_x: |
| OnDeferredCronEvent                      | :heavy_multiplication_x: |
| CheckSectorProven                        | :heavy_multiplication_x: |
| ApplyRewards                             | :heavy_multiplication_x: |
| ReportConsensusFault                     | :heavy_multiplication_x: |
| WithdrawBalance                          | :heavy_multiplication_x: |
| ConfirmSectorProofsValid                 | :heavy_multiplication_x: |
| ChangeMultiaddrs                         | :heavy_multiplication_x: |
| CompactPartitions                        | :heavy_multiplication_x: |
| CompactSectorNumbers                     | :heavy_multiplication_x: |
| ConfirmUpdateWorkerKey                   | :heavy_multiplication_x: |
| RepayDebt                                | :heavy_multiplication_x: |
| ChangeOwnerAddress                        | :heavy_check_mark:       |
| DisputeWindowedPoSt                      | :heavy_multiplication_x: |
| PreCommitSectorBatch                     | :heavy_multiplication_x: |
| ProveCommitAggregate                     | :heavy_multiplication_x: |
| ProveReplicaUpdates                      | :heavy_multiplication_x: |
| PreCommitSectorBatch2                    | :heavy_multiplication_x: |
| ProveReplicaUpdates2                     | :heavy_multiplication_x: |
| ChangeBeneficiary                        | :heavy_check_mark:       |
| GetBeneficiary                           | :heavy_check_mark:       |
| ExtendSectorExpiration2                  | :heavy_multiplication_x: |
| GetOwner                                 | :heavy_check_mark:       |
| IsControllingAddress                     | :heavy_check_mark:       |
| GetSectorSize                            | :heavy_check_mark:       |
| GetVestingFunds                          | :heavy_check_mark:       |
| GetAvailableBalance                      | :heavy_check_mark:       |
| Read peer ID, multiaddr                  | :heavy_multiplication_x: |
| Read pre-commit deposit                  | :heavy_multiplication_x: |
| Read initial pledge total                | :heavy_multiplication_x: |
| Read fee debt                            | :heavy_multiplication_x: |
|                                          |                          |
| Multisig                                 |                          |
| Constructor                              | :heavy_multiplication_x: |
| Propose                                  | :heavy_multiplication_x: |
| Approve                                  | :heavy_multiplication_x: |
| Cancel                                   | :heavy_multiplication_x: |
| AddSigner                                | :heavy_multiplication_x: |
| RemoveSigner                             | :heavy_multiplication_x: |
| SwapSigner                               | :heavy_multiplication_x: |
| ChangeNumApprovalsThreshold              | :heavy_multiplication_x: |
| LockBalance                              | :heavy_multiplication_x: |
| UniversalReceiverHook                    | :heavy_multiplication_x: |
| List signers and threshold               | :heavy_multiplication_x: |
|                                          |                          |
| Payment Channel                          |                          |
| Constructor                              | :heavy_multiplication_x: |
| UpdateChannelState                       | :heavy_multiplication_x: |
| Settle                                   | :heavy_multiplication_x: |
| Collect                                  | :heavy_multiplication_x: |
| List from/to                             | :heavy_multiplication_x: |
| Get redeemed amount                      | :heavy_multiplication_x: |
|                                          |                          |
| Power                                    |                          |
| Constructor                              | :heavy_multiplication_x: |
| CreateMiner                              | :heavy_multiplication_x: |
| UpdateClaimedPower                       | :heavy_multiplication_x: |
| EnrollCronEvent                          | :heavy_multiplication_x: |
| OnEpochTickEnd                           | :heavy_multiplication_x: |
| UpdatePledgeTotal                        | :heavy_multiplication_x: |
| SubmitPoRepForBulkVerify                 | :heavy_multiplication_x: |
| CurrentTotalPower                        | :heavy_multiplication_x: |
| NetworkRawPower                          | :heavy_multiplication_x: |
| MinerRawPower                            | :heavy_multiplication_x: |
| Get miner count, consensus count         | :heavy_multiplication_x: |
| Compute pledge collateral for new sector | :heavy_multiplication_x: |
| Get network bytes committed?             | :heavy_multiplication_x: |
| Get network total pledge collateral?     | :heavy_multiplication_x: |
| Get network epoch QA power               | :heavy_multiplication_x: |
| Get network epoch pledge collateral      | :heavy_multiplication_x: |
| Get miner's QA power                     | :heavy_multiplication_x: |
|                                          |                          |
| Reward                                   |                          |
| Constructor                              | :heavy_multiplication_x: |
| AwardBlockReward                         | :heavy_multiplication_x: |
| ThisEpochReward                          | :heavy_multiplication_x: |
| UpdateNetworkKPI                         | :heavy_multiplication_x: |
|                                          |                          |
| System                                   |                          |
| Constructor                              | :heavy_multiplication_x: |
|                                          |                          |
| Verified Registry                        |                          |
| Constructor                              | :heavy_multiplication_x: |
| AddVerifier                              | :heavy_multiplication_x: |
| RemoveVerifier                           | :heavy_multiplication_x: |
| AddVerifiedClient                        | :heavy_multiplication_x: |
| RemoveVerifiedClientDataCap              | :heavy_multiplication_x: |
| RemoveExpiredAllocations                 | :heavy_multiplication_x: |
| ClaimAllocations                         | :heavy_multiplication_x: |
| GetClaims                                | :heavy_multiplication_x: |
| ExtendClaimTerms                         | :heavy_multiplication_x: |
| RemoveExpiredClaims                      | :heavy_multiplication_x: |
| UniversalReceiverHook                    | :heavy_multiplication_x: |
| List/get allocations                     | :heavy_multiplication_x: |
| List claims                              | :heavy_multiplication_x: |
| List/check verifiers                     | :heavy_multiplication_x: |



## Mock scenarios

### Miner Actor

| Methods                |                                                |                               |                    | Scenario 1                                                                    |
|:-----------------------|:-----------------------------------------------|:------------------------------|:-------------------|:------------------------------------------------------------------------------|
| constructor            |                                                |                               |                    |                                                                               |
| Params                 |                                                | address owner;                |                    | set owner                                                                     |
|                        |                                                | int64 available_balance       |                    | set available_balance                                                         |
|                        |                                                | int64 vesting_funds_epoch     |                    | set vesting_funds_epoch                                                       |
|                        |                                                | int256 vesting_funds_amount   |                    | set vesting_funds_amount                                                      |
| Return                 |                                                | None                          |                    |                                                                               |
|                        |                                                |                               |                    |                                                                               |
|                        |                                                |                               |                    |                                                                               |
| set_owner              |                                                |                               |                    | if no owner, set owner to be the attribute. If there's an owner, return error |
| Params                 |                                                | address owner;                |                    |                                                                               |
| Return                 |                                                | None                          |                    |                                                                               |
|                        |                                                |                               |                    |                                                                               |
| get_owner              |                                                |                               |                    |                                                                               |
| Params                 | void                                           |                               |                    | -                                                                             |
| Return                 | CommonTypes.Addr owner                         | address owner;                |                    | return owner if there's an owner. return error if no owner                    |
|                        |                                                |                               |                    |                                                                               |
|                        |                                                |                               |                    |                                                                               |
| is_controlling_address |                                                |                               |                    |                                                                               |
| Params                 | CommonTypes.Addr                               | address addr;                 |                    | any                                                                           |
|                        |                                                |                               |                    |                                                                               |
| Return                 | bool is_controlling;                           |                               |                    | return false                                                                  |
|                        |                                                |                               |                    |                                                                               |
|                        |                                                |                               |                    |                                                                               |
|                        |                                                |                               |                    |                                                                               |
|                        |                                                |                               |                    |                                                                               |
| get_sector_size        |                                                |                               |                    |                                                                               |
| Params                 | void                                           |                               |                    | -                                                                             |
| Return                 | CommonTypes.SectorSize sector_size;            |                               |                    | _8MiB                                                                         |
|                        |                                                |                               |                    |                                                                               |
|                        |                                                |                               |                    |                                                                               |
| get_available_balance  |                                                |                               |                    |                                                                               |
| Params                 | void                                           |                               |                    | -                                                                             |
| Return                 | int256 available_balance;                      |                               |                    | return the value set in constructor                                           |
|                        |                                                |                               |                    |                                                                               |
| get_vesting_funds      |                                                |                               |                    |                                                                               |
| Params                 | void                                           |                               |                    | -                                                                             |
| Return                 | CommonTypes.VestingFunds[]                     | int64 epoch;                  |                    | return the value set in constructor                                           |
|                        |                                                | int256 amount;                |                    | return the value set in constructor                                           |
|                        |                                                |                               |                    |                                                                               |
| change_beneficiary     |                                                |                               |                    |                                                                               |
| Params                 | CommonTypes.Addr new_beneficiary;              |                               |                    | change the beneficiary info according to the params                           |
|                        | int256 new_quota;                              |                               |                    | change the beneficiary info according to the params                           |
|                        | uint64 new_expiration;                         |                               |                    | change the beneficiary info according to the params                           |
| Return                 | void                                           |                               |                    | -                                                                             |
|                        |                                                |                               |                    |                                                                               |
| get_beneficiary        |                                                |                               |                    |                                                                               |
| Params                 | void                                           |                               |                    | -                                                                             |
| Return                 | CommonTypes.ActiveBeneficiary active;          | Addr beneficiary;             |                    | return the beneficiary set in change_beneficiary                              |
|                        |                                                | BeneficiaryTerm term;         | int256 quota;      | return the quota set in change_beneficiary                                    |
|                        |                                                |                               | int256 used_quota; | 0                                                                             |
|                        |                                                |                               | uint64 expiration; | return the expiration set in change_beneficiary                               |
|                        | CommonTypes.PendingBeneficiaryChange proposed; | Addr new_beneficiary;         |                    | Return null for pendingBeneficiary                                            |
|                        |                                                | int256 new_quota;             |                    | -                                                                             |
|                        |                                                | uint64 new_expiration;        |                    | -                                                                             |
|                        |                                                | bool approved_by_beneficiary; |                    | -                                                                             |
|                        |                                                | bool approved_by_nominee;     |                    | -                                                                             |

### Market actor

| Methods                      |                                      |     |     | Scenario 1                                                                              |
|:-----------------------------|:-------------------------------------|:----|:----|:----------------------------------------------------------------------------------------|
| constructor                  |                                      |     |     |                                                                                         |
| Params                       |                                      |     |     |                                                                                         |
|                              |                                      |     |     |                                                                                         |
| Return                       | None                                 |     |     |                                                                                         |
|                              |                                      |     |     |                                                                                         |
| add_balance                  |                                      |     |     |                                                                                         |
| Params                       | CommonTypes.Addr provider_or_client; |     |     | Use a hash table to store the amount deposited by the provider_or_clientReturn          |
|                              |                                      |     |     |                                                                                         |
| withdraw_balance             |                                      |     |     |                                                                                         |
| Params                       | CommonTypes.Addr provider_or_client; |     |     | Deduct the amount deposited by the provider_or_client in the hash table.                |
|                              | int amount;                          |     |     | If less than the specified amount is available, yields the entire available balance     |
| Return                       | int amount_withdrawn;                |     |     | min(available_balance, amount)                                                          |
|                              |                                      |     |     |                                                                                         |
| get_deal_activation          |                                      |     |     |                                                                                         |
| Params                       | uint64 deal_id;                      |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
| Return                       | int64 activated;                     |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              | int64 terminated;                    |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              |                                      |     |     |                                                                                         |
| get_balance                  |                                      |     |     |                                                                                         |
| Params                       | CommonTypes.Addr addr;               |     |     | any address                                                                             |
| Return                       | uint256 balance;                     |     |     | return the balance of the address                                                       |
|                              | uint256 locked;                      |     |     | return 0                                                                                |
|                              |                                      |     |     |                                                                                         |
| get_deal_data_commitment     |                                      |     |     |                                                                                         |
| Params                       | uint64 deal_id;                      |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
| Return                       | CID data;                            |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              | uint64 size;                         |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              |                                      |     |     |                                                                                         |
| get_deal_client              |                                      |     |     |                                                                                         |
| Params                       | uint64 deal_id;                      |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
| Return                       | uint64 client;                       |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              |                                      |     |     |                                                                                         |
|                              |                                      |     |     |                                                                                         |
| get_deal_provider            |                                      |     |     |                                                                                         |
| Params                       | uint64 deal_id;                      |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
| Return                       | uint64 provider;                     |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              |                                      |     |     |                                                                                         |
|                              |                                      |     |     |                                                                                         |
| get_deal_label               |                                      |     |     |                                                                                         |
| Params                       | uint64 deal_id;                      |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
| Return                       | bytes label;                         |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              |                                      |     |     |                                                                                         |
|                              |                                      |     |     |                                                                                         |
| get_deal_term                |                                      |     |     |                                                                                         |
| Params                       | uint64 deal_id;                      |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
| Return                       | int64 start;                         |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              | int64 end;                           |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              |                                      |     |     |                                                                                         |
| get_deal_total_price         |                                      |     |     |                                                                                         |
| Params                       | uint64 deal_id;                      |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
| Return                       | uint256 price_per_epoch;             |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              |                                      |     |     |                                                                                         |
|                              |                                      |     |     |                                                                                         |
| get_deal_client_collateral   |                                      |     |     |                                                                                         |
| Params                       | uint64 deal_id;                      |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
| Return                       | uint256 collateral;                  |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              |                                      |     |     |                                                                                         |
|                              |                                      |     |     |                                                                                         |
| get_deal_provider_collateral |                                      |     |     |                                                                                         |
| Params                       | uint64 deal_id;                      |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
| Return                       | uint256 collateral;                  |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
|                              |                                      |     |     |                                                                                         |
|                              |                                      |     |     |                                                                                         |
| get_deal_verified            |                                      |     |     |                                                                                         |
| Params                       | uint64 deal_id;                      |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
| Return                       | bool verified;                       |     |     | Return data in the mock deals tab; if deal_id does not exisit in that tab, return error |
