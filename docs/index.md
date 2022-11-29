---
title: "Solidity API"
sidebar_position: 1
---

In the context of the Filecoin EVM, a Solidity library is required in order to allow Solidity smart contracts to seamlessly call methods on Filecoin built-in actors, as well as to access Filecoin specific syscalls idiomatically.

This project is the actual implementation this amazing goal. If you have used the mocked library before. You won't find many changes, so it is almost a smooth experience. In this way, devs will have their contracts connected to the real filecoin protocol.

You can check the Solidity API repo here [:link:](https://github.com/Zondax/fevm-solidity-api)

We have also created an NPM package to facilitate its integration [:link:](https://www.npmjs.com/package/@zondax/filecoin-solidity-api)

