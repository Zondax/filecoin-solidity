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
pragma solidity ^0.8.0;

import "./types/CommonTypes.sol";

/// @title This library simplify the call of FEVM precompiles contracts.
/// @author Zondax AG
library PrecompilesAPI {
    address constant RESOLVE_ADDRESS_PRECOMPILE_ADDR = 0xFE00000000000000000000000000000000000001;
    address constant LOOKUP_DELEGATED_ADDRESS_PRECOMPILE_ADDR = 0xfE00000000000000000000000000000000000002;

    /// @notice get the actor id from an actor address
    /// @param addr actor address you want to get id from (in bytes format, not string)
    /// @return the actor id
    function resolveAddress(CommonTypes.FilAddress memory addr) internal view returns (uint64) {
        (bool success, bytes memory raw_response) = address(RESOLVE_ADDRESS_PRECOMPILE_ADDR).staticcall(addr.data);
        require(success == true, "resolve address error");

        uint256 actor_id = abi.decode(raw_response, (uint256));

        return uint64(actor_id);
    }

    /// @notice get the actor id from an eth address
    /// @param addr eth address you want to get id from (in bytes format)
    /// @return the actor id
    function resolveEthAddress(address addr) internal view returns (uint64) {
        bytes memory delegatedAddr = abi.encodePacked(hex"040a", addr);

        (bool success, bytes memory raw_response) = address(RESOLVE_ADDRESS_PRECOMPILE_ADDR).staticcall(delegatedAddr);
        require(success == true, "resolve eth address error");

        uint256 actor_id = abi.decode(raw_response, (uint256));

        return uint64(actor_id);
    }

    /// @notice get the actor delegated address (f4) from an actor id
    /// @param actor_id actor id you want to get the delegated address (f4) from
    /// @return delegated address in bytes format (not string)
    function lookupDelegatedAddress(uint64 actor_id) internal view returns (bytes memory) {
        (bool success, bytes memory raw_response) = address(LOOKUP_DELEGATED_ADDRESS_PRECOMPILE_ADDR).staticcall(abi.encodePacked(uint256(actor_id)));
        require(success == true, "lookup delegated address error");

        return raw_response;
    }
}
