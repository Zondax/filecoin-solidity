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

import "@zondax/solidity-bignumber/src/BigNumbers.sol";

import "../types/CommonTypes.sol";
import "../utils/BigInts.sol";

/// @notice This file is meant to serve as a deployable contract of the BigInts lib, as the library by itself is not.
/// @notice It imports the library and create a callable method for each method in the library
/// @author Zondax AG
contract BigIntsTest {
    using BigInts for CommonTypes.BigInt;

    function to_uint256() public view {
        CommonTypes.BigInt memory value_1 = CommonTypes.BigInt(hex"ff", false);
        uint256 converted_1 = value_1.toUint256();
        require(converted_1 == 255, "'0xff' should be '255'");

        CommonTypes.BigInt memory value_2 = CommonTypes.BigInt(hex"ffff", false);
        uint256 converted_2 = value_2.toUint256();
        require(converted_2 == 65535, "'0xffff' should be '65535'");

        CommonTypes.BigInt memory value_3 = CommonTypes.BigInt(hex"ffffff", false);
        uint256 converted_3 = value_3.toUint256();
        require(converted_3 == 16777215, "'0xffffff' should be '16777215'");

        CommonTypes.BigInt memory value_4 = CommonTypes.BigInt(hex"ffffffff", false);
        uint256 converted_4 = value_4.toUint256();
        require(converted_4 == 4294967295, "'0xffffffff' should be '4294967295'");

        CommonTypes.BigInt memory value_5 = CommonTypes.BigInt(hex"ffffffffff", false);
        uint256 converted_5 = value_5.toUint256();
        require(converted_5 == 1099511627775, "'0xffffffffff' should be '1099511627775'");

        CommonTypes.BigInt memory value_6 = CommonTypes.BigInt(hex"ffffffffffff", false);
        uint256 converted_6 = value_6.toUint256();
        require(converted_6 == 281474976710655, "'0xffffffffffff' should be '281474976710655'");

        CommonTypes.BigInt memory value_7 = CommonTypes.BigInt(hex"ffffffffffffff", false);
        uint256 converted_7 = value_7.toUint256();
        require(converted_7 == 72057594037927935, "'0xffffffffffffff' should be '72057594037927935'");

        CommonTypes.BigInt memory value_8 = CommonTypes.BigInt(hex"ffffffffffffffff", false);
        uint256 converted_8 = value_8.toUint256();
        require(converted_8 == 18446744073709551615, "'0xffffffffffffffff' should be '18446744073709551615'");

        CommonTypes.BigInt memory value_9 = CommonTypes.BigInt(hex"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff", false);
        uint256 converted_9 = value_9.toUint256();
        require(
            converted_9 == 115792089237316195423570985008687907853269984665640564039457584007913129639935,
            "'(2 ** 256) - 1' should be '115792089237316195423570985008687907853269984665640564039457584007913129639935'"
        );
    }
}
