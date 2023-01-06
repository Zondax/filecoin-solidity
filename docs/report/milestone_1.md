---
title: Milestone 1
sidebar_position: 2
---

In the initial phase of the Milestone 1, we deep dived into built-in actors implementation https://github.com/filecoin-project/builtin-actors/,
and created some mock libraries with the scope to enable developers to start creating their first FEVM DApps.
This mock version don't actually perform any cross-contract calls or syscalls. It responds to specific scenarios.

Then, we will transition our focus on implementing Solidity library containing the APIs present in the mock version, MarketAPI.sol and MinerAPI.sol.
At this stage we will focus on functionality, and gas-consumption and optimizations will be considered in coming stages.

## Deliverables

This mock libraries includes the following features - [Let's go to the project](https://github.com/Zondax/filecoin-solidity/tree/master/contracts/v0.8/mocks) :arrow_upper_right:

### Technical
| Type                            | Category  | Link                                                                                                 |
|---------------------------------|-----------|------------------------------------------------------------------------------------------------------|
| StorageMarket Actor             | Code      | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/contracts/v0.8/mocks/MarketAPI.sol) |
| StorageMiner Actor              | Code      | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/contracts/v0.8/mocks/MinerAPI.sol)  |
| Specific types                  | Code      | [:link:](https://github.com/Zondax/filecoin-solidity/tree/master/contracts/v0.8/mocks/types)         |
| Common types                    | Code      | [:link:](https://github.com/Zondax/filecoin-solidity/tree/master/contracts/v0.8/types)               |
| NPM package                     | Package   | [:link:](https://www.npmjs.com/package/@zondax/filecoin-solidity)                                    |
| CI workflow for automatic build | Tests     | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/.github/workflows/main.yaml)        |

### Documentation

| Category     | Description                      | Link                                                                                                                                |
|--------------|----------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| Introduction | What is the Filecoin blockchain? | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/docs/introduction/introduction.md#what-is-the-filecoin-blockchain) |
| Introduction | What is the FVM?                 | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/docs/introduction/introduction.md#what-is-the-fvm)                 |
| Introduction | What is the FEVM?                | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/docs/introduction/introduction.md#what-is-the-fevm)                |
| Introduction | What is Solilidty?               | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/docs/introduction/tech-involved.md#what-is-solidity)               |
| Introduction | What is the project about?       | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/docs/index.md)                                                     |
| Mocks        | Method Supported                 | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/docs/mocks/mocks.md)                                               |
| Mocks        | How to use it?                   | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/docs/mocks/use-it.md)                                              |
| Mocks        | Deals                            | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/docs/mocks/deals.md)                                               |
| Mocks        | Deploy it                        | [:link:](https://github.com/Zondax/filecoin-solidity/blob/master/docs/deploy-it.md)                                                 |
