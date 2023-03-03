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
        CommonTypes.BigInt memory value;
        uint256 converted;
        bool isOverflow;

        value = CommonTypes.BigInt(hex"ff", false);
        (converted, isOverflow) = value.toUint256();
        require(!isOverflow, "it should be valid");
        require(converted == 255, "'0xff' should be '255'");

        value = CommonTypes.BigInt(hex"ffff", false);
        (converted, isOverflow) = value.toUint256();
        require(!isOverflow, "it should be valid");
        require(converted == 65535, "'0xffff' should be '65535'");

        value = CommonTypes.BigInt(hex"ffffff", false);
        (converted, isOverflow) = value.toUint256();
        require(!isOverflow, "it should be valid");
        require(converted == 16777215, "'0xffffff' should be '16777215'");

        value = CommonTypes.BigInt(hex"ffffffff", false);
        (converted, isOverflow) = value.toUint256();
        require(!isOverflow, "it should be valid");
        require(converted == 4294967295, "'0xffffffff' should be '4294967295'");

        value = CommonTypes.BigInt(hex"ffffffffff", false);
        (converted, isOverflow) = value.toUint256();
        require(!isOverflow, "it should be valid");
        require(converted == 1099511627775, "'0xffffffffff' should be '1099511627775'");

        value = CommonTypes.BigInt(hex"ffffffffffff", false);
        (converted, isOverflow) = value.toUint256();
        require(!isOverflow, "it should be valid");
        require(converted == 281474976710655, "'0xffffffffffff' should be '281474976710655'");

        value = CommonTypes.BigInt(hex"ffffffffffffff", false);
        (converted, isOverflow) = value.toUint256();
        require(!isOverflow, "it should be valid");
        require(converted == 72057594037927935, "'0xffffffffffffff' should be '72057594037927935'");

        value = CommonTypes.BigInt(hex"ffffffffffffffff", false);
        (converted, isOverflow) = value.toUint256();
        require(!isOverflow, "it should be valid");
        require(converted == 18446744073709551615, "'0xffffffffffffffff' should be '18446744073709551615'");

        value = CommonTypes.BigInt(hex"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff", false);
        (converted, isOverflow) = value.toUint256();
        require(!isOverflow, "it should be valid");
        require(
            converted == 115792089237316195423570985008687907853269984665640564039457584007913129639935,
            "'(2 ** 256) - 1' should be '115792089237316195423570985008687907853269984665640564039457584007913129639935'"
        );

        value = CommonTypes.BigInt(hex"00", false);
        (converted, isOverflow) = value.toUint256();
        require(!isOverflow, "it should be valid");
        require(converted == 0, "'0x00' should be '0'");
    }

    function to_int256_positive() public view {
        CommonTypes.BigInt memory value;
        int256 converted;
        bool isOverflow;

        value = CommonTypes.BigInt(hex"ff", false);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == 255, "'0xff' should be '255'");

        value = CommonTypes.BigInt(hex"ffff", false);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == 65535, "'0xffff' should be '65535'");

        value = CommonTypes.BigInt(hex"ffffff", false);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == 16777215, "'0xffffff' should be '16777215'");

        value = CommonTypes.BigInt(hex"ffffffff", false);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == 4294967295, "'0xffffffff' should be '4294967295'");

        value = CommonTypes.BigInt(hex"ffffffffff", false);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == 1099511627775, "'0xffffffffff' should be '1099511627775'");

        value = CommonTypes.BigInt(hex"ffffffffffff", false);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == 281474976710655, "'0xffffffffffff' should be '281474976710655'");

        value = CommonTypes.BigInt(hex"ffffffffffffff", false);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == 72057594037927935, "'0xffffffffffffff' should be '72057594037927935'");

        value = CommonTypes.BigInt(hex"ffffffffffffffff", false);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == 18446744073709551615, "'0xffffffffffffffff' should be '18446744073709551615'");

        value = CommonTypes.BigInt(hex"7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", false);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(
            converted == 57896044618658097711785492504343953926634992332820282019728792003956564819967,
            "'(2 ** 256) / 2 - 1' should be '57896044618658097711785492504343953926634992332820282019728792003956564819967'"
        );

        value = CommonTypes.BigInt(hex"00", false);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == 0, "'0x00' should be '0'");
    }

    function to_int256_negative() public view {
        CommonTypes.BigInt memory value;
        int256 converted;
        bool isOverflow;

        value = CommonTypes.BigInt(hex"ff", true);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == -255, "'0xff' should be '-255'");

        value = CommonTypes.BigInt(hex"ffff", true);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == -65535, "'0xffff' should be '-65535'");

        value = CommonTypes.BigInt(hex"ffffff", true);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == -16777215, "'0xffffff' should be '-16777215'");

        value = CommonTypes.BigInt(hex"ffffffff", true);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == -4294967295, "'0xffffffff' should be '-4294967295'");

        value = CommonTypes.BigInt(hex"ffffffffff", true);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == -1099511627775, "'0xffffffffff' should be '-1099511627775'");

        value = CommonTypes.BigInt(hex"ffffffffffff", true);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == -281474976710655, "'0xffffffffffff' should be '-281474976710655'");

        value = CommonTypes.BigInt(hex"ffffffffffffff", true);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == -72057594037927935, "'0xffffffffffffff' should be '-72057594037927935'");

        value = CommonTypes.BigInt(hex"ffffffffffffffff", true);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(converted == -18446744073709551615, "'0xffffffffffffffff' should be '-18446744073709551615'");

        value = CommonTypes.BigInt(hex"7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", true);
        (converted, isOverflow) = value.toInt256();
        require(!isOverflow, "it should be valid");
        require(
            converted == -57896044618658097711785492504343953926634992332820282019728792003956564819967,
            "'(2 ** 256) / 2 - 1' should be '-57896044618658097711785492504343953926634992332820282019728792003956564819967'"
        );
    }

    function from_uint256() public view {
        CommonTypes.BigInt memory converted;

        converted = BigInts.fromUint256(255);
        require(keccak256(converted.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000000000ff"), "'255' should be '0xff'");
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromUint256(65535);
        require(keccak256(converted.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000000000ffff"), "'65535' should be '0xffff'");
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromUint256(16777215);
        require(
            keccak256(converted.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000000000ffffff"),
            "'16777215' should be '0xffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromUint256(4294967295);
        require(
            keccak256(converted.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000ffffffff"),
            "'4294967295' should be '0xffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromUint256(1099511627775);
        require(
            keccak256(converted.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000ffffffffff"),
            "'1099511627775' should be '0xffffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromUint256(281474976710655);
        require(
            keccak256(converted.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000ffffffffffff"),
            "'281474976710655' should be '0xffffffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromUint256(72057594037927935);
        require(
            keccak256(converted.val) == keccak256(hex"00000000000000000000000000000000000000000000000000ffffffffffffff"),
            "'72057594037927935' should be '0xffffffffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromUint256(18446744073709551615);
        require(
            keccak256(converted.val) == keccak256(hex"000000000000000000000000000000000000000000000000ffffffffffffffff"),
            "'18446744073709551615' should be '0xffffffffffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromUint256(115792089237316195423570985008687907853269984665640564039457584007913129639935);
        require(
            keccak256(converted.val) == keccak256(hex"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"),
            "'115792089237316195423570985008687907853269984665640564039457584007913129639935' should be '0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");
    }

    function from_int256_positive() public view {
        CommonTypes.BigInt memory converted;

        converted = BigInts.fromInt256(255);
        require(keccak256(converted.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000000000ff"), "'255' should be '0xff'");
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromInt256(65535);
        require(keccak256(converted.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000000000ffff"), "'65535' should be '0xffff'");
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromInt256(16777215);
        require(
            keccak256(converted.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000000000ffffff"),
            "'16777215' should be '0xffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromInt256(4294967295);
        require(
            keccak256(converted.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000ffffffff"),
            "'4294967295' should be '0xffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromInt256(1099511627775);
        require(
            keccak256(converted.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000ffffffffff"),
            "'1099511627775' should be '0xffffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromInt256(281474976710655);
        require(
            keccak256(converted.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000ffffffffffff"),
            "'281474976710655' should be '0xffffffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromInt256(72057594037927935);
        require(
            keccak256(converted.val) == keccak256(hex"00000000000000000000000000000000000000000000000000ffffffffffffff"),
            "'72057594037927935' should be '0xffffffffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromInt256(18446744073709551615);
        require(
            keccak256(converted.val) == keccak256(hex"000000000000000000000000000000000000000000000000ffffffffffffffff"),
            "'18446744073709551615' should be '0xffffffffffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");

        converted = BigInts.fromInt256(57896044618658097711785492504343953926634992332820282019728792003956564819967);
        require(
            keccak256(converted.val) == keccak256(hex"7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"),
            "'57896044618658097711785492504343953926634992332820282019728792003956564819967' should be '0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'"
        );
        require(converted.neg == false, "'neg flag should be false'");
    }

    function from_int256_negative() public view {
        CommonTypes.BigInt memory converted;

        converted = BigInts.fromInt256(-255);
        require(keccak256(converted.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000000000ff"), "'255' should be '0xff'");
        require(converted.neg == true, "'neg flag should be false'");

        converted = BigInts.fromInt256(-65535);
        require(keccak256(converted.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000000000ffff"), "'65535' should be '0xffff'");
        require(converted.neg == true, "'neg flag should be false'");

        converted = BigInts.fromInt256(-16777215);
        require(
            keccak256(converted.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000000000ffffff"),
            "'16777215' should be '0xffffff'"
        );
        require(converted.neg == true, "'neg flag should be false'");

        converted = BigInts.fromInt256(-4294967295);
        require(
            keccak256(converted.val) == keccak256(hex"00000000000000000000000000000000000000000000000000000000ffffffff"),
            "'4294967295' should be '0xffffffff'"
        );
        require(converted.neg == true, "'neg flag should be false'");

        converted = BigInts.fromInt256(-1099511627775);
        require(
            keccak256(converted.val) == keccak256(hex"000000000000000000000000000000000000000000000000000000ffffffffff"),
            "'1099511627775' should be '0xffffffffff'"
        );
        require(converted.neg == true, "'neg flag should be false'");

        converted = BigInts.fromInt256(-281474976710655);
        require(
            keccak256(converted.val) == keccak256(hex"0000000000000000000000000000000000000000000000000000ffffffffffff"),
            "'281474976710655' should be '0xffffffffffff'"
        );
        require(converted.neg == true, "'neg flag should be false'");

        converted = BigInts.fromInt256(-72057594037927935);
        require(
            keccak256(converted.val) == keccak256(hex"00000000000000000000000000000000000000000000000000ffffffffffffff"),
            "'72057594037927935' should be '0xffffffffffffff'"
        );
        require(converted.neg == true, "'neg flag should be false'");

        converted = BigInts.fromInt256(-18446744073709551615);
        require(
            keccak256(converted.val) == keccak256(hex"000000000000000000000000000000000000000000000000ffffffffffffffff"),
            "'18446744073709551615' should be '0xffffffffffffffff'"
        );
        require(converted.neg == true, "'neg flag should be false'");

        converted = BigInts.fromInt256(-57896044618658097711785492504343953926634992332820282019728792003956564819967);
        require(
            keccak256(converted.val) == keccak256(hex"7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"),
            "'57896044618658097711785492504343953926634992332820282019728792003956564819967' should be '0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'"
        );
        require(converted.neg == true, "'neg flag should be false'");
    }
}
