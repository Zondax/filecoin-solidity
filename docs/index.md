---
title: "Solidity API"
sidebar_position: 1
---

In the context of the Filecoin EVM, a Solidity library is required in order to allow Solidity smart contracts to seamlessly call methods on Filecoin built-in actors, as well as to access Filecoin specific syscalls idiomatically.

This project combines two different approaches: a **mocked version** of the API, as well as the **real implementation** that interacts with filecoin built-in actors.

## Libraries 
The project repository for the Solidity API can be found [here :link:](https://github.com/Zondax/filecoin-solidity). 

We have also created a public NPM package to facilitate its integration. Check it out [here :link:](https://www.npmjs.com/package/@zondax/filecoin-solidity).

### Mock
They do not actually perform any cross-contract calls or syscalls. It will respond to specific scenarios, which are documented in this doc. The ultimate goal is for devs to be able to replace imports of mocked library with the real one and have their contracts connected to the real protocol.

### API
If you have used the mocked library before, you won't find many changes, so it is almost a smooth experience. In this way, devs will have their contracts connected to the real filecoin protocol.



## Disclaimer :warning::warning:

The project is actually on **beta**. Please, feel free to report any possible bug you encounter with while you make use of it.
