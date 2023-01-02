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
//
pragma solidity >=0.4.25 <=0.8.17;

import "../types/DataCapTypes.sol";
import "../DataCapAPI.sol";

/// @author Zondax AG
library DataCapApiTest {
    function name() public returns (string memory) {
        return DataCapAPI.name();
    }

    function symbol() public returns (string memory) {
        return DataCapAPI.symbol();
    }

    function total_supply() public returns (int256) {
        return DataCapAPI.total_supply();
    }

    function balance(bytes memory addr) public returns (int256) {
        return DataCapAPI.balance(addr);
    }

    function allowance(DataCapTypes.GetAllowanceParams memory params) public returns (int256) {
        return DataCapAPI.allowance(params);
    }

    function transfer(DataCapTypes.TransferParams memory params) public returns (DataCapTypes.TransferReturn memory) {
        return DataCapAPI.transfer(params);
    }

    function transfer_from(DataCapTypes.TransferFromParams memory params) public returns (DataCapTypes.TransferFromReturn memory) {
        return DataCapAPI.transfer_from(params);
    }

    function increase_allowance(DataCapTypes.IncreaseAllowanceParams memory params) public returns (int256) {
        return DataCapAPI.increase_allowance(params);
    }

    function decrease_allowance(DataCapTypes.DecreaseAllowanceParams memory params) public returns (int256) {
        return DataCapAPI.decrease_allowance(params);
    }

    function revoke_allowance(DataCapTypes.RevokeAllowanceParams memory params) public returns (int256) {
        return DataCapAPI.revoke_allowance(params);
    }

    function burn(DataCapTypes.BurnParams memory params) public returns (DataCapTypes.BurnReturn memory) {
        return DataCapAPI.burn(params);
    }

    function burn_from(DataCapTypes.BurnFromParams memory params) public returns (DataCapTypes.BurnFromReturn memory) {
        return DataCapAPI.burn_from(params);
    }

    function handle_filecoin_method(uint64 method, uint64 codec, bytes calldata params) public pure returns (uint64) {
        require((codec == 0) == (params.length == 0));
        return method;
    }
}
