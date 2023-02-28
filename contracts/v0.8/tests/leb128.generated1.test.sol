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
import "@ensdomains/buffer/contracts/Buffer.sol";

/// @notice This file is meant to serve as a deployable contract of the Leb128 lib, as the library by itself is not.
/// @notice It imports the library and create a callable method for each method in the library
/// @author Zondax AG
contract Leb128Generated1Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {
        bytes memory expected0 = hex"d901";
        uint64 value0 = 217;

        Buffer.buffer memory result0 = Leb128.encodeUnsignedLeb128FromUInt64(value0);

        require(keccak256(result0.buf) == keccak256(expected0), "'217' is not returning 'd901'");

        bytes memory expected1 = hex"22";
        uint64 value1 = 34;

        Buffer.buffer memory result1 = Leb128.encodeUnsignedLeb128FromUInt64(value1);

        require(keccak256(result1.buf) == keccak256(expected1), "'34' is not returning '22'");

        bytes memory expected2 = hex"e901";
        uint64 value2 = 233;

        Buffer.buffer memory result2 = Leb128.encodeUnsignedLeb128FromUInt64(value2);

        require(keccak256(result2.buf) == keccak256(expected2), "'233' is not returning 'e901'");

        bytes memory expected3 = hex"33";
        uint64 value3 = 51;

        Buffer.buffer memory result3 = Leb128.encodeUnsignedLeb128FromUInt64(value3);

        require(keccak256(result3.buf) == keccak256(expected3), "'51' is not returning '33'");

        bytes memory expected4 = hex"45";
        uint64 value4 = 69;

        Buffer.buffer memory result4 = Leb128.encodeUnsignedLeb128FromUInt64(value4);

        require(keccak256(result4.buf) == keccak256(expected4), "'69' is not returning '45'");

        bytes memory expected5 = hex"e901";
        uint64 value5 = 233;

        Buffer.buffer memory result5 = Leb128.encodeUnsignedLeb128FromUInt64(value5);

        require(keccak256(result5.buf) == keccak256(expected5), "'233' is not returning 'e901'");

        bytes memory expected6 = hex"9601";
        uint64 value6 = 150;

        Buffer.buffer memory result6 = Leb128.encodeUnsignedLeb128FromUInt64(value6);

        require(keccak256(result6.buf) == keccak256(expected6), "'150' is not returning '9601'");

        bytes memory expected7 = hex"9501";
        uint64 value7 = 149;

        Buffer.buffer memory result7 = Leb128.encodeUnsignedLeb128FromUInt64(value7);

        require(keccak256(result7.buf) == keccak256(expected7), "'149' is not returning '9501'");

        bytes memory expected8 = hex"3b";
        uint64 value8 = 59;

        Buffer.buffer memory result8 = Leb128.encodeUnsignedLeb128FromUInt64(value8);

        require(keccak256(result8.buf) == keccak256(expected8), "'59' is not returning '3b'");

        bytes memory expected9 = hex"cf01";
        uint64 value9 = 207;

        Buffer.buffer memory result9 = Leb128.encodeUnsignedLeb128FromUInt64(value9);

        require(keccak256(result9.buf) == keccak256(expected9), "'207' is not returning 'cf01'");

        bytes memory expected10 = hex"bd01";
        uint64 value10 = 189;

        Buffer.buffer memory result10 = Leb128.encodeUnsignedLeb128FromUInt64(value10);

        require(keccak256(result10.buf) == keccak256(expected10), "'189' is not returning 'bd01'");

        bytes memory expected11 = hex"7c";
        uint64 value11 = 124;

        Buffer.buffer memory result11 = Leb128.encodeUnsignedLeb128FromUInt64(value11);

        require(keccak256(result11.buf) == keccak256(expected11), "'124' is not returning '7c'");

        bytes memory expected12 = hex"0d";
        uint64 value12 = 13;

        Buffer.buffer memory result12 = Leb128.encodeUnsignedLeb128FromUInt64(value12);

        require(keccak256(result12.buf) == keccak256(expected12), "'13' is not returning '0d'");

        bytes memory expected13 = hex"9601";
        uint64 value13 = 150;

        Buffer.buffer memory result13 = Leb128.encodeUnsignedLeb128FromUInt64(value13);

        require(keccak256(result13.buf) == keccak256(expected13), "'150' is not returning '9601'");

        bytes memory expected14 = hex"0e";
        uint64 value14 = 14;

        Buffer.buffer memory result14 = Leb128.encodeUnsignedLeb128FromUInt64(value14);

        require(keccak256(result14.buf) == keccak256(expected14), "'14' is not returning '0e'");

        bytes memory expected15 = hex"13";
        uint64 value15 = 19;

        Buffer.buffer memory result15 = Leb128.encodeUnsignedLeb128FromUInt64(value15);

        require(keccak256(result15.buf) == keccak256(expected15), "'19' is not returning '13'");

        bytes memory expected16 = hex"50";
        uint64 value16 = 80;

        Buffer.buffer memory result16 = Leb128.encodeUnsignedLeb128FromUInt64(value16);

        require(keccak256(result16.buf) == keccak256(expected16), "'80' is not returning '50'");

        bytes memory expected17 = hex"ac01";
        uint64 value17 = 172;

        Buffer.buffer memory result17 = Leb128.encodeUnsignedLeb128FromUInt64(value17);

        require(keccak256(result17.buf) == keccak256(expected17), "'172' is not returning 'ac01'");

        bytes memory expected18 = hex"fc01";
        uint64 value18 = 252;

        Buffer.buffer memory result18 = Leb128.encodeUnsignedLeb128FromUInt64(value18);

        require(keccak256(result18.buf) == keccak256(expected18), "'252' is not returning 'fc01'");

        bytes memory expected19 = hex"59";
        uint64 value19 = 89;

        Buffer.buffer memory result19 = Leb128.encodeUnsignedLeb128FromUInt64(value19);

        require(keccak256(result19.buf) == keccak256(expected19), "'89' is not returning '59'");

        bytes memory expected20 = hex"1c";
        uint64 value20 = 28;

        Buffer.buffer memory result20 = Leb128.encodeUnsignedLeb128FromUInt64(value20);

        require(keccak256(result20.buf) == keccak256(expected20), "'28' is not returning '1c'");

        bytes memory expected21 = hex"37";
        uint64 value21 = 55;

        Buffer.buffer memory result21 = Leb128.encodeUnsignedLeb128FromUInt64(value21);

        require(keccak256(result21.buf) == keccak256(expected21), "'55' is not returning '37'");

        bytes memory expected22 = hex"3b";
        uint64 value22 = 59;

        Buffer.buffer memory result22 = Leb128.encodeUnsignedLeb128FromUInt64(value22);

        require(keccak256(result22.buf) == keccak256(expected22), "'59' is not returning '3b'");

        bytes memory expected23 = hex"d001";
        uint64 value23 = 208;

        Buffer.buffer memory result23 = Leb128.encodeUnsignedLeb128FromUInt64(value23);

        require(keccak256(result23.buf) == keccak256(expected23), "'208' is not returning 'd001'");

        bytes memory expected24 = hex"72";
        uint64 value24 = 114;

        Buffer.buffer memory result24 = Leb128.encodeUnsignedLeb128FromUInt64(value24);

        require(keccak256(result24.buf) == keccak256(expected24), "'114' is not returning '72'");

        bytes memory expected25 = hex"e601";
        uint64 value25 = 230;

        Buffer.buffer memory result25 = Leb128.encodeUnsignedLeb128FromUInt64(value25);

        require(keccak256(result25.buf) == keccak256(expected25), "'230' is not returning 'e601'");

        bytes memory expected26 = hex"e101";
        uint64 value26 = 225;

        Buffer.buffer memory result26 = Leb128.encodeUnsignedLeb128FromUInt64(value26);

        require(keccak256(result26.buf) == keccak256(expected26), "'225' is not returning 'e101'");

        bytes memory expected27 = hex"e401";
        uint64 value27 = 228;

        Buffer.buffer memory result27 = Leb128.encodeUnsignedLeb128FromUInt64(value27);

        require(keccak256(result27.buf) == keccak256(expected27), "'228' is not returning 'e401'");

        bytes memory expected28 = hex"9e01";
        uint64 value28 = 158;

        Buffer.buffer memory result28 = Leb128.encodeUnsignedLeb128FromUInt64(value28);

        require(keccak256(result28.buf) == keccak256(expected28), "'158' is not returning '9e01'");

        bytes memory expected29 = hex"1d";
        uint64 value29 = 29;

        Buffer.buffer memory result29 = Leb128.encodeUnsignedLeb128FromUInt64(value29);

        require(keccak256(result29.buf) == keccak256(expected29), "'29' is not returning '1d'");

        bytes memory expected30 = hex"e801";
        uint64 value30 = 232;

        Buffer.buffer memory result30 = Leb128.encodeUnsignedLeb128FromUInt64(value30);

        require(keccak256(result30.buf) == keccak256(expected30), "'232' is not returning 'e801'");

        bytes memory expected31 = hex"a901";
        uint64 value31 = 169;

        Buffer.buffer memory result31 = Leb128.encodeUnsignedLeb128FromUInt64(value31);

        require(keccak256(result31.buf) == keccak256(expected31), "'169' is not returning 'a901'");

        bytes memory expected32 = hex"c301";
        uint64 value32 = 195;

        Buffer.buffer memory result32 = Leb128.encodeUnsignedLeb128FromUInt64(value32);

        require(keccak256(result32.buf) == keccak256(expected32), "'195' is not returning 'c301'");

        bytes memory expected33 = hex"0d";
        uint64 value33 = 13;

        Buffer.buffer memory result33 = Leb128.encodeUnsignedLeb128FromUInt64(value33);

        require(keccak256(result33.buf) == keccak256(expected33), "'13' is not returning '0d'");

        bytes memory expected34 = hex"b001";
        uint64 value34 = 176;

        Buffer.buffer memory result34 = Leb128.encodeUnsignedLeb128FromUInt64(value34);

        require(keccak256(result34.buf) == keccak256(expected34), "'176' is not returning 'b001'");

        bytes memory expected35 = hex"d001";
        uint64 value35 = 208;

        Buffer.buffer memory result35 = Leb128.encodeUnsignedLeb128FromUInt64(value35);

        require(keccak256(result35.buf) == keccak256(expected35), "'208' is not returning 'd001'");

        bytes memory expected36 = hex"2f";
        uint64 value36 = 47;

        Buffer.buffer memory result36 = Leb128.encodeUnsignedLeb128FromUInt64(value36);

        require(keccak256(result36.buf) == keccak256(expected36), "'47' is not returning '2f'");

        bytes memory expected37 = hex"69";
        uint64 value37 = 105;

        Buffer.buffer memory result37 = Leb128.encodeUnsignedLeb128FromUInt64(value37);

        require(keccak256(result37.buf) == keccak256(expected37), "'105' is not returning '69'");

        bytes memory expected38 = hex"aa01";
        uint64 value38 = 170;

        Buffer.buffer memory result38 = Leb128.encodeUnsignedLeb128FromUInt64(value38);

        require(keccak256(result38.buf) == keccak256(expected38), "'170' is not returning 'aa01'");

        bytes memory expected39 = hex"0e";
        uint64 value39 = 14;

        Buffer.buffer memory result39 = Leb128.encodeUnsignedLeb128FromUInt64(value39);

        require(keccak256(result39.buf) == keccak256(expected39), "'14' is not returning '0e'");

        bytes memory expected40 = hex"b401";
        uint64 value40 = 180;

        Buffer.buffer memory result40 = Leb128.encodeUnsignedLeb128FromUInt64(value40);

        require(keccak256(result40.buf) == keccak256(expected40), "'180' is not returning 'b401'");

        bytes memory expected41 = hex"42";
        uint64 value41 = 66;

        Buffer.buffer memory result41 = Leb128.encodeUnsignedLeb128FromUInt64(value41);

        require(keccak256(result41.buf) == keccak256(expected41), "'66' is not returning '42'");

        bytes memory expected42 = hex"70";
        uint64 value42 = 112;

        Buffer.buffer memory result42 = Leb128.encodeUnsignedLeb128FromUInt64(value42);

        require(keccak256(result42.buf) == keccak256(expected42), "'112' is not returning '70'");

        bytes memory expected43 = hex"ac01";
        uint64 value43 = 172;

        Buffer.buffer memory result43 = Leb128.encodeUnsignedLeb128FromUInt64(value43);

        require(keccak256(result43.buf) == keccak256(expected43), "'172' is not returning 'ac01'");

        bytes memory expected44 = hex"9101";
        uint64 value44 = 145;

        Buffer.buffer memory result44 = Leb128.encodeUnsignedLeb128FromUInt64(value44);

        require(keccak256(result44.buf) == keccak256(expected44), "'145' is not returning '9101'");

        bytes memory expected45 = hex"72";
        uint64 value45 = 114;

        Buffer.buffer memory result45 = Leb128.encodeUnsignedLeb128FromUInt64(value45);

        require(keccak256(result45.buf) == keccak256(expected45), "'114' is not returning '72'");

        bytes memory expected46 = hex"8d01";
        uint64 value46 = 141;

        Buffer.buffer memory result46 = Leb128.encodeUnsignedLeb128FromUInt64(value46);

        require(keccak256(result46.buf) == keccak256(expected46), "'141' is not returning '8d01'");

        bytes memory expected47 = hex"fe01";
        uint64 value47 = 254;

        Buffer.buffer memory result47 = Leb128.encodeUnsignedLeb128FromUInt64(value47);

        require(keccak256(result47.buf) == keccak256(expected47), "'254' is not returning 'fe01'");

        bytes memory expected48 = hex"b801";
        uint64 value48 = 184;

        Buffer.buffer memory result48 = Leb128.encodeUnsignedLeb128FromUInt64(value48);

        require(keccak256(result48.buf) == keccak256(expected48), "'184' is not returning 'b801'");

        bytes memory expected49 = hex"1c";
        uint64 value49 = 28;

        Buffer.buffer memory result49 = Leb128.encodeUnsignedLeb128FromUInt64(value49);

        require(keccak256(result49.buf) == keccak256(expected49), "'28' is not returning '1c'");

        bytes memory expected50 = hex"d901";
        uint64 value50 = 217;

        Buffer.buffer memory result50 = Leb128.encodeUnsignedLeb128FromUInt64(value50);

        require(keccak256(result50.buf) == keccak256(expected50), "'217' is not returning 'd901'");

        bytes memory expected51 = hex"4a";
        uint64 value51 = 74;

        Buffer.buffer memory result51 = Leb128.encodeUnsignedLeb128FromUInt64(value51);

        require(keccak256(result51.buf) == keccak256(expected51), "'74' is not returning '4a'");

        bytes memory expected52 = hex"6d";
        uint64 value52 = 109;

        Buffer.buffer memory result52 = Leb128.encodeUnsignedLeb128FromUInt64(value52);

        require(keccak256(result52.buf) == keccak256(expected52), "'109' is not returning '6d'");

        bytes memory expected53 = hex"7b";
        uint64 value53 = 123;

        Buffer.buffer memory result53 = Leb128.encodeUnsignedLeb128FromUInt64(value53);

        require(keccak256(result53.buf) == keccak256(expected53), "'123' is not returning '7b'");

        bytes memory expected54 = hex"0b";
        uint64 value54 = 11;

        Buffer.buffer memory result54 = Leb128.encodeUnsignedLeb128FromUInt64(value54);

        require(keccak256(result54.buf) == keccak256(expected54), "'11' is not returning '0b'");

        bytes memory expected55 = hex"22";
        uint64 value55 = 34;

        Buffer.buffer memory result55 = Leb128.encodeUnsignedLeb128FromUInt64(value55);

        require(keccak256(result55.buf) == keccak256(expected55), "'34' is not returning '22'");

        bytes memory expected56 = hex"55";
        uint64 value56 = 85;

        Buffer.buffer memory result56 = Leb128.encodeUnsignedLeb128FromUInt64(value56);

        require(keccak256(result56.buf) == keccak256(expected56), "'85' is not returning '55'");

        bytes memory expected57 = hex"8601";
        uint64 value57 = 134;

        Buffer.buffer memory result57 = Leb128.encodeUnsignedLeb128FromUInt64(value57);

        require(keccak256(result57.buf) == keccak256(expected57), "'134' is not returning '8601'");

        bytes memory expected58 = hex"c801";
        uint64 value58 = 200;

        Buffer.buffer memory result58 = Leb128.encodeUnsignedLeb128FromUInt64(value58);

        require(keccak256(result58.buf) == keccak256(expected58), "'200' is not returning 'c801'");

        bytes memory expected59 = hex"9c01";
        uint64 value59 = 156;

        Buffer.buffer memory result59 = Leb128.encodeUnsignedLeb128FromUInt64(value59);

        require(keccak256(result59.buf) == keccak256(expected59), "'156' is not returning '9c01'");

        bytes memory expected60 = hex"04";
        uint64 value60 = 4;

        Buffer.buffer memory result60 = Leb128.encodeUnsignedLeb128FromUInt64(value60);

        require(keccak256(result60.buf) == keccak256(expected60), "'4' is not returning '04'");

        bytes memory expected61 = hex"5b";
        uint64 value61 = 91;

        Buffer.buffer memory result61 = Leb128.encodeUnsignedLeb128FromUInt64(value61);

        require(keccak256(result61.buf) == keccak256(expected61), "'91' is not returning '5b'");

        bytes memory expected62 = hex"72";
        uint64 value62 = 114;

        Buffer.buffer memory result62 = Leb128.encodeUnsignedLeb128FromUInt64(value62);

        require(keccak256(result62.buf) == keccak256(expected62), "'114' is not returning '72'");

        bytes memory expected63 = hex"2f";
        uint64 value63 = 47;

        Buffer.buffer memory result63 = Leb128.encodeUnsignedLeb128FromUInt64(value63);

        require(keccak256(result63.buf) == keccak256(expected63), "'47' is not returning '2f'");

        bytes memory expected64 = hex"c801";
        uint64 value64 = 200;

        Buffer.buffer memory result64 = Leb128.encodeUnsignedLeb128FromUInt64(value64);

        require(keccak256(result64.buf) == keccak256(expected64), "'200' is not returning 'c801'");

        bytes memory expected65 = hex"4d";
        uint64 value65 = 77;

        Buffer.buffer memory result65 = Leb128.encodeUnsignedLeb128FromUInt64(value65);

        require(keccak256(result65.buf) == keccak256(expected65), "'77' is not returning '4d'");

        bytes memory expected66 = hex"62";
        uint64 value66 = 98;

        Buffer.buffer memory result66 = Leb128.encodeUnsignedLeb128FromUInt64(value66);

        require(keccak256(result66.buf) == keccak256(expected66), "'98' is not returning '62'");

        bytes memory expected67 = hex"07";
        uint64 value67 = 7;

        Buffer.buffer memory result67 = Leb128.encodeUnsignedLeb128FromUInt64(value67);

        require(keccak256(result67.buf) == keccak256(expected67), "'7' is not returning '07'");

        bytes memory expected68 = hex"1a";
        uint64 value68 = 26;

        Buffer.buffer memory result68 = Leb128.encodeUnsignedLeb128FromUInt64(value68);

        require(keccak256(result68.buf) == keccak256(expected68), "'26' is not returning '1a'");
    }
}
