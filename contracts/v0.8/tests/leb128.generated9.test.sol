
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
import "../external/Buffer.sol";

/// @notice This file is meant to serve as a deployable contract of the Leb128 lib, as the library by itself is not.
/// @notice It imports the library and create a callable method for each method in the library
/// @author Zondax AG
contract Leb128Generated9Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {

        bytes memory expected560 = hex"cfe7959f04";
        uint64 value560 = 1139110863;

        Buffer.buffer memory result560 = Leb128.encodeUnsignedLeb128FromUInt64(value560);

        require(keccak256(result560.buf) == keccak256(expected560), "'1139110863' is not returning 'cfe7959f04'");

        bytes memory expected561 = hex"fee6869d0a";
        uint64 value561 = 2745283454;

        Buffer.buffer memory result561 = Leb128.encodeUnsignedLeb128FromUInt64(value561);

        require(keccak256(result561.buf) == keccak256(expected561), "'2745283454' is not returning 'fee6869d0a'");

        bytes memory expected562 = hex"bdb794dd02";
        uint64 value562 = 732240829;

        Buffer.buffer memory result562 = Leb128.encodeUnsignedLeb128FromUInt64(value562);

        require(keccak256(result562.buf) == keccak256(expected562), "'732240829' is not returning 'bdb794dd02'");

        bytes memory expected563 = hex"88e2bca101";
        uint64 value563 = 338637064;

        Buffer.buffer memory result563 = Leb128.encodeUnsignedLeb128FromUInt64(value563);

        require(keccak256(result563.buf) == keccak256(expected563), "'338637064' is not returning '88e2bca101'");

        bytes memory expected564 = hex"92fdbf8f03";
        uint64 value564 = 837811858;

        Buffer.buffer memory result564 = Leb128.encodeUnsignedLeb128FromUInt64(value564);

        require(keccak256(result564.buf) == keccak256(expected564), "'837811858' is not returning '92fdbf8f03'");

        bytes memory expected565 = hex"e198cd8907";
        uint64 value565 = 1899187297;

        Buffer.buffer memory result565 = Leb128.encodeUnsignedLeb128FromUInt64(value565);

        require(keccak256(result565.buf) == keccak256(expected565), "'1899187297' is not returning 'e198cd8907'");

        bytes memory expected566 = hex"cbf9a6d706";
        uint64 value566 = 1793703115;

        Buffer.buffer memory result566 = Leb128.encodeUnsignedLeb128FromUInt64(value566);

        require(keccak256(result566.buf) == keccak256(expected566), "'1793703115' is not returning 'cbf9a6d706'");

        bytes memory expected567 = hex"b8e4f4ce09";
        uint64 value567 = 2581410360;

        Buffer.buffer memory result567 = Leb128.encodeUnsignedLeb128FromUInt64(value567);

        require(keccak256(result567.buf) == keccak256(expected567), "'2581410360' is not returning 'b8e4f4ce09'");

        bytes memory expected568 = hex"848cf1d70b";
        uint64 value568 = 3137095172;

        Buffer.buffer memory result568 = Leb128.encodeUnsignedLeb128FromUInt64(value568);

        require(keccak256(result568.buf) == keccak256(expected568), "'3137095172' is not returning '848cf1d70b'");

        bytes memory expected569 = hex"a795c503";
        uint64 value569 = 7424679;

        Buffer.buffer memory result569 = Leb128.encodeUnsignedLeb128FromUInt64(value569);

        require(keccak256(result569.buf) == keccak256(expected569), "'7424679' is not returning 'a795c503'");

        bytes memory expected570 = hex"efd493b305";
        uint64 value570 = 1449454191;

        Buffer.buffer memory result570 = Leb128.encodeUnsignedLeb128FromUInt64(value570);

        require(keccak256(result570.buf) == keccak256(expected570), "'1449454191' is not returning 'efd493b305'");

        bytes memory expected571 = hex"bdd9b6990f";
        uint64 value571 = 4079856829;

        Buffer.buffer memory result571 = Leb128.encodeUnsignedLeb128FromUInt64(value571);

        require(keccak256(result571.buf) == keccak256(expected571), "'4079856829' is not returning 'bdd9b6990f'");

        bytes memory expected572 = hex"c882ffc909";
        uint64 value572 = 2571092296;

        Buffer.buffer memory result572 = Leb128.encodeUnsignedLeb128FromUInt64(value572);

        require(keccak256(result572.buf) == keccak256(expected572), "'2571092296' is not returning 'c882ffc909'");

        bytes memory expected573 = hex"9987e2ec0d";
        uint64 value573 = 3717759897;

        Buffer.buffer memory result573 = Leb128.encodeUnsignedLeb128FromUInt64(value573);

        require(keccak256(result573.buf) == keccak256(expected573), "'3717759897' is not returning '9987e2ec0d'");

        bytes memory expected574 = hex"f7a0e2de0a";
        uint64 value574 = 2883096695;

        Buffer.buffer memory result574 = Leb128.encodeUnsignedLeb128FromUInt64(value574);

        require(keccak256(result574.buf) == keccak256(expected574), "'2883096695' is not returning 'f7a0e2de0a'");

        bytes memory expected575 = hex"a7bfb2a606";
        uint64 value575 = 1691131815;

        Buffer.buffer memory result575 = Leb128.encodeUnsignedLeb128FromUInt64(value575);

        require(keccak256(result575.buf) == keccak256(expected575), "'1691131815' is not returning 'a7bfb2a606'");

        bytes memory expected576 = hex"b6a39ef707";
        uint64 value576 = 2129105334;

        Buffer.buffer memory result576 = Leb128.encodeUnsignedLeb128FromUInt64(value576);

        require(keccak256(result576.buf) == keccak256(expected576), "'2129105334' is not returning 'b6a39ef707'");

        bytes memory expected577 = hex"8ea7cce103";
        uint64 value577 = 1009980302;

        Buffer.buffer memory result577 = Leb128.encodeUnsignedLeb128FromUInt64(value577);

        require(keccak256(result577.buf) == keccak256(expected577), "'1009980302' is not returning '8ea7cce103'");

        bytes memory expected578 = hex"fdd3c4e50c";
        uint64 value578 = 3434162685;

        Buffer.buffer memory result578 = Leb128.encodeUnsignedLeb128FromUInt64(value578);

        require(keccak256(result578.buf) == keccak256(expected578), "'3434162685' is not returning 'fdd3c4e50c'");

        bytes memory expected579 = hex"fdf193b102";
        uint64 value579 = 639957245;

        Buffer.buffer memory result579 = Leb128.encodeUnsignedLeb128FromUInt64(value579);

        require(keccak256(result579.buf) == keccak256(expected579), "'639957245' is not returning 'fdf193b102'");

        bytes memory expected580 = hex"cff9e7bc03";
        uint64 value580 = 932838607;

        Buffer.buffer memory result580 = Leb128.encodeUnsignedLeb128FromUInt64(value580);

        require(keccak256(result580.buf) == keccak256(expected580), "'932838607' is not returning 'cff9e7bc03'");

        bytes memory expected581 = hex"bcc0e7860c";
        uint64 value581 = 3235504188;

        Buffer.buffer memory result581 = Leb128.encodeUnsignedLeb128FromUInt64(value581);

        require(keccak256(result581.buf) == keccak256(expected581), "'3235504188' is not returning 'bcc0e7860c'");

        bytes memory expected582 = hex"8bcde0b204";
        uint64 value582 = 1180182155;

        Buffer.buffer memory result582 = Leb128.encodeUnsignedLeb128FromUInt64(value582);

        require(keccak256(result582.buf) == keccak256(expected582), "'1180182155' is not returning '8bcde0b204'");

        bytes memory expected583 = hex"e8f6c2940b";
        uint64 value583 = 2995829608;

        Buffer.buffer memory result583 = Leb128.encodeUnsignedLeb128FromUInt64(value583);

        require(keccak256(result583.buf) == keccak256(expected583), "'2995829608' is not returning 'e8f6c2940b'");

        bytes memory expected584 = hex"ab8bbccc03";
        uint64 value584 = 965674411;

        Buffer.buffer memory result584 = Leb128.encodeUnsignedLeb128FromUInt64(value584);

        require(keccak256(result584.buf) == keccak256(expected584), "'965674411' is not returning 'ab8bbccc03'");

        bytes memory expected585 = hex"a3b7c0b401";
        uint64 value585 = 378543011;

        Buffer.buffer memory result585 = Leb128.encodeUnsignedLeb128FromUInt64(value585);

        require(keccak256(result585.buf) == keccak256(expected585), "'378543011' is not returning 'a3b7c0b401'");

        bytes memory expected586 = hex"cfc5c2fb0f";
        uint64 value586 = 4285571791;

        Buffer.buffer memory result586 = Leb128.encodeUnsignedLeb128FromUInt64(value586);

        require(keccak256(result586.buf) == keccak256(expected586), "'4285571791' is not returning 'cfc5c2fb0f'");

        bytes memory expected587 = hex"c195bd8601";
        uint64 value587 = 282020545;

        Buffer.buffer memory result587 = Leb128.encodeUnsignedLeb128FromUInt64(value587);

        require(keccak256(result587.buf) == keccak256(expected587), "'282020545' is not returning 'c195bd8601'");

        bytes memory expected588 = hex"db98edfa08";
        uint64 value588 = 2405125211;

        Buffer.buffer memory result588 = Leb128.encodeUnsignedLeb128FromUInt64(value588);

        require(keccak256(result588.buf) == keccak256(expected588), "'2405125211' is not returning 'db98edfa08'");

        bytes memory expected589 = hex"af88dc9e03";
        uint64 value589 = 869729327;

        Buffer.buffer memory result589 = Leb128.encodeUnsignedLeb128FromUInt64(value589);

        require(keccak256(result589.buf) == keccak256(expected589), "'869729327' is not returning 'af88dc9e03'");

        bytes memory expected590 = hex"8097af8808";
        uint64 value590 = 2165033856;

        Buffer.buffer memory result590 = Leb128.encodeUnsignedLeb128FromUInt64(value590);

        require(keccak256(result590.buf) == keccak256(expected590), "'2165033856' is not returning '8097af8808'");

        bytes memory expected591 = hex"ec98c7f10b";
        uint64 value591 = 3190934636;

        Buffer.buffer memory result591 = Leb128.encodeUnsignedLeb128FromUInt64(value591);

        require(keccak256(result591.buf) == keccak256(expected591), "'3190934636' is not returning 'ec98c7f10b'");

        bytes memory expected592 = hex"e3cfa6e805";
        uint64 value592 = 1560913891;

        Buffer.buffer memory result592 = Leb128.encodeUnsignedLeb128FromUInt64(value592);

        require(keccak256(result592.buf) == keccak256(expected592), "'1560913891' is not returning 'e3cfa6e805'");

        bytes memory expected593 = hex"dcffe7ee0e";
        uint64 value593 = 3990487004;

        Buffer.buffer memory result593 = Leb128.encodeUnsignedLeb128FromUInt64(value593);

        require(keccak256(result593.buf) == keccak256(expected593), "'3990487004' is not returning 'dcffe7ee0e'");

        bytes memory expected594 = hex"e9ed92ee0b";
        uint64 value594 = 3183785705;

        Buffer.buffer memory result594 = Leb128.encodeUnsignedLeb128FromUInt64(value594);

        require(keccak256(result594.buf) == keccak256(expected594), "'3183785705' is not returning 'e9ed92ee0b'");

        bytes memory expected595 = hex"dbb1c29509";
        uint64 value595 = 2461047003;

        Buffer.buffer memory result595 = Leb128.encodeUnsignedLeb128FromUInt64(value595);

        require(keccak256(result595.buf) == keccak256(expected595), "'2461047003' is not returning 'dbb1c29509'");

        bytes memory expected596 = hex"b7b7c9f00f";
        uint64 value596 = 4262615991;

        Buffer.buffer memory result596 = Leb128.encodeUnsignedLeb128FromUInt64(value596);

        require(keccak256(result596.buf) == keccak256(expected596), "'4262615991' is not returning 'b7b7c9f00f'");

        bytes memory expected597 = hex"facab9a205";
        uint64 value597 = 1414423930;

        Buffer.buffer memory result597 = Leb128.encodeUnsignedLeb128FromUInt64(value597);

        require(keccak256(result597.buf) == keccak256(expected597), "'1414423930' is not returning 'facab9a205'");

        bytes memory expected598 = hex"c6e4c4dc03";
        uint64 value598 = 999371334;

        Buffer.buffer memory result598 = Leb128.encodeUnsignedLeb128FromUInt64(value598);

        require(keccak256(result598.buf) == keccak256(expected598), "'999371334' is not returning 'c6e4c4dc03'");

        bytes memory expected599 = hex"b9ffbba506";
        uint64 value599 = 1689190329;

        Buffer.buffer memory result599 = Leb128.encodeUnsignedLeb128FromUInt64(value599);

        require(keccak256(result599.buf) == keccak256(expected599), "'1689190329' is not returning 'b9ffbba506'");

        bytes memory expected600 = hex"a3e2c420";
        uint64 value600 = 68235555;

        Buffer.buffer memory result600 = Leb128.encodeUnsignedLeb128FromUInt64(value600);

        require(keccak256(result600.buf) == keccak256(expected600), "'68235555' is not returning 'a3e2c420'");

        bytes memory expected601 = hex"e9fdd476";
        uint64 value601 = 248856297;

        Buffer.buffer memory result601 = Leb128.encodeUnsignedLeb128FromUInt64(value601);

        require(keccak256(result601.buf) == keccak256(expected601), "'248856297' is not returning 'e9fdd476'");

        bytes memory expected602 = hex"feefa79f0f";
        uint64 value602 = 4092196862;

        Buffer.buffer memory result602 = Leb128.encodeUnsignedLeb128FromUInt64(value602);

        require(keccak256(result602.buf) == keccak256(expected602), "'4092196862' is not returning 'feefa79f0f'");

        bytes memory expected603 = hex"e3db9f820d";
        uint64 value603 = 3494374883;

        Buffer.buffer memory result603 = Leb128.encodeUnsignedLeb128FromUInt64(value603);

        require(keccak256(result603.buf) == keccak256(expected603), "'3494374883' is not returning 'e3db9f820d'");

        bytes memory expected604 = hex"e3fed9bd0a";
        uint64 value604 = 2813755235;

        Buffer.buffer memory result604 = Leb128.encodeUnsignedLeb128FromUInt64(value604);

        require(keccak256(result604.buf) == keccak256(expected604), "'2813755235' is not returning 'e3fed9bd0a'");

        bytes memory expected605 = hex"cbc2bdf204";
        uint64 value605 = 1313825099;

        Buffer.buffer memory result605 = Leb128.encodeUnsignedLeb128FromUInt64(value605);

        require(keccak256(result605.buf) == keccak256(expected605), "'1313825099' is not returning 'cbc2bdf204'");

        bytes memory expected606 = hex"9ef5c5d309";
        uint64 value606 = 2591128222;

        Buffer.buffer memory result606 = Leb128.encodeUnsignedLeb128FromUInt64(value606);

        require(keccak256(result606.buf) == keccak256(expected606), "'2591128222' is not returning '9ef5c5d309'");

        bytes memory expected607 = hex"bac0d7d605";
        uint64 value607 = 1523966010;

        Buffer.buffer memory result607 = Leb128.encodeUnsignedLeb128FromUInt64(value607);

        require(keccak256(result607.buf) == keccak256(expected607), "'1523966010' is not returning 'bac0d7d605'");

        bytes memory expected608 = hex"fae2d89904";
        uint64 value608 = 1127625082;

        Buffer.buffer memory result608 = Leb128.encodeUnsignedLeb128FromUInt64(value608);

        require(keccak256(result608.buf) == keccak256(expected608), "'1127625082' is not returning 'fae2d89904'");

        bytes memory expected609 = hex"8ab19dd704";
        uint64 value609 = 1256675466;

        Buffer.buffer memory result609 = Leb128.encodeUnsignedLeb128FromUInt64(value609);

        require(keccak256(result609.buf) == keccak256(expected609), "'1256675466' is not returning '8ab19dd704'");

        bytes memory expected610 = hex"95bad7b704";
        uint64 value610 = 1190518037;

        Buffer.buffer memory result610 = Leb128.encodeUnsignedLeb128FromUInt64(value610);

        require(keccak256(result610.buf) == keccak256(expected610), "'1190518037' is not returning '95bad7b704'");

        bytes memory expected611 = hex"cac383b30a";
        uint64 value611 = 2791367114;

        Buffer.buffer memory result611 = Leb128.encodeUnsignedLeb128FromUInt64(value611);

        require(keccak256(result611.buf) == keccak256(expected611), "'2791367114' is not returning 'cac383b30a'");

        bytes memory expected612 = hex"ce8de5870e";
        uint64 value612 = 3774432974;

        Buffer.buffer memory result612 = Leb128.encodeUnsignedLeb128FromUInt64(value612);

        require(keccak256(result612.buf) == keccak256(expected612), "'3774432974' is not returning 'ce8de5870e'");

        bytes memory expected613 = hex"838385dc0c";
        uint64 value613 = 3414245763;

        Buffer.buffer memory result613 = Leb128.encodeUnsignedLeb128FromUInt64(value613);

        require(keccak256(result613.buf) == keccak256(expected613), "'3414245763' is not returning '838385dc0c'");

        bytes memory expected614 = hex"b8a2c3f905";
        uint64 value614 = 1597034808;

        Buffer.buffer memory result614 = Leb128.encodeUnsignedLeb128FromUInt64(value614);

        require(keccak256(result614.buf) == keccak256(expected614), "'1597034808' is not returning 'b8a2c3f905'");

        bytes memory expected615 = hex"8aaa8cf70e";
        uint64 value615 = 4007859466;

        Buffer.buffer memory result615 = Leb128.encodeUnsignedLeb128FromUInt64(value615);

        require(keccak256(result615.buf) == keccak256(expected615), "'4007859466' is not returning '8aaa8cf70e'");

        bytes memory expected616 = hex"fe8f8acf09";
        uint64 value616 = 2581759998;

        Buffer.buffer memory result616 = Leb128.encodeUnsignedLeb128FromUInt64(value616);

        require(keccak256(result616.buf) == keccak256(expected616), "'2581759998' is not returning 'fe8f8acf09'");

        bytes memory expected617 = hex"86c4adf90b";
        uint64 value617 = 3207291398;

        Buffer.buffer memory result617 = Leb128.encodeUnsignedLeb128FromUInt64(value617);

        require(keccak256(result617.buf) == keccak256(expected617), "'3207291398' is not returning '86c4adf90b'");

        bytes memory expected618 = hex"f3a5cdeb09";
        uint64 value618 = 2641580787;

        Buffer.buffer memory result618 = Leb128.encodeUnsignedLeb128FromUInt64(value618);

        require(keccak256(result618.buf) == keccak256(expected618), "'2641580787' is not returning 'f3a5cdeb09'");

        bytes memory expected619 = hex"bcb7abd40f";
        uint64 value619 = 4203404220;

        Buffer.buffer memory result619 = Leb128.encodeUnsignedLeb128FromUInt64(value619);

        require(keccak256(result619.buf) == keccak256(expected619), "'4203404220' is not returning 'bcb7abd40f'");

        bytes memory expected620 = hex"9e87a5a10e";
        uint64 value620 = 3827909534;

        Buffer.buffer memory result620 = Leb128.encodeUnsignedLeb128FromUInt64(value620);

        require(keccak256(result620.buf) == keccak256(expected620), "'3827909534' is not returning '9e87a5a10e'");

        bytes memory expected621 = hex"8bdbdbd50c";
        uint64 value621 = 3400985995;

        Buffer.buffer memory result621 = Leb128.encodeUnsignedLeb128FromUInt64(value621);

        require(keccak256(result621.buf) == keccak256(expected621), "'3400985995' is not returning '8bdbdbd50c'");

        bytes memory expected622 = hex"a78cabc809";
        uint64 value622 = 2567620135;

        Buffer.buffer memory result622 = Leb128.encodeUnsignedLeb128FromUInt64(value622);

        require(keccak256(result622.buf) == keccak256(expected622), "'2567620135' is not returning 'a78cabc809'");

        bytes memory expected623 = hex"a392ffcc08";
        uint64 value623 = 2308950307;

        Buffer.buffer memory result623 = Leb128.encodeUnsignedLeb128FromUInt64(value623);

        require(keccak256(result623.buf) == keccak256(expected623), "'2308950307' is not returning 'a392ffcc08'");

        bytes memory expected624 = hex"ffacfbf204";
        uint64 value624 = 1314838143;

        Buffer.buffer memory result624 = Leb128.encodeUnsignedLeb128FromUInt64(value624);

        require(keccak256(result624.buf) == keccak256(expected624), "'1314838143' is not returning 'ffacfbf204'");

        bytes memory expected625 = hex"a5b3fe8e08";
        uint64 value625 = 2178914725;

        Buffer.buffer memory result625 = Leb128.encodeUnsignedLeb128FromUInt64(value625);

        require(keccak256(result625.buf) == keccak256(expected625), "'2178914725' is not returning 'a5b3fe8e08'");

        bytes memory expected626 = hex"b3d5bbba06";
        uint64 value626 = 1733225139;

        Buffer.buffer memory result626 = Leb128.encodeUnsignedLeb128FromUInt64(value626);

        require(keccak256(result626.buf) == keccak256(expected626), "'1733225139' is not returning 'b3d5bbba06'");

        bytes memory expected627 = hex"d08be3e405";
        uint64 value627 = 1553515984;

        Buffer.buffer memory result627 = Leb128.encodeUnsignedLeb128FromUInt64(value627);

        require(keccak256(result627.buf) == keccak256(expected627), "'1553515984' is not returning 'd08be3e405'");

        bytes memory expected628 = hex"9ae2b2fb07";
        uint64 value628 = 2137829658;

        Buffer.buffer memory result628 = Leb128.encodeUnsignedLeb128FromUInt64(value628);

        require(keccak256(result628.buf) == keccak256(expected628), "'2137829658' is not returning '9ae2b2fb07'");

    }
}
