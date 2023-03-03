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

        CommonTypes.BigInt memory value_10 = CommonTypes.BigInt(hex"00", false);
        uint256 converted_10 = value_10.toUint256();
        require(converted_10 == 0, "'0x00' should be '0'");
    }

    function to_int256_positive() public view {
        CommonTypes.BigInt memory value_1 = CommonTypes.BigInt(hex"ff", false);
        int256 converted_1 = value_1.toInt256();
        require(converted_1 == 255, "'0xff' should be '255'");

        CommonTypes.BigInt memory value_2 = CommonTypes.BigInt(hex"ffff", false);
        int256 converted_2 = value_2.toInt256();
        require(converted_2 == 65535, "'0xffff' should be '65535'");

        CommonTypes.BigInt memory value_3 = CommonTypes.BigInt(hex"ffffff", false);
        int256 converted_3 = value_3.toInt256();
        require(converted_3 == 16777215, "'0xffffff' should be '16777215'");

        CommonTypes.BigInt memory value_4 = CommonTypes.BigInt(hex"ffffffff", false);
        int256 converted_4 = value_4.toInt256();
        require(converted_4 == 4294967295, "'0xffffffff' should be '4294967295'");

        CommonTypes.BigInt memory value_5 = CommonTypes.BigInt(hex"ffffffffff", false);
        int256 converted_5 = value_5.toInt256();
        require(converted_5 == 1099511627775, "'0xffffffffff' should be '1099511627775'");

        CommonTypes.BigInt memory value_6 = CommonTypes.BigInt(hex"ffffffffffff", false);
        int256 converted_6 = value_6.toInt256();
        require(converted_6 == 281474976710655, "'0xffffffffffff' should be '281474976710655'");

        CommonTypes.BigInt memory value_7 = CommonTypes.BigInt(hex"ffffffffffffff", false);
        int256 converted_7 = value_7.toInt256();
        require(converted_7 == 72057594037927935, "'0xffffffffffffff' should be '72057594037927935'");

        CommonTypes.BigInt memory value_8 = CommonTypes.BigInt(hex"ffffffffffffffff", false);
        int256 converted_8 = value_8.toInt256();
        require(converted_8 == 18446744073709551615, "'0xffffffffffffffff' should be '18446744073709551615'");

        CommonTypes.BigInt memory value_9 = CommonTypes.BigInt(hex"7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", false);
        int256 converted_9 = value_9.toInt256();
        require(
            converted_9 == 57896044618658097711785492504343953926634992332820282019728792003956564819967,
            "'(2 ** 256) / 2 - 1' should be '57896044618658097711785492504343953926634992332820282019728792003956564819967'"
        );

        CommonTypes.BigInt memory value_10 = CommonTypes.BigInt(hex"00", false);
        int256 converted_10 = value_10.toInt256();
        require(converted_10 == 0, "'0x00' should be '0'");
    }

    function to_int256_negative() public view {
        CommonTypes.BigInt memory value_1 = CommonTypes.BigInt(hex"ff", true);
        int256 converted_1 = value_1.toInt256();
        require(converted_1 == -255, "'0xff' should be '-255'");

        CommonTypes.BigInt memory value_2 = CommonTypes.BigInt(hex"ffff", true);
        int256 converted_2 = value_2.toInt256();
        require(converted_2 == -65535, "'0xffff' should be '-65535'");

        CommonTypes.BigInt memory value_3 = CommonTypes.BigInt(hex"ffffff", true);
        int256 converted_3 = value_3.toInt256();
        require(converted_3 == -16777215, "'0xffffff' should be '-16777215'");

        CommonTypes.BigInt memory value_4 = CommonTypes.BigInt(hex"ffffffff", true);
        int256 converted_4 = value_4.toInt256();
        require(converted_4 == -4294967295, "'0xffffffff' should be '-4294967295'");

        CommonTypes.BigInt memory value_5 = CommonTypes.BigInt(hex"ffffffffff", true);
        int256 converted_5 = value_5.toInt256();
        require(converted_5 == -1099511627775, "'0xffffffffff' should be '-1099511627775'");

        CommonTypes.BigInt memory value_6 = CommonTypes.BigInt(hex"ffffffffffff", true);
        int256 converted_6 = value_6.toInt256();
        require(converted_6 == -281474976710655, "'0xffffffffffff' should be '-281474976710655'");

        CommonTypes.BigInt memory value_7 = CommonTypes.BigInt(hex"ffffffffffffff", true);
        int256 converted_7 = value_7.toInt256();
        require(converted_7 == -72057594037927935, "'0xffffffffffffff' should be '-72057594037927935'");

        CommonTypes.BigInt memory value_8 = CommonTypes.BigInt(hex"ffffffffffffffff", true);
        int256 converted_8 = value_8.toInt256();
        require(converted_8 == -18446744073709551615, "'0xffffffffffffffff' should be '-18446744073709551615'");

        CommonTypes.BigInt memory value_9 = CommonTypes.BigInt(hex"7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", true);
        int256 converted_9 = value_9.toInt256();
        require(
            converted_9 == -57896044618658097711785492504343953926634992332820282019728792003956564819967,
            "'(2 ** 256) / 2 - 1' should be '-57896044618658097711785492504343953926634992332820282019728792003956564819967'"
        );
    }

    function from_uint256() public view {
        CommonTypes.BigInt memory converted_1 = BigInts.fromUint256(255);
        require(keccak256(converted_1.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000000000ff"), "'255' should be '0xff'");
        require(converted_1.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_2 = BigInts.fromUint256(65535);
        require(keccak256(converted_2.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000000000ffff"), "'65535' should be '0xffff'");
        require(converted_2.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_3 = BigInts.fromUint256(16777215);
        require(
            keccak256(converted_3.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000000000ffffff"),
            "'16777215' should be '0xffffff'"
        );
        require(converted_3.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_4 = BigInts.fromUint256(4294967295);
        require(
            keccak256(converted_4.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000ffffffff"),
            "'4294967295' should be '0xffffffff'"
        );
        require(converted_4.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_5 = BigInts.fromUint256(1099511627775);
        require(
            keccak256(converted_5.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000ffffffffff"),
            "'1099511627775' should be '0xffffffffff'"
        );
        require(converted_5.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_6 = BigInts.fromUint256(281474976710655);
        require(
            keccak256(converted_6.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000ffffffffffff"),
            "'281474976710655' should be '0xffffffffffff'"
        );
        require(converted_6.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_7 = BigInts.fromUint256(72057594037927935);
        require(
            keccak256(converted_7.val) == keccak256(hex"00000000000000000000000000000000000000000000000000ffffffffffffff"),
            "'72057594037927935' should be '0xffffffffffffff'"
        );
        require(converted_7.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_8 = BigInts.fromUint256(18446744073709551615);
        require(
            keccak256(converted_8.val) == keccak256(hex"000000000000000000000000000000000000000000000000ffffffffffffffff"),
            "'18446744073709551615' should be '0xffffffffffffffff'"
        );
        require(converted_8.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_9 = BigInts.fromUint256(115792089237316195423570985008687907853269984665640564039457584007913129639935);
        require(
            keccak256(converted_9.val) == keccak256(hex"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"),
            "'115792089237316195423570985008687907853269984665640564039457584007913129639935' should be '0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'"
        );
        require(converted_9.neg == false, "'neg flag should be false'");
    }

    function from_int256_positive() public view {
        CommonTypes.BigInt memory converted_1 = BigInts.fromInt256(255);
        require(keccak256(converted_1.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000000000ff"), "'255' should be '0xff'");
        require(converted_1.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_2 = BigInts.fromInt256(65535);
        require(keccak256(converted_2.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000000000ffff"), "'65535' should be '0xffff'");
        require(converted_2.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_3 = BigInts.fromInt256(16777215);
        require(
            keccak256(converted_3.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000000000ffffff"),
            "'16777215' should be '0xffffff'"
        );
        require(converted_3.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_4 = BigInts.fromInt256(4294967295);
        require(
            keccak256(converted_4.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000ffffffff"),
            "'4294967295' should be '0xffffffff'"
        );
        require(converted_4.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_5 = BigInts.fromInt256(1099511627775);
        require(
            keccak256(converted_5.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000ffffffffff"),
            "'1099511627775' should be '0xffffffffff'"
        );
        require(converted_5.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_6 = BigInts.fromInt256(281474976710655);
        require(
            keccak256(converted_6.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000ffffffffffff"),
            "'281474976710655' should be '0xffffffffffff'"
        );
        require(converted_6.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_7 = BigInts.fromInt256(72057594037927935);
        require(
            keccak256(converted_7.val) == keccak256(hex"00000000000000000000000000000000000000000000000000ffffffffffffff"),
            "'72057594037927935' should be '0xffffffffffffff'"
        );
        require(converted_7.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_8 = BigInts.fromInt256(18446744073709551615);
        require(
            keccak256(converted_8.val) == keccak256(hex"000000000000000000000000000000000000000000000000ffffffffffffffff"),
            "'18446744073709551615' should be '0xffffffffffffffff'"
        );
        require(converted_8.neg == false, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_9 = BigInts.fromInt256(57896044618658097711785492504343953926634992332820282019728792003956564819967);
        require(
            keccak256(converted_9.val) == keccak256(hex"7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"),
            "'57896044618658097711785492504343953926634992332820282019728792003956564819967' should be '0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'"
        );
        require(converted_9.neg == false, "'neg flag should be false'");
    }

    function from_int256_negative() public view {
        CommonTypes.BigInt memory converted_1 = BigInts.fromInt256(-255);
        require(keccak256(converted_1.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000000000ff"), "'255' should be '0xff'");
        require(converted_1.neg == true, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_2 = BigInts.fromInt256(-65535);
        require(keccak256(converted_2.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000000000ffff"), "'65535' should be '0xffff'");
        require(converted_2.neg == true, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_3 = BigInts.fromInt256(-16777215);
        require(
            keccak256(converted_3.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000000000ffffff"),
            "'16777215' should be '0xffffff'"
        );
        require(converted_3.neg == true, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_4 = BigInts.fromInt256(-4294967295);
        require(
            keccak256(converted_4.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000ffffffff"),
            "'4294967295' should be '0xffffffff'"
        );
        require(converted_4.neg == true, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_5 = BigInts.fromInt256(-1099511627775);
        require(
            keccak256(converted_5.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000ffffffffff"),
            "'1099511627775' should be '0xffffffffff'"
        );
        require(converted_5.neg == true, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_6 = BigInts.fromInt256(-281474976710655);
        require(
            keccak256(converted_6.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000ffffffffffff"),
            "'281474976710655' should be '0xffffffffffff'"
        );
        require(converted_6.neg == true, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_7 = BigInts.fromInt256(-72057594037927935);
        require(
            keccak256(converted_7.val) == keccak256(hex"00000000000000000000000000000000000000000000000000ffffffffffffff"),
            "'72057594037927935' should be '0xffffffffffffff'"
        );
        require(converted_7.neg == true, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_8 = BigInts.fromInt256(-18446744073709551615);
        require(
            keccak256(converted_8.val) == keccak256(hex"000000000000000000000000000000000000000000000000ffffffffffffffff"),
            "'18446744073709551615' should be '0xffffffffffffffff'"
        );
        require(converted_8.neg == true, "'neg flag should be false'");

        CommonTypes.BigInt memory converted_9 = BigInts.fromInt256(-57896044618658097711785492504343953926634992332820282019728792003956564819967);
        require(
            keccak256(converted_9.val) == keccak256(hex"7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"),
            "'57896044618658097711785492504343953926634992332820282019728792003956564819967' should be '0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'"
        );
        require(converted_9.neg == true, "'neg flag should be false'");
    }
}
