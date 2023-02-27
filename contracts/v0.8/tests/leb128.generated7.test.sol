
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
contract Leb128Generated7Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {

        bytes memory expected516 = hex"cd8998e502";
        uint64 value516 = 749077709;

        Buffer.buffer memory result516 = Leb128.encodeUnsignedLeb128FromUInt64(value516);

        require(keccak256(result516.buf) == keccak256(expected516), "'749077709' is not returning 'cd8998e502'");    

        bytes memory expected517 = hex"fd85818403";
        uint64 value517 = 813712125;

        Buffer.buffer memory result517 = Leb128.encodeUnsignedLeb128FromUInt64(value517);

        require(keccak256(result517.buf) == keccak256(expected517), "'813712125' is not returning 'fd85818403'");    

        bytes memory expected518 = hex"b7a099970a";
        uint64 value518 = 2733002807;

        Buffer.buffer memory result518 = Leb128.encodeUnsignedLeb128FromUInt64(value518);

        require(keccak256(result518.buf) == keccak256(expected518), "'2733002807' is not returning 'b7a099970a'");    

        bytes memory expected519 = hex"e4e6eac608";
        uint64 value519 = 2296034148;

        Buffer.buffer memory result519 = Leb128.encodeUnsignedLeb128FromUInt64(value519);

        require(keccak256(result519.buf) == keccak256(expected519), "'2296034148' is not returning 'e4e6eac608'");    

        bytes memory expected520 = hex"c2ffd1cd0f";
        uint64 value520 = 4189355970;

        Buffer.buffer memory result520 = Leb128.encodeUnsignedLeb128FromUInt64(value520);

        require(keccak256(result520.buf) == keccak256(expected520), "'4189355970' is not returning 'c2ffd1cd0f'");    

        bytes memory expected521 = hex"80bbb09b08";
        uint64 value521 = 2204900736;

        Buffer.buffer memory result521 = Leb128.encodeUnsignedLeb128FromUInt64(value521);

        require(keccak256(result521.buf) == keccak256(expected521), "'2204900736' is not returning '80bbb09b08'");    

        bytes memory expected522 = hex"eaffeff201";
        uint64 value522 = 509345770;

        Buffer.buffer memory result522 = Leb128.encodeUnsignedLeb128FromUInt64(value522);

        require(keccak256(result522.buf) == keccak256(expected522), "'509345770' is not returning 'eaffeff201'");    

        bytes memory expected523 = hex"eba7a0bc0e";
        uint64 value523 = 3884454891;

        Buffer.buffer memory result523 = Leb128.encodeUnsignedLeb128FromUInt64(value523);

        require(keccak256(result523.buf) == keccak256(expected523), "'3884454891' is not returning 'eba7a0bc0e'");    

        bytes memory expected524 = hex"89cb80970d";
        uint64 value524 = 3537905033;

        Buffer.buffer memory result524 = Leb128.encodeUnsignedLeb128FromUInt64(value524);

        require(keccak256(result524.buf) == keccak256(expected524), "'3537905033' is not returning '89cb80970d'");    

        bytes memory expected525 = hex"cecbf8c90a";
        uint64 value525 = 2839422414;

        Buffer.buffer memory result525 = Leb128.encodeUnsignedLeb128FromUInt64(value525);

        require(keccak256(result525.buf) == keccak256(expected525), "'2839422414' is not returning 'cecbf8c90a'");    

        bytes memory expected526 = hex"f6eaed8509";
        uint64 value526 = 2428204406;

        Buffer.buffer memory result526 = Leb128.encodeUnsignedLeb128FromUInt64(value526);

        require(keccak256(result526.buf) == keccak256(expected526), "'2428204406' is not returning 'f6eaed8509'");    

        bytes memory expected527 = hex"bd99f3f10d";
        uint64 value527 = 3728526525;

        Buffer.buffer memory result527 = Leb128.encodeUnsignedLeb128FromUInt64(value527);

        require(keccak256(result527.buf) == keccak256(expected527), "'3728526525' is not returning 'bd99f3f10d'");    

        bytes memory expected528 = hex"82b894ae0b";
        uint64 value528 = 3049593858;

        Buffer.buffer memory result528 = Leb128.encodeUnsignedLeb128FromUInt64(value528);

        require(keccak256(result528.buf) == keccak256(expected528), "'3049593858' is not returning '82b894ae0b'");    

        bytes memory expected529 = hex"e9b981b705";
        uint64 value529 = 1457544425;

        Buffer.buffer memory result529 = Leb128.encodeUnsignedLeb128FromUInt64(value529);

        require(keccak256(result529.buf) == keccak256(expected529), "'1457544425' is not returning 'e9b981b705'");    

        bytes memory expected530 = hex"8587c9bc05";
        uint64 value530 = 1469203333;

        Buffer.buffer memory result530 = Leb128.encodeUnsignedLeb128FromUInt64(value530);

        require(keccak256(result530.buf) == keccak256(expected530), "'1469203333' is not returning '8587c9bc05'");    

        bytes memory expected531 = hex"98f2e9870e";
        uint64 value531 = 3774511384;

        Buffer.buffer memory result531 = Leb128.encodeUnsignedLeb128FromUInt64(value531);

        require(keccak256(result531.buf) == keccak256(expected531), "'3774511384' is not returning '98f2e9870e'");    

        bytes memory expected532 = hex"b1d291b10a";
        uint64 value532 = 2787404081;

        Buffer.buffer memory result532 = Leb128.encodeUnsignedLeb128FromUInt64(value532);

        require(keccak256(result532.buf) == keccak256(expected532), "'2787404081' is not returning 'b1d291b10a'");    

        bytes memory expected533 = hex"e2fabdf10e";
        uint64 value533 = 3996089698;

        Buffer.buffer memory result533 = Leb128.encodeUnsignedLeb128FromUInt64(value533);

        require(keccak256(result533.buf) == keccak256(expected533), "'3996089698' is not returning 'e2fabdf10e'");    

        bytes memory expected534 = hex"be8ef0ef08";
        uint64 value534 = 2382104382;

        Buffer.buffer memory result534 = Leb128.encodeUnsignedLeb128FromUInt64(value534);

        require(keccak256(result534.buf) == keccak256(expected534), "'2382104382' is not returning 'be8ef0ef08'");    

        bytes memory expected535 = hex"d4cf87f80a";
        uint64 value535 = 2936137684;

        Buffer.buffer memory result535 = Leb128.encodeUnsignedLeb128FromUInt64(value535);

        require(keccak256(result535.buf) == keccak256(expected535), "'2936137684' is not returning 'd4cf87f80a'");    

        bytes memory expected536 = hex"9ad4958a0e";
        uint64 value536 = 3779422746;

        Buffer.buffer memory result536 = Leb128.encodeUnsignedLeb128FromUInt64(value536);

        require(keccak256(result536.buf) == keccak256(expected536), "'3779422746' is not returning '9ad4958a0e'");    

        bytes memory expected537 = hex"8ce9bce80f";
        uint64 value537 = 4245632140;

        Buffer.buffer memory result537 = Leb128.encodeUnsignedLeb128FromUInt64(value537);

        require(keccak256(result537.buf) == keccak256(expected537), "'4245632140' is not returning '8ce9bce80f'");    

        bytes memory expected538 = hex"858f938c08";
        uint64 value538 = 2172962693;

        Buffer.buffer memory result538 = Leb128.encodeUnsignedLeb128FromUInt64(value538);

        require(keccak256(result538.buf) == keccak256(expected538), "'2172962693' is not returning '858f938c08'");    

        bytes memory expected539 = hex"e18dc7fa05";
        uint64 value539 = 1599194849;

        Buffer.buffer memory result539 = Leb128.encodeUnsignedLeb128FromUInt64(value539);

        require(keccak256(result539.buf) == keccak256(expected539), "'1599194849' is not returning 'e18dc7fa05'");    

        bytes memory expected540 = hex"8abbf7d602";
        uint64 value540 = 719183242;

        Buffer.buffer memory result540 = Leb128.encodeUnsignedLeb128FromUInt64(value540);

        require(keccak256(result540.buf) == keccak256(expected540), "'719183242' is not returning '8abbf7d602'");    

        bytes memory expected541 = hex"d5dae6ad02";
        uint64 value541 = 632925525;

        Buffer.buffer memory result541 = Leb128.encodeUnsignedLeb128FromUInt64(value541);

        require(keccak256(result541.buf) == keccak256(expected541), "'632925525' is not returning 'd5dae6ad02'");    

        bytes memory expected542 = hex"b4d3859b0f";
        uint64 value542 = 4083247540;

        Buffer.buffer memory result542 = Leb128.encodeUnsignedLeb128FromUInt64(value542);

        require(keccak256(result542.buf) == keccak256(expected542), "'4083247540' is not returning 'b4d3859b0f'");    

        bytes memory expected543 = hex"e78188ee01";
        uint64 value543 = 499253479;

        Buffer.buffer memory result543 = Leb128.encodeUnsignedLeb128FromUInt64(value543);

        require(keccak256(result543.buf) == keccak256(expected543), "'499253479' is not returning 'e78188ee01'");    

        bytes memory expected544 = hex"d398c49b0b";
        uint64 value544 = 3010530387;

        Buffer.buffer memory result544 = Leb128.encodeUnsignedLeb128FromUInt64(value544);

        require(keccak256(result544.buf) == keccak256(expected544), "'3010530387' is not returning 'd398c49b0b'");    

        bytes memory expected545 = hex"9ffec1d102";
        uint64 value545 = 707821343;

        Buffer.buffer memory result545 = Leb128.encodeUnsignedLeb128FromUInt64(value545);

        require(keccak256(result545.buf) == keccak256(expected545), "'707821343' is not returning '9ffec1d102'");    

        bytes memory expected546 = hex"9189b5a103";
        uint64 value546 = 875381905;

        Buffer.buffer memory result546 = Leb128.encodeUnsignedLeb128FromUInt64(value546);

        require(keccak256(result546.buf) == keccak256(expected546), "'875381905' is not returning '9189b5a103'");    

        bytes memory expected547 = hex"d6d79ddc0f";
        uint64 value547 = 4219956182;

        Buffer.buffer memory result547 = Leb128.encodeUnsignedLeb128FromUInt64(value547);

        require(keccak256(result547.buf) == keccak256(expected547), "'4219956182' is not returning 'd6d79ddc0f'");    

        bytes memory expected548 = hex"ccc198e305";
        uint64 value548 = 1550196940;

        Buffer.buffer memory result548 = Leb128.encodeUnsignedLeb128FromUInt64(value548);

        require(keccak256(result548.buf) == keccak256(expected548), "'1550196940' is not returning 'ccc198e305'");    

        bytes memory expected549 = hex"d1a5978c03";
        uint64 value549 = 830853841;

        Buffer.buffer memory result549 = Leb128.encodeUnsignedLeb128FromUInt64(value549);

        require(keccak256(result549.buf) == keccak256(expected549), "'830853841' is not returning 'd1a5978c03'");    

        bytes memory expected550 = hex"b0a4d6a206";
        uint64 value550 = 1683329584;

        Buffer.buffer memory result550 = Leb128.encodeUnsignedLeb128FromUInt64(value550);

        require(keccak256(result550.buf) == keccak256(expected550), "'1683329584' is not returning 'b0a4d6a206'");    

        bytes memory expected551 = hex"9feedbd209";
        uint64 value551 = 2589390623;

        Buffer.buffer memory result551 = Leb128.encodeUnsignedLeb128FromUInt64(value551);

        require(keccak256(result551.buf) == keccak256(expected551), "'2589390623' is not returning '9feedbd209'");    

        bytes memory expected552 = hex"e5fcd0b601";
        uint64 value552 = 383008357;

        Buffer.buffer memory result552 = Leb128.encodeUnsignedLeb128FromUInt64(value552);

        require(keccak256(result552.buf) == keccak256(expected552), "'383008357' is not returning 'e5fcd0b601'");    

        bytes memory expected553 = hex"8ee0f59708";
        uint64 value553 = 2197647374;

        Buffer.buffer memory result553 = Leb128.encodeUnsignedLeb128FromUInt64(value553);

        require(keccak256(result553.buf) == keccak256(expected553), "'2197647374' is not returning '8ee0f59708'");    

        bytes memory expected554 = hex"9afda1990b";
        uint64 value554 = 3005775514;

        Buffer.buffer memory result554 = Leb128.encodeUnsignedLeb128FromUInt64(value554);

        require(keccak256(result554.buf) == keccak256(expected554), "'3005775514' is not returning '9afda1990b'");    

        bytes memory expected555 = hex"eaa6eaf50f";
        uint64 value555 = 4273640298;

        Buffer.buffer memory result555 = Leb128.encodeUnsignedLeb128FromUInt64(value555);

        require(keccak256(result555.buf) == keccak256(expected555), "'4273640298' is not returning 'eaa6eaf50f'");    

        bytes memory expected556 = hex"b6b998dd0b";
        uint64 value556 = 3148225718;

        Buffer.buffer memory result556 = Leb128.encodeUnsignedLeb128FromUInt64(value556);

        require(keccak256(result556.buf) == keccak256(expected556), "'3148225718' is not returning 'b6b998dd0b'");    

        bytes memory expected557 = hex"a892f8bc0c";
        uint64 value557 = 3349023016;

        Buffer.buffer memory result557 = Leb128.encodeUnsignedLeb128FromUInt64(value557);

        require(keccak256(result557.buf) == keccak256(expected557), "'3349023016' is not returning 'a892f8bc0c'");    

        bytes memory expected558 = hex"b584abbc0c";
        uint64 value558 = 3347759669;

        Buffer.buffer memory result558 = Leb128.encodeUnsignedLeb128FromUInt64(value558);

        require(keccak256(result558.buf) == keccak256(expected558), "'3347759669' is not returning 'b584abbc0c'");    

        bytes memory expected559 = hex"8b95c4ef03";
        uint64 value559 = 1039207051;

        Buffer.buffer memory result559 = Leb128.encodeUnsignedLeb128FromUInt64(value559);

        require(keccak256(result559.buf) == keccak256(expected559), "'1039207051' is not returning '8b95c4ef03'");    

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

    }
}
