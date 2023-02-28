
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
contract Leb128Generated8Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {

        bytes memory expected490 = hex"cc8e02";
        uint64 value490 = 34636;

        Buffer.buffer memory result490 = Leb128.encodeUnsignedLeb128FromUInt64(value490);

        require(keccak256(result490.buf) == keccak256(expected490), "'34636' is not returning 'cc8e02'");

        bytes memory expected491 = hex"c28f01";
        uint64 value491 = 18370;

        Buffer.buffer memory result491 = Leb128.encodeUnsignedLeb128FromUInt64(value491);

        require(keccak256(result491.buf) == keccak256(expected491), "'18370' is not returning 'c28f01'");

        bytes memory expected492 = hex"def201";
        uint64 value492 = 31070;

        Buffer.buffer memory result492 = Leb128.encodeUnsignedLeb128FromUInt64(value492);

        require(keccak256(result492.buf) == keccak256(expected492), "'31070' is not returning 'def201'");

        bytes memory expected493 = hex"d58702";
        uint64 value493 = 33749;

        Buffer.buffer memory result493 = Leb128.encodeUnsignedLeb128FromUInt64(value493);

        require(keccak256(result493.buf) == keccak256(expected493), "'33749' is not returning 'd58702'");

        bytes memory expected494 = hex"b9f302";
        uint64 value494 = 47545;

        Buffer.buffer memory result494 = Leb128.encodeUnsignedLeb128FromUInt64(value494);

        require(keccak256(result494.buf) == keccak256(expected494), "'47545' is not returning 'b9f302'");

        bytes memory expected495 = hex"b317";
        uint64 value495 = 2995;

        Buffer.buffer memory result495 = Leb128.encodeUnsignedLeb128FromUInt64(value495);

        require(keccak256(result495.buf) == keccak256(expected495), "'2995' is not returning 'b317'");

        bytes memory expected496 = hex"f49502";
        uint64 value496 = 35572;

        Buffer.buffer memory result496 = Leb128.encodeUnsignedLeb128FromUInt64(value496);

        require(keccak256(result496.buf) == keccak256(expected496), "'35572' is not returning 'f49502'");

        bytes memory expected497 = hex"a2b703";
        uint64 value497 = 56226;

        Buffer.buffer memory result497 = Leb128.encodeUnsignedLeb128FromUInt64(value497);

        require(keccak256(result497.buf) == keccak256(expected497), "'56226' is not returning 'a2b703'");

        bytes memory expected498 = hex"c8a102";
        uint64 value498 = 37064;

        Buffer.buffer memory result498 = Leb128.encodeUnsignedLeb128FromUInt64(value498);

        require(keccak256(result498.buf) == keccak256(expected498), "'37064' is not returning 'c8a102'");

        bytes memory expected499 = hex"f2ff03";
        uint64 value499 = 65522;

        Buffer.buffer memory result499 = Leb128.encodeUnsignedLeb128FromUInt64(value499);

        require(keccak256(result499.buf) == keccak256(expected499), "'65522' is not returning 'f2ff03'");

        bytes memory expected500 = hex"808002";
        uint64 value500 = 32768;

        Buffer.buffer memory result500 = Leb128.encodeUnsignedLeb128FromUInt64(value500);

        require(keccak256(result500.buf) == keccak256(expected500), "'32768' is not returning '808002'");

        bytes memory expected501 = hex"eec301";
        uint64 value501 = 25070;

        Buffer.buffer memory result501 = Leb128.encodeUnsignedLeb128FromUInt64(value501);

        require(keccak256(result501.buf) == keccak256(expected501), "'25070' is not returning 'eec301'");

        bytes memory expected502 = hex"a29d01";
        uint64 value502 = 20130;

        Buffer.buffer memory result502 = Leb128.encodeUnsignedLeb128FromUInt64(value502);

        require(keccak256(result502.buf) == keccak256(expected502), "'20130' is not returning 'a29d01'");

        bytes memory expected503 = hex"96f603";
        uint64 value503 = 64278;

        Buffer.buffer memory result503 = Leb128.encodeUnsignedLeb128FromUInt64(value503);

        require(keccak256(result503.buf) == keccak256(expected503), "'64278' is not returning '96f603'");

        bytes memory expected504 = hex"faa402";
        uint64 value504 = 37498;

        Buffer.buffer memory result504 = Leb128.encodeUnsignedLeb128FromUInt64(value504);

        require(keccak256(result504.buf) == keccak256(expected504), "'37498' is not returning 'faa402'");

        bytes memory expected505 = hex"cebe02";
        uint64 value505 = 40782;

        Buffer.buffer memory result505 = Leb128.encodeUnsignedLeb128FromUInt64(value505);

        require(keccak256(result505.buf) == keccak256(expected505), "'40782' is not returning 'cebe02'");

        bytes memory expected506 = hex"81d203";
        uint64 value506 = 59649;

        Buffer.buffer memory result506 = Leb128.encodeUnsignedLeb128FromUInt64(value506);

        require(keccak256(result506.buf) == keccak256(expected506), "'59649' is not returning '81d203'");

        bytes memory expected507 = hex"e7d503";
        uint64 value507 = 60135;

        Buffer.buffer memory result507 = Leb128.encodeUnsignedLeb128FromUInt64(value507);

        require(keccak256(result507.buf) == keccak256(expected507), "'60135' is not returning 'e7d503'");

        bytes memory expected508 = hex"d224";
        uint64 value508 = 4690;

        Buffer.buffer memory result508 = Leb128.encodeUnsignedLeb128FromUInt64(value508);

        require(keccak256(result508.buf) == keccak256(expected508), "'4690' is not returning 'd224'");

        bytes memory expected509 = hex"a01f";
        uint64 value509 = 4000;

        Buffer.buffer memory result509 = Leb128.encodeUnsignedLeb128FromUInt64(value509);

        require(keccak256(result509.buf) == keccak256(expected509), "'4000' is not returning 'a01f'");

        bytes memory expected510 = hex"d7ab03";
        uint64 value510 = 54743;

        Buffer.buffer memory result510 = Leb128.encodeUnsignedLeb128FromUInt64(value510);

        require(keccak256(result510.buf) == keccak256(expected510), "'54743' is not returning 'd7ab03'");

        bytes memory expected511 = hex"878702";
        uint64 value511 = 33671;

        Buffer.buffer memory result511 = Leb128.encodeUnsignedLeb128FromUInt64(value511);

        require(keccak256(result511.buf) == keccak256(expected511), "'33671' is not returning '878702'");

        bytes memory expected512 = hex"fbb2e5ef05";
        uint64 value512 = 1576622459;

        Buffer.buffer memory result512 = Leb128.encodeUnsignedLeb128FromUInt64(value512);

        require(keccak256(result512.buf) == keccak256(expected512), "'1576622459' is not returning 'fbb2e5ef05'");

        bytes memory expected513 = hex"c8b5d9c108";
        uint64 value513 = 2285263560;

        Buffer.buffer memory result513 = Leb128.encodeUnsignedLeb128FromUInt64(value513);

        require(keccak256(result513.buf) == keccak256(expected513), "'2285263560' is not returning 'c8b5d9c108'");

        bytes memory expected514 = hex"dddccf7d";
        uint64 value514 = 263450205;

        Buffer.buffer memory result514 = Leb128.encodeUnsignedLeb128FromUInt64(value514);

        require(keccak256(result514.buf) == keccak256(expected514), "'263450205' is not returning 'dddccf7d'");

        bytes memory expected515 = hex"8aadd8e709";
        uint64 value515 = 2633373322;

        Buffer.buffer memory result515 = Leb128.encodeUnsignedLeb128FromUInt64(value515);

        require(keccak256(result515.buf) == keccak256(expected515), "'2633373322' is not returning '8aadd8e709'");

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

    }
}
