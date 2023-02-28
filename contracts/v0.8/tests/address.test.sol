/*******************************************************************************
 *   (c) 2023 Zondax AG
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

import "../utils/Leb128.sol";
import "../utils/FilAddresses.sol";
import "../types/CommonTypes.sol";
import "@ensdomains/buffer/contracts/Buffer.sol";

/// @notice This file is meant to serve as a deployable contract of the Address lib, as the library by itself is not.
/// @notice It imports the library and create a callable method for each method in the library
/// @author Zondax AG
contract AddressTest {
    function actorid_conversion() public pure {
        uint64 actorID = 1;
        CommonTypes.FilAddress memory result = FilAddresses.fromActorID(actorID);

        require(keccak256(result.data) == keccak256(hex"0001"), "'1' actorID is not returning '0001'");
    }
}
