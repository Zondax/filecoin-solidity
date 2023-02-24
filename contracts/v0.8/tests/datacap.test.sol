/*******************************************************************************
 *   (c) 2022 Zondax AG
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 ********************************************************************************/
//
// DRAFT!! THIS CODE HAS NOT BEEN AUDITED - USE ONLY FOR PROTOTYPING

// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import "../types/DataCapTypes.sol";
import "../types/CommonTypes.sol";
import "../cbor/BigIntCbor.sol";
import "../DataCapAPI.sol";
import "../Utils.sol";

/// @notice This file is meant to serve as a deployable contract of the datacap actor API, as the library by itself is not.
/// @notice It imports the library and create a callable method for each method in the library
/// @author Zondax AG
contract DataCapApiTest {
    function name() public returns (string memory) {
        return DataCapAPI.name();
    }

    function symbol() public returns (string memory) {
        return DataCapAPI.symbol();
    }

    function total_supply() public returns (CommonTypes.BigInt memory) {
        return DataCapAPI.totalSupply();
    }

    function balance(CommonTypes.FilAddress memory addr) public returns (CommonTypes.BigInt memory) {
        return DataCapAPI.balance(addr);
    }

    function allowance(DataCapTypes.GetAllowanceParams memory params) public returns (CommonTypes.BigInt memory) {
        return DataCapAPI.allowance(params);
    }

    function transfer(DataCapTypes.TransferParams memory params) public returns (DataCapTypes.TransferReturn memory) {
        return DataCapAPI.transfer(params);
    }

    function transfer_from(DataCapTypes.TransferFromParams memory params) public returns (DataCapTypes.TransferFromReturn memory) {
        return DataCapAPI.transferFrom(params);
    }

    function increase_allowance(DataCapTypes.IncreaseAllowanceParams memory params) public returns (CommonTypes.BigInt memory) {
        return DataCapAPI.increaseAllowance(params);
    }

    function decrease_allowance(DataCapTypes.DecreaseAllowanceParams memory params) public returns (CommonTypes.BigInt memory) {
        return DataCapAPI.decreaseAllowance(params);
    }

    function revoke_allowance(CommonTypes.FilAddress memory operator) public returns (CommonTypes.BigInt memory) {
        return DataCapAPI.revokeAllowance(operator);
    }

    function burn(CommonTypes.BigInt memory amount) public returns (CommonTypes.BigInt memory) {
        return DataCapAPI.burn(amount);
    }

    function burn_from(DataCapTypes.BurnFromParams memory params) public returns (DataCapTypes.BurnFromReturn memory) {
        return DataCapAPI.burnFrom(params);
    }

    function handle_filecoin_method(uint64 method, uint64 codec, bytes calldata params) public pure {
        Utils.handleFilecoinMethod(method, codec, params);
    }
}
