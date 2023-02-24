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

import "../utils/CborDecode.sol";

/// @notice This file is meant to serve as a deployable contract to test the cbor decode library
/// @author Zondax AG
contract CborDecodeTest {
    using CBORDecoder for bytes;

    function decodeFixedArray() public pure {
        // [1,2,3,4,5,6,7,8,9,10,"test", h'01010101', false, null, true]
        bytes memory input = hex"8F0102030405060708090A64746573744401010101F4F6F5";
        uint index = 0;
        uint arrayLen = 0;
        uint8 num;
        string memory str = "";

        (arrayLen, index) = input.readFixedArray(index);
        require(arrayLen == 15, "array len is not 15");

        (num, index) = input.readUInt8(index);
        require(num == 1, "num is not 1");

        (num, index) = input.readUInt8(index);
        require(num == 2, "num is not 1");

        (num, index) = input.readUInt8(index);
        require(num == 3, "num is not 1");

        (num, index) = input.readUInt8(index);
        require(num == 4, "num is not 1");

        (num, index) = input.readUInt8(index);
        require(num == 5, "num is not 1");

        (num, index) = input.readUInt8(index);
        require(num == 6, "num is not 1");

        (num, index) = input.readUInt8(index);
        require(num == 7, "num is not 1");

        (num, index) = input.readUInt8(index);
        require(num == 8, "num is not 1");

        (num, index) = input.readUInt8(index);
        require(num == 9, "num is not 1");

        (num, index) = input.readUInt8(index);
        require(num == 10, "num is not 1");

        (str, index) = input.readString(index);
        require(keccak256(abi.encodePacked(str)) == keccak256(abi.encodePacked("test")), "str is not 'test'");
    }
}
