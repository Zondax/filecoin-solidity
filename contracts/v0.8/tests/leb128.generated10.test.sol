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
// THIS CODE WAS SECURITY REVIEWED BY KUDELSKI SECURITY, BUT NOT FORMALLY AUDITED

// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import "../utils/Leb128.sol";
import "@ensdomains/buffer/contracts/Buffer.sol";

/// @notice This file is meant to serve as a deployable contract of the Leb128 lib, as the library by itself is not.
/// @notice It imports the library and create a callable method for each method in the library
/// @author Zondax AG
contract Leb128Generated10Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {
        bytes memory expected630 = hex"8bdcf5a40f";
        uint64 value630 = 4103958027;

        Buffer.buffer memory result630 = Leb128.encodeUnsignedLeb128FromUInt64(value630);

        require(keccak256(result630.buf) == keccak256(expected630), "'4103958027' is not returning '8bdcf5a40f'");

        bytes memory expected631 = hex"c3a09c9c08";
        uint64 value631 = 2206666819;

        Buffer.buffer memory result631 = Leb128.encodeUnsignedLeb128FromUInt64(value631);

        require(keccak256(result631.buf) == keccak256(expected631), "'2206666819' is not returning 'c3a09c9c08'");

        bytes memory expected632 = hex"dcd1d7b206";
        uint64 value632 = 1716906204;

        Buffer.buffer memory result632 = Leb128.encodeUnsignedLeb128FromUInt64(value632);

        require(keccak256(result632.buf) == keccak256(expected632), "'1716906204' is not returning 'dcd1d7b206'");

        bytes memory expected633 = hex"acdfbfa509";
        uint64 value633 = 2494558124;

        Buffer.buffer memory result633 = Leb128.encodeUnsignedLeb128FromUInt64(value633);

        require(keccak256(result633.buf) == keccak256(expected633), "'2494558124' is not returning 'acdfbfa509'");

        bytes memory expected634 = hex"b09f8fb307";
        uint64 value634 = 1986252720;

        Buffer.buffer memory result634 = Leb128.encodeUnsignedLeb128FromUInt64(value634);

        require(keccak256(result634.buf) == keccak256(expected634), "'1986252720' is not returning 'b09f8fb307'");

        bytes memory expected635 = hex"82afa5ef09";
        uint64 value635 = 2649315202;

        Buffer.buffer memory result635 = Leb128.encodeUnsignedLeb128FromUInt64(value635);

        require(keccak256(result635.buf) == keccak256(expected635), "'2649315202' is not returning '82afa5ef09'");

        bytes memory expected636 = hex"e4bab0ea0b";
        uint64 value636 = 3175882084;

        Buffer.buffer memory result636 = Leb128.encodeUnsignedLeb128FromUInt64(value636);

        require(keccak256(result636.buf) == keccak256(expected636), "'3175882084' is not returning 'e4bab0ea0b'");

        bytes memory expected637 = hex"f4d28afc0d";
        uint64 value637 = 3749882228;

        Buffer.buffer memory result637 = Leb128.encodeUnsignedLeb128FromUInt64(value637);

        require(keccak256(result637.buf) == keccak256(expected637), "'3749882228' is not returning 'f4d28afc0d'");

        bytes memory expected638 = hex"aaa8f9d70d";
        uint64 value638 = 3674100778;

        Buffer.buffer memory result638 = Leb128.encodeUnsignedLeb128FromUInt64(value638);

        require(keccak256(result638.buf) == keccak256(expected638), "'3674100778' is not returning 'aaa8f9d70d'");

        bytes memory expected639 = hex"b6e99bf603";
        uint64 value639 = 1053226166;

        Buffer.buffer memory result639 = Leb128.encodeUnsignedLeb128FromUInt64(value639);

        require(keccak256(result639.buf) == keccak256(expected639), "'1053226166' is not returning 'b6e99bf603'");

        bytes memory expected640 = hex"d9d4b449";
        uint64 value640 = 153954905;

        Buffer.buffer memory result640 = Leb128.encodeUnsignedLeb128FromUInt64(value640);

        require(keccak256(result640.buf) == keccak256(expected640), "'153954905' is not returning 'd9d4b449'");

        bytes memory expected641 = hex"92d78dfc06";
        uint64 value641 = 1870883730;

        Buffer.buffer memory result641 = Leb128.encodeUnsignedLeb128FromUInt64(value641);

        require(keccak256(result641.buf) == keccak256(expected641), "'1870883730' is not returning '92d78dfc06'");

        bytes memory expected642 = hex"d78defaa09";
        uint64 value642 = 2505819863;

        Buffer.buffer memory result642 = Leb128.encodeUnsignedLeb128FromUInt64(value642);

        require(keccak256(result642.buf) == keccak256(expected642), "'2505819863' is not returning 'd78defaa09'");

        bytes memory expected643 = hex"9ff480f908";
        uint64 value643 = 2401253919;

        Buffer.buffer memory result643 = Leb128.encodeUnsignedLeb128FromUInt64(value643);

        require(keccak256(result643.buf) == keccak256(expected643), "'2401253919' is not returning '9ff480f908'");

        bytes memory expected644 = hex"b095b4a201";
        uint64 value644 = 340593328;

        Buffer.buffer memory result644 = Leb128.encodeUnsignedLeb128FromUInt64(value644);

        require(keccak256(result644.buf) == keccak256(expected644), "'340593328' is not returning 'b095b4a201'");

        bytes memory expected645 = hex"cfe7b5ce03";
        uint64 value645 = 969765839;

        Buffer.buffer memory result645 = Leb128.encodeUnsignedLeb128FromUInt64(value645);

        require(keccak256(result645.buf) == keccak256(expected645), "'969765839' is not returning 'cfe7b5ce03'");

        bytes memory expected646 = hex"b09fcab605";
        uint64 value646 = 1456639920;

        Buffer.buffer memory result646 = Leb128.encodeUnsignedLeb128FromUInt64(value646);

        require(keccak256(result646.buf) == keccak256(expected646), "'1456639920' is not returning 'b09fcab605'");

        bytes memory expected647 = hex"e086bd2b";
        uint64 value647 = 91177824;

        Buffer.buffer memory result647 = Leb128.encodeUnsignedLeb128FromUInt64(value647);

        require(keccak256(result647.buf) == keccak256(expected647), "'91177824' is not returning 'e086bd2b'");

        bytes memory expected648 = hex"cce3e1820d";
        uint64 value648 = 3495457228;

        Buffer.buffer memory result648 = Leb128.encodeUnsignedLeb128FromUInt64(value648);

        require(keccak256(result648.buf) == keccak256(expected648), "'3495457228' is not returning 'cce3e1820d'");

        bytes memory expected649 = hex"dbe8f9fb0b";
        uint64 value649 = 3212735579;

        Buffer.buffer memory result649 = Leb128.encodeUnsignedLeb128FromUInt64(value649);

        require(keccak256(result649.buf) == keccak256(expected649), "'3212735579' is not returning 'dbe8f9fb0b'");

        bytes memory expected650 = hex"98f7af8301";
        uint64 value650 = 275512216;

        Buffer.buffer memory result650 = Leb128.encodeUnsignedLeb128FromUInt64(value650);

        require(keccak256(result650.buf) == keccak256(expected650), "'275512216' is not returning '98f7af8301'");

        bytes memory expected651 = hex"be81c9c002";
        uint64 value651 = 672284862;

        Buffer.buffer memory result651 = Leb128.encodeUnsignedLeb128FromUInt64(value651);

        require(keccak256(result651.buf) == keccak256(expected651), "'672284862' is not returning 'be81c9c002'");

        bytes memory expected652 = hex"98bed6ca03";
        uint64 value652 = 961912600;

        Buffer.buffer memory result652 = Leb128.encodeUnsignedLeb128FromUInt64(value652);

        require(keccak256(result652.buf) == keccak256(expected652), "'961912600' is not returning '98bed6ca03'");

        bytes memory expected653 = hex"f8b3fbbe0b";
        uint64 value653 = 3084835320;

        Buffer.buffer memory result653 = Leb128.encodeUnsignedLeb128FromUInt64(value653);

        require(keccak256(result653.buf) == keccak256(expected653), "'3084835320' is not returning 'f8b3fbbe0b'");

        bytes memory expected654 = hex"cffcf468";
        uint64 value654 = 220020303;

        Buffer.buffer memory result654 = Leb128.encodeUnsignedLeb128FromUInt64(value654);

        require(keccak256(result654.buf) == keccak256(expected654), "'220020303' is not returning 'cffcf468'");

        bytes memory expected655 = hex"e28caa9009";
        uint64 value655 = 2450163298;

        Buffer.buffer memory result655 = Leb128.encodeUnsignedLeb128FromUInt64(value655);

        require(keccak256(result655.buf) == keccak256(expected655), "'2450163298' is not returning 'e28caa9009'");

        bytes memory expected656 = hex"d38ae28d0f";
        uint64 value656 = 4055401811;

        Buffer.buffer memory result656 = Leb128.encodeUnsignedLeb128FromUInt64(value656);

        require(keccak256(result656.buf) == keccak256(expected656), "'4055401811' is not returning 'd38ae28d0f'");

        bytes memory expected657 = hex"acd4e9aa04";
        uint64 value657 = 1163553324;

        Buffer.buffer memory result657 = Leb128.encodeUnsignedLeb128FromUInt64(value657);

        require(keccak256(result657.buf) == keccak256(expected657), "'1163553324' is not returning 'acd4e9aa04'");

        bytes memory expected658 = hex"f9f5b5bd04";
        uint64 value658 = 1202551545;

        Buffer.buffer memory result658 = Leb128.encodeUnsignedLeb128FromUInt64(value658);

        require(keccak256(result658.buf) == keccak256(expected658), "'1202551545' is not returning 'f9f5b5bd04'");

        bytes memory expected659 = hex"dc89ffc207";
        uint64 value659 = 2019542236;

        Buffer.buffer memory result659 = Leb128.encodeUnsignedLeb128FromUInt64(value659);

        require(keccak256(result659.buf) == keccak256(expected659), "'2019542236' is not returning 'dc89ffc207'");

        bytes memory expected660 = hex"b786dda40a";
        uint64 value660 = 2761376567;

        Buffer.buffer memory result660 = Leb128.encodeUnsignedLeb128FromUInt64(value660);

        require(keccak256(result660.buf) == keccak256(expected660), "'2761376567' is not returning 'b786dda40a'");

        bytes memory expected661 = hex"b2c2c2ff05";
        uint64 value661 = 1609605426;

        Buffer.buffer memory result661 = Leb128.encodeUnsignedLeb128FromUInt64(value661);

        require(keccak256(result661.buf) == keccak256(expected661), "'1609605426' is not returning 'b2c2c2ff05'");

        bytes memory expected662 = hex"a8d7bff601";
        uint64 value662 = 516942760;

        Buffer.buffer memory result662 = Leb128.encodeUnsignedLeb128FromUInt64(value662);

        require(keccak256(result662.buf) == keccak256(expected662), "'516942760' is not returning 'a8d7bff601'");

        bytes memory expected663 = hex"88baefed08";
        uint64 value663 = 2377899272;

        Buffer.buffer memory result663 = Leb128.encodeUnsignedLeb128FromUInt64(value663);

        require(keccak256(result663.buf) == keccak256(expected663), "'2377899272' is not returning '88baefed08'");

        bytes memory expected664 = hex"b2b0beab0d";
        uint64 value664 = 3580860466;

        Buffer.buffer memory result664 = Leb128.encodeUnsignedLeb128FromUInt64(value664);

        require(keccak256(result664.buf) == keccak256(expected664), "'3580860466' is not returning 'b2b0beab0d'");

        bytes memory expected665 = hex"b9bcf6f507";
        uint64 value665 = 2126356025;

        Buffer.buffer memory result665 = Leb128.encodeUnsignedLeb128FromUInt64(value665);

        require(keccak256(result665.buf) == keccak256(expected665), "'2126356025' is not returning 'b9bcf6f507'");

        bytes memory expected666 = hex"d9cdf5f805";
        uint64 value666 = 1595762393;

        Buffer.buffer memory result666 = Leb128.encodeUnsignedLeb128FromUInt64(value666);

        require(keccak256(result666.buf) == keccak256(expected666), "'1595762393' is not returning 'd9cdf5f805'");

        bytes memory expected667 = hex"ffa3e7de0a";
        uint64 value667 = 2883179007;

        Buffer.buffer memory result667 = Leb128.encodeUnsignedLeb128FromUInt64(value667);

        require(keccak256(result667.buf) == keccak256(expected667), "'2883179007' is not returning 'ffa3e7de0a'");

        bytes memory expected668 = hex"b9d286960d";
        uint64 value668 = 3535907129;

        Buffer.buffer memory result668 = Leb128.encodeUnsignedLeb128FromUInt64(value668);

        require(keccak256(result668.buf) == keccak256(expected668), "'3535907129' is not returning 'b9d286960d'");

        bytes memory expected669 = hex"cfd8c7a804";
        uint64 value669 = 1158802511;

        Buffer.buffer memory result669 = Leb128.encodeUnsignedLeb128FromUInt64(value669);

        require(keccak256(result669.buf) == keccak256(expected669), "'1158802511' is not returning 'cfd8c7a804'");

        bytes memory expected670 = hex"8ca2aaed01";
        uint64 value670 = 497717516;

        Buffer.buffer memory result670 = Leb128.encodeUnsignedLeb128FromUInt64(value670);

        require(keccak256(result670.buf) == keccak256(expected670), "'497717516' is not returning '8ca2aaed01'");

        bytes memory expected671 = hex"c3a3fce509";
        uint64 value671 = 2629767619;

        Buffer.buffer memory result671 = Leb128.encodeUnsignedLeb128FromUInt64(value671);

        require(keccak256(result671.buf) == keccak256(expected671), "'2629767619' is not returning 'c3a3fce509'");

        bytes memory expected672 = hex"9aea8a24";
        uint64 value672 = 75674906;

        Buffer.buffer memory result672 = Leb128.encodeUnsignedLeb128FromUInt64(value672);

        require(keccak256(result672.buf) == keccak256(expected672), "'75674906' is not returning '9aea8a24'");

        bytes memory expected673 = hex"e6b4d5d202";
        uint64 value673 = 710236774;

        Buffer.buffer memory result673 = Leb128.encodeUnsignedLeb128FromUInt64(value673);

        require(keccak256(result673.buf) == keccak256(expected673), "'710236774' is not returning 'e6b4d5d202'");

        bytes memory expected674 = hex"e599c7ed09";
        uint64 value674 = 2645675237;

        Buffer.buffer memory result674 = Leb128.encodeUnsignedLeb128FromUInt64(value674);

        require(keccak256(result674.buf) == keccak256(expected674), "'2645675237' is not returning 'e599c7ed09'");

        bytes memory expected675 = hex"e0fad1bf0a";
        uint64 value675 = 2817817952;

        Buffer.buffer memory result675 = Leb128.encodeUnsignedLeb128FromUInt64(value675);

        require(keccak256(result675.buf) == keccak256(expected675), "'2817817952' is not returning 'e0fad1bf0a'");

        bytes memory expected676 = hex"99c5b18004";
        uint64 value676 = 1074553497;

        Buffer.buffer memory result676 = Leb128.encodeUnsignedLeb128FromUInt64(value676);

        require(keccak256(result676.buf) == keccak256(expected676), "'1074553497' is not returning '99c5b18004'");

        bytes memory expected677 = hex"d184efe102";
        uint64 value677 = 742113873;

        Buffer.buffer memory result677 = Leb128.encodeUnsignedLeb128FromUInt64(value677);

        require(keccak256(result677.buf) == keccak256(expected677), "'742113873' is not returning 'd184efe102'");

        bytes memory expected678 = hex"ebf7bff208";
        uint64 value678 = 2387606507;

        Buffer.buffer memory result678 = Leb128.encodeUnsignedLeb128FromUInt64(value678);

        require(keccak256(result678.buf) == keccak256(expected678), "'2387606507' is not returning 'ebf7bff208'");

        bytes memory expected679 = hex"93c6c2a00e";
        uint64 value679 = 3826295571;

        Buffer.buffer memory result679 = Leb128.encodeUnsignedLeb128FromUInt64(value679);

        require(keccak256(result679.buf) == keccak256(expected679), "'3826295571' is not returning '93c6c2a00e'");

        bytes memory expected680 = hex"a0cba7bf05";
        uint64 value680 = 1474946464;

        Buffer.buffer memory result680 = Leb128.encodeUnsignedLeb128FromUInt64(value680);

        require(keccak256(result680.buf) == keccak256(expected680), "'1474946464' is not returning 'a0cba7bf05'");

        bytes memory expected681 = hex"d79baff90c";
        uint64 value681 = 3475754455;

        Buffer.buffer memory result681 = Leb128.encodeUnsignedLeb128FromUInt64(value681);

        require(keccak256(result681.buf) == keccak256(expected681), "'3475754455' is not returning 'd79baff90c'");

        bytes memory expected682 = hex"859acaaf0f";
        uint64 value682 = 4126313733;

        Buffer.buffer memory result682 = Leb128.encodeUnsignedLeb128FromUInt64(value682);

        require(keccak256(result682.buf) == keccak256(expected682), "'4126313733' is not returning '859acaaf0f'");

        bytes memory expected683 = hex"d3a1b19806";
        uint64 value683 = 1661751507;

        Buffer.buffer memory result683 = Leb128.encodeUnsignedLeb128FromUInt64(value683);

        require(keccak256(result683.buf) == keccak256(expected683), "'1661751507' is not returning 'd3a1b19806'");

        bytes memory expected684 = hex"8fd4e0b70b";
        uint64 value684 = 3069717007;

        Buffer.buffer memory result684 = Leb128.encodeUnsignedLeb128FromUInt64(value684);

        require(keccak256(result684.buf) == keccak256(expected684), "'3069717007' is not returning '8fd4e0b70b'");

        bytes memory expected685 = hex"abf6a7b70c";
        uint64 value685 = 3337222955;

        Buffer.buffer memory result685 = Leb128.encodeUnsignedLeb128FromUInt64(value685);

        require(keccak256(result685.buf) == keccak256(expected685), "'3337222955' is not returning 'abf6a7b70c'");

        bytes memory expected686 = hex"95a9c7ad06";
        uint64 value686 = 1706153109;

        Buffer.buffer memory result686 = Leb128.encodeUnsignedLeb128FromUInt64(value686);

        require(keccak256(result686.buf) == keccak256(expected686), "'1706153109' is not returning '95a9c7ad06'");

        bytes memory expected687 = hex"c1aac39c05";
        uint64 value687 = 1402000705;

        Buffer.buffer memory result687 = Leb128.encodeUnsignedLeb128FromUInt64(value687);

        require(keccak256(result687.buf) == keccak256(expected687), "'1402000705' is not returning 'c1aac39c05'");

        bytes memory expected688 = hex"8c89bbb108";
        uint64 value688 = 2251211916;

        Buffer.buffer memory result688 = Leb128.encodeUnsignedLeb128FromUInt64(value688);

        require(keccak256(result688.buf) == keccak256(expected688), "'2251211916' is not returning '8c89bbb108'");

        bytes memory expected689 = hex"c19bcdb60a";
        uint64 value689 = 2798865857;

        Buffer.buffer memory result689 = Leb128.encodeUnsignedLeb128FromUInt64(value689);

        require(keccak256(result689.buf) == keccak256(expected689), "'2798865857' is not returning 'c19bcdb60a'");

        bytes memory expected690 = hex"a1d0cd8e06";
        uint64 value690 = 1641244705;

        Buffer.buffer memory result690 = Leb128.encodeUnsignedLeb128FromUInt64(value690);

        require(keccak256(result690.buf) == keccak256(expected690), "'1641244705' is not returning 'a1d0cd8e06'");

        bytes memory expected691 = hex"dbd89cae09";
        uint64 value691 = 2512858203;

        Buffer.buffer memory result691 = Leb128.encodeUnsignedLeb128FromUInt64(value691);

        require(keccak256(result691.buf) == keccak256(expected691), "'2512858203' is not returning 'dbd89cae09'");

        bytes memory expected692 = hex"9db394fa01";
        uint64 value692 = 524622237;

        Buffer.buffer memory result692 = Leb128.encodeUnsignedLeb128FromUInt64(value692);

        require(keccak256(result692.buf) == keccak256(expected692), "'524622237' is not returning '9db394fa01'");

        bytes memory expected693 = hex"a2e4b4860e";
        uint64 value693 = 3771544098;

        Buffer.buffer memory result693 = Leb128.encodeUnsignedLeb128FromUInt64(value693);

        require(keccak256(result693.buf) == keccak256(expected693), "'3771544098' is not returning 'a2e4b4860e'");

        bytes memory expected694 = hex"b7ccd9a60f";
        uint64 value694 = 4107691575;

        Buffer.buffer memory result694 = Leb128.encodeUnsignedLeb128FromUInt64(value694);

        require(keccak256(result694.buf) == keccak256(expected694), "'4107691575' is not returning 'b7ccd9a60f'");

        bytes memory expected695 = hex"ffb0fd9f02";
        uint64 value695 = 603936895;

        Buffer.buffer memory result695 = Leb128.encodeUnsignedLeb128FromUInt64(value695);

        require(keccak256(result695.buf) == keccak256(expected695), "'603936895' is not returning 'ffb0fd9f02'");

        bytes memory expected696 = hex"f6a8d0ba0c";
        uint64 value696 = 3344176246;

        Buffer.buffer memory result696 = Leb128.encodeUnsignedLeb128FromUInt64(value696);

        require(keccak256(result696.buf) == keccak256(expected696), "'3344176246' is not returning 'f6a8d0ba0c'");

        bytes memory expected697 = hex"aaba9db404";
        uint64 value697 = 1183276330;

        Buffer.buffer memory result697 = Leb128.encodeUnsignedLeb128FromUInt64(value697);

        require(keccak256(result697.buf) == keccak256(expected697), "'1183276330' is not returning 'aaba9db404'");

        bytes memory expected698 = hex"bc92bfb30d";
        uint64 value698 = 3597650236;

        Buffer.buffer memory result698 = Leb128.encodeUnsignedLeb128FromUInt64(value698);

        require(keccak256(result698.buf) == keccak256(expected698), "'3597650236' is not returning 'bc92bfb30d'");
    }
}
