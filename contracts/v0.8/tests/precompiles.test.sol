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

import "../PrecompilesAPI.sol";

/// @author Zondax AG
contract PrecompilesApiTest {
    function resolve_address(bytes memory addr) public view returns (uint64) {
        return PrecompilesAPI.resolveAddress(addr);
    }

    function resolve_eth_address(bytes memory addr) public view returns (uint64) {
        return PrecompilesAPI.resolveEthAddress(addr);
    }

    function lookup_delegated_address(uint64 actor_id) public view returns (bytes memory) {
        return PrecompilesAPI.lookupDelegatedAddress(actor_id);
    }

    function get_actor_type(uint64 actor_id) public view returns (uint256) {
        return PrecompilesAPI.getActorType(actor_id);
    }
}
