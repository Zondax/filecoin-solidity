---
title: "Assumptions"
sidebar_position: 3
---

The libraries have been developed under the following set of assumptions:

- Filecoin actors API has been tested through the rust integration module located in the ref-fvm repository [:link:](https://github.com/Zondax/ref-fvm/tree/lola/fixes).

- The builtin-actors submodule [:link:](https://github.com/Zondax/filecoin-solidity/tree/master/testing) in this repository is the latest version tested on.

- FEVM and Wallaby are still under development. It make happen that newer versions could break or introduce issues in this library.

- Given the immutability of contracts, changes upstreams or in external dependencies may affect the current functionality.
