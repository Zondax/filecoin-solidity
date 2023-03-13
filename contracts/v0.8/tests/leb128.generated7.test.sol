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
contract Leb128Generated7Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {
        bytes memory expected420 = hex"8c12";
        uint64 value420 = 2316;

        Buffer.buffer memory result420 = Leb128.encodeUnsignedLeb128FromUInt64(value420);

        require(keccak256(result420.buf) == keccak256(expected420), "'2316' is not returning '8c12'");

        bytes memory expected421 = hex"d5cc03";
        uint64 value421 = 58965;

        Buffer.buffer memory result421 = Leb128.encodeUnsignedLeb128FromUInt64(value421);

        require(keccak256(result421.buf) == keccak256(expected421), "'58965' is not returning 'd5cc03'");

        bytes memory expected422 = hex"bf8302";
        uint64 value422 = 33215;

        Buffer.buffer memory result422 = Leb128.encodeUnsignedLeb128FromUInt64(value422);

        require(keccak256(result422.buf) == keccak256(expected422), "'33215' is not returning 'bf8302'");

        bytes memory expected423 = hex"8eb902";
        uint64 value423 = 40078;

        Buffer.buffer memory result423 = Leb128.encodeUnsignedLeb128FromUInt64(value423);

        require(keccak256(result423.buf) == keccak256(expected423), "'40078' is not returning '8eb902'");

        bytes memory expected424 = hex"a3d601";
        uint64 value424 = 27427;

        Buffer.buffer memory result424 = Leb128.encodeUnsignedLeb128FromUInt64(value424);

        require(keccak256(result424.buf) == keccak256(expected424), "'27427' is not returning 'a3d601'");

        bytes memory expected425 = hex"bd8102";
        uint64 value425 = 32957;

        Buffer.buffer memory result425 = Leb128.encodeUnsignedLeb128FromUInt64(value425);

        require(keccak256(result425.buf) == keccak256(expected425), "'32957' is not returning 'bd8102'");

        bytes memory expected426 = hex"fc8001";
        uint64 value426 = 16508;

        Buffer.buffer memory result426 = Leb128.encodeUnsignedLeb128FromUInt64(value426);

        require(keccak256(result426.buf) == keccak256(expected426), "'16508' is not returning 'fc8001'");

        bytes memory expected427 = hex"b2b302";
        uint64 value427 = 39346;

        Buffer.buffer memory result427 = Leb128.encodeUnsignedLeb128FromUInt64(value427);

        require(keccak256(result427.buf) == keccak256(expected427), "'39346' is not returning 'b2b302'");

        bytes memory expected428 = hex"9fe401";
        uint64 value428 = 29215;

        Buffer.buffer memory result428 = Leb128.encodeUnsignedLeb128FromUInt64(value428);

        require(keccak256(result428.buf) == keccak256(expected428), "'29215' is not returning '9fe401'");

        bytes memory expected429 = hex"c426";
        uint64 value429 = 4932;

        Buffer.buffer memory result429 = Leb128.encodeUnsignedLeb128FromUInt64(value429);

        require(keccak256(result429.buf) == keccak256(expected429), "'4932' is not returning 'c426'");

        bytes memory expected430 = hex"b7ca03";
        uint64 value430 = 58679;

        Buffer.buffer memory result430 = Leb128.encodeUnsignedLeb128FromUInt64(value430);

        require(keccak256(result430.buf) == keccak256(expected430), "'58679' is not returning 'b7ca03'");

        bytes memory expected431 = hex"cbf503";
        uint64 value431 = 64203;

        Buffer.buffer memory result431 = Leb128.encodeUnsignedLeb128FromUInt64(value431);

        require(keccak256(result431.buf) == keccak256(expected431), "'64203' is not returning 'cbf503'");

        bytes memory expected432 = hex"80f001";
        uint64 value432 = 30720;

        Buffer.buffer memory result432 = Leb128.encodeUnsignedLeb128FromUInt64(value432);

        require(keccak256(result432.buf) == keccak256(expected432), "'30720' is not returning '80f001'");

        bytes memory expected433 = hex"b3af03";
        uint64 value433 = 55219;

        Buffer.buffer memory result433 = Leb128.encodeUnsignedLeb128FromUInt64(value433);

        require(keccak256(result433.buf) == keccak256(expected433), "'55219' is not returning 'b3af03'");

        bytes memory expected434 = hex"e265";
        uint64 value434 = 13026;

        Buffer.buffer memory result434 = Leb128.encodeUnsignedLeb128FromUInt64(value434);

        require(keccak256(result434.buf) == keccak256(expected434), "'13026' is not returning 'e265'");

        bytes memory expected435 = hex"e69301";
        uint64 value435 = 18918;

        Buffer.buffer memory result435 = Leb128.encodeUnsignedLeb128FromUInt64(value435);

        require(keccak256(result435.buf) == keccak256(expected435), "'18918' is not returning 'e69301'");

        bytes memory expected436 = hex"99af03";
        uint64 value436 = 55193;

        Buffer.buffer memory result436 = Leb128.encodeUnsignedLeb128FromUInt64(value436);

        require(keccak256(result436.buf) == keccak256(expected436), "'55193' is not returning '99af03'");

        bytes memory expected437 = hex"aba803";
        uint64 value437 = 54315;

        Buffer.buffer memory result437 = Leb128.encodeUnsignedLeb128FromUInt64(value437);

        require(keccak256(result437.buf) == keccak256(expected437), "'54315' is not returning 'aba803'");

        bytes memory expected438 = hex"9db602";
        uint64 value438 = 39709;

        Buffer.buffer memory result438 = Leb128.encodeUnsignedLeb128FromUInt64(value438);

        require(keccak256(result438.buf) == keccak256(expected438), "'39709' is not returning '9db602'");

        bytes memory expected439 = hex"9559";
        uint64 value439 = 11413;

        Buffer.buffer memory result439 = Leb128.encodeUnsignedLeb128FromUInt64(value439);

        require(keccak256(result439.buf) == keccak256(expected439), "'11413' is not returning '9559'");

        bytes memory expected440 = hex"c43a";
        uint64 value440 = 7492;

        Buffer.buffer memory result440 = Leb128.encodeUnsignedLeb128FromUInt64(value440);

        require(keccak256(result440.buf) == keccak256(expected440), "'7492' is not returning 'c43a'");

        bytes memory expected441 = hex"a3f901";
        uint64 value441 = 31907;

        Buffer.buffer memory result441 = Leb128.encodeUnsignedLeb128FromUInt64(value441);

        require(keccak256(result441.buf) == keccak256(expected441), "'31907' is not returning 'a3f901'");

        bytes memory expected442 = hex"f139";
        uint64 value442 = 7409;

        Buffer.buffer memory result442 = Leb128.encodeUnsignedLeb128FromUInt64(value442);

        require(keccak256(result442.buf) == keccak256(expected442), "'7409' is not returning 'f139'");

        bytes memory expected443 = hex"8e8802";
        uint64 value443 = 33806;

        Buffer.buffer memory result443 = Leb128.encodeUnsignedLeb128FromUInt64(value443);

        require(keccak256(result443.buf) == keccak256(expected443), "'33806' is not returning '8e8802'");

        bytes memory expected444 = hex"c469";
        uint64 value444 = 13508;

        Buffer.buffer memory result444 = Leb128.encodeUnsignedLeb128FromUInt64(value444);

        require(keccak256(result444.buf) == keccak256(expected444), "'13508' is not returning 'c469'");

        bytes memory expected445 = hex"83b903";
        uint64 value445 = 56451;

        Buffer.buffer memory result445 = Leb128.encodeUnsignedLeb128FromUInt64(value445);

        require(keccak256(result445.buf) == keccak256(expected445), "'56451' is not returning '83b903'");

        bytes memory expected446 = hex"9c9402";
        uint64 value446 = 35356;

        Buffer.buffer memory result446 = Leb128.encodeUnsignedLeb128FromUInt64(value446);

        require(keccak256(result446.buf) == keccak256(expected446), "'35356' is not returning '9c9402'");

        bytes memory expected447 = hex"d0b003";
        uint64 value447 = 55376;

        Buffer.buffer memory result447 = Leb128.encodeUnsignedLeb128FromUInt64(value447);

        require(keccak256(result447.buf) == keccak256(expected447), "'55376' is not returning 'd0b003'");

        bytes memory expected448 = hex"968b01";
        uint64 value448 = 17814;

        Buffer.buffer memory result448 = Leb128.encodeUnsignedLeb128FromUInt64(value448);

        require(keccak256(result448.buf) == keccak256(expected448), "'17814' is not returning '968b01'");

        bytes memory expected449 = hex"85f803";
        uint64 value449 = 64517;

        Buffer.buffer memory result449 = Leb128.encodeUnsignedLeb128FromUInt64(value449);

        require(keccak256(result449.buf) == keccak256(expected449), "'64517' is not returning '85f803'");

        bytes memory expected450 = hex"b217";
        uint64 value450 = 2994;

        Buffer.buffer memory result450 = Leb128.encodeUnsignedLeb128FromUInt64(value450);

        require(keccak256(result450.buf) == keccak256(expected450), "'2994' is not returning 'b217'");

        bytes memory expected451 = hex"a1ce03";
        uint64 value451 = 59169;

        Buffer.buffer memory result451 = Leb128.encodeUnsignedLeb128FromUInt64(value451);

        require(keccak256(result451.buf) == keccak256(expected451), "'59169' is not returning 'a1ce03'");

        bytes memory expected452 = hex"8fb703";
        uint64 value452 = 56207;

        Buffer.buffer memory result452 = Leb128.encodeUnsignedLeb128FromUInt64(value452);

        require(keccak256(result452.buf) == keccak256(expected452), "'56207' is not returning '8fb703'");

        bytes memory expected453 = hex"83ad01";
        uint64 value453 = 22147;

        Buffer.buffer memory result453 = Leb128.encodeUnsignedLeb128FromUInt64(value453);

        require(keccak256(result453.buf) == keccak256(expected453), "'22147' is not returning '83ad01'");

        bytes memory expected454 = hex"bc6d";
        uint64 value454 = 14012;

        Buffer.buffer memory result454 = Leb128.encodeUnsignedLeb128FromUInt64(value454);

        require(keccak256(result454.buf) == keccak256(expected454), "'14012' is not returning 'bc6d'");

        bytes memory expected455 = hex"fe65";
        uint64 value455 = 13054;

        Buffer.buffer memory result455 = Leb128.encodeUnsignedLeb128FromUInt64(value455);

        require(keccak256(result455.buf) == keccak256(expected455), "'13054' is not returning 'fe65'");

        bytes memory expected456 = hex"9c26";
        uint64 value456 = 4892;

        Buffer.buffer memory result456 = Leb128.encodeUnsignedLeb128FromUInt64(value456);

        require(keccak256(result456.buf) == keccak256(expected456), "'4892' is not returning '9c26'");

        bytes memory expected457 = hex"83cb02";
        uint64 value457 = 42371;

        Buffer.buffer memory result457 = Leb128.encodeUnsignedLeb128FromUInt64(value457);

        require(keccak256(result457.buf) == keccak256(expected457), "'42371' is not returning '83cb02'");

        bytes memory expected458 = hex"8541";
        uint64 value458 = 8325;

        Buffer.buffer memory result458 = Leb128.encodeUnsignedLeb128FromUInt64(value458);

        require(keccak256(result458.buf) == keccak256(expected458), "'8325' is not returning '8541'");

        bytes memory expected459 = hex"a9a603";
        uint64 value459 = 54057;

        Buffer.buffer memory result459 = Leb128.encodeUnsignedLeb128FromUInt64(value459);

        require(keccak256(result459.buf) == keccak256(expected459), "'54057' is not returning 'a9a603'");

        bytes memory expected460 = hex"c2e202";
        uint64 value460 = 45378;

        Buffer.buffer memory result460 = Leb128.encodeUnsignedLeb128FromUInt64(value460);

        require(keccak256(result460.buf) == keccak256(expected460), "'45378' is not returning 'c2e202'");

        bytes memory expected461 = hex"a4d202";
        uint64 value461 = 43300;

        Buffer.buffer memory result461 = Leb128.encodeUnsignedLeb128FromUInt64(value461);

        require(keccak256(result461.buf) == keccak256(expected461), "'43300' is not returning 'a4d202'");

        bytes memory expected462 = hex"cbff01";
        uint64 value462 = 32715;

        Buffer.buffer memory result462 = Leb128.encodeUnsignedLeb128FromUInt64(value462);

        require(keccak256(result462.buf) == keccak256(expected462), "'32715' is not returning 'cbff01'");

        bytes memory expected463 = hex"bfb702";
        uint64 value463 = 39871;

        Buffer.buffer memory result463 = Leb128.encodeUnsignedLeb128FromUInt64(value463);

        require(keccak256(result463.buf) == keccak256(expected463), "'39871' is not returning 'bfb702'");

        bytes memory expected464 = hex"c4b103";
        uint64 value464 = 55492;

        Buffer.buffer memory result464 = Leb128.encodeUnsignedLeb128FromUInt64(value464);

        require(keccak256(result464.buf) == keccak256(expected464), "'55492' is not returning 'c4b103'");

        bytes memory expected465 = hex"b8ca03";
        uint64 value465 = 58680;

        Buffer.buffer memory result465 = Leb128.encodeUnsignedLeb128FromUInt64(value465);

        require(keccak256(result465.buf) == keccak256(expected465), "'58680' is not returning 'b8ca03'");

        bytes memory expected466 = hex"cf8402";
        uint64 value466 = 33359;

        Buffer.buffer memory result466 = Leb128.encodeUnsignedLeb128FromUInt64(value466);

        require(keccak256(result466.buf) == keccak256(expected466), "'33359' is not returning 'cf8402'");

        bytes memory expected467 = hex"fa8902";
        uint64 value467 = 34042;

        Buffer.buffer memory result467 = Leb128.encodeUnsignedLeb128FromUInt64(value467);

        require(keccak256(result467.buf) == keccak256(expected467), "'34042' is not returning 'fa8902'");

        bytes memory expected468 = hex"928902";
        uint64 value468 = 33938;

        Buffer.buffer memory result468 = Leb128.encodeUnsignedLeb128FromUInt64(value468);

        require(keccak256(result468.buf) == keccak256(expected468), "'33938' is not returning '928902'");

        bytes memory expected469 = hex"cd15";
        uint64 value469 = 2765;

        Buffer.buffer memory result469 = Leb128.encodeUnsignedLeb128FromUInt64(value469);

        require(keccak256(result469.buf) == keccak256(expected469), "'2765' is not returning 'cd15'");

        bytes memory expected470 = hex"e29a01";
        uint64 value470 = 19810;

        Buffer.buffer memory result470 = Leb128.encodeUnsignedLeb128FromUInt64(value470);

        require(keccak256(result470.buf) == keccak256(expected470), "'19810' is not returning 'e29a01'");

        bytes memory expected471 = hex"b507";
        uint64 value471 = 949;

        Buffer.buffer memory result471 = Leb128.encodeUnsignedLeb128FromUInt64(value471);

        require(keccak256(result471.buf) == keccak256(expected471), "'949' is not returning 'b507'");

        bytes memory expected472 = hex"b2e003";
        uint64 value472 = 61490;

        Buffer.buffer memory result472 = Leb128.encodeUnsignedLeb128FromUInt64(value472);

        require(keccak256(result472.buf) == keccak256(expected472), "'61490' is not returning 'b2e003'");

        bytes memory expected473 = hex"adbf03";
        uint64 value473 = 57261;

        Buffer.buffer memory result473 = Leb128.encodeUnsignedLeb128FromUInt64(value473);

        require(keccak256(result473.buf) == keccak256(expected473), "'57261' is not returning 'adbf03'");

        bytes memory expected474 = hex"f3ef03";
        uint64 value474 = 63475;

        Buffer.buffer memory result474 = Leb128.encodeUnsignedLeb128FromUInt64(value474);

        require(keccak256(result474.buf) == keccak256(expected474), "'63475' is not returning 'f3ef03'");

        bytes memory expected475 = hex"a7a601";
        uint64 value475 = 21287;

        Buffer.buffer memory result475 = Leb128.encodeUnsignedLeb128FromUInt64(value475);

        require(keccak256(result475.buf) == keccak256(expected475), "'21287' is not returning 'a7a601'");

        bytes memory expected476 = hex"aef402";
        uint64 value476 = 47662;

        Buffer.buffer memory result476 = Leb128.encodeUnsignedLeb128FromUInt64(value476);

        require(keccak256(result476.buf) == keccak256(expected476), "'47662' is not returning 'aef402'");

        bytes memory expected477 = hex"a2b603";
        uint64 value477 = 56098;

        Buffer.buffer memory result477 = Leb128.encodeUnsignedLeb128FromUInt64(value477);

        require(keccak256(result477.buf) == keccak256(expected477), "'56098' is not returning 'a2b603'");

        bytes memory expected478 = hex"d6a703";
        uint64 value478 = 54230;

        Buffer.buffer memory result478 = Leb128.encodeUnsignedLeb128FromUInt64(value478);

        require(keccak256(result478.buf) == keccak256(expected478), "'54230' is not returning 'd6a703'");

        bytes memory expected479 = hex"edb102";
        uint64 value479 = 39149;

        Buffer.buffer memory result479 = Leb128.encodeUnsignedLeb128FromUInt64(value479);

        require(keccak256(result479.buf) == keccak256(expected479), "'39149' is not returning 'edb102'");

        bytes memory expected480 = hex"ace002";
        uint64 value480 = 45100;

        Buffer.buffer memory result480 = Leb128.encodeUnsignedLeb128FromUInt64(value480);

        require(keccak256(result480.buf) == keccak256(expected480), "'45100' is not returning 'ace002'");

        bytes memory expected481 = hex"c6dc03";
        uint64 value481 = 60998;

        Buffer.buffer memory result481 = Leb128.encodeUnsignedLeb128FromUInt64(value481);

        require(keccak256(result481.buf) == keccak256(expected481), "'60998' is not returning 'c6dc03'");

        bytes memory expected482 = hex"a1f901";
        uint64 value482 = 31905;

        Buffer.buffer memory result482 = Leb128.encodeUnsignedLeb128FromUInt64(value482);

        require(keccak256(result482.buf) == keccak256(expected482), "'31905' is not returning 'a1f901'");

        bytes memory expected483 = hex"94b201";
        uint64 value483 = 22804;

        Buffer.buffer memory result483 = Leb128.encodeUnsignedLeb128FromUInt64(value483);

        require(keccak256(result483.buf) == keccak256(expected483), "'22804' is not returning '94b201'");

        bytes memory expected484 = hex"dedb02";
        uint64 value484 = 44510;

        Buffer.buffer memory result484 = Leb128.encodeUnsignedLeb128FromUInt64(value484);

        require(keccak256(result484.buf) == keccak256(expected484), "'44510' is not returning 'dedb02'");

        bytes memory expected485 = hex"9077";
        uint64 value485 = 15248;

        Buffer.buffer memory result485 = Leb128.encodeUnsignedLeb128FromUInt64(value485);

        require(keccak256(result485.buf) == keccak256(expected485), "'15248' is not returning '9077'");

        bytes memory expected486 = hex"f972";
        uint64 value486 = 14713;

        Buffer.buffer memory result486 = Leb128.encodeUnsignedLeb128FromUInt64(value486);

        require(keccak256(result486.buf) == keccak256(expected486), "'14713' is not returning 'f972'");

        bytes memory expected487 = hex"b1c703";
        uint64 value487 = 58289;

        Buffer.buffer memory result487 = Leb128.encodeUnsignedLeb128FromUInt64(value487);

        require(keccak256(result487.buf) == keccak256(expected487), "'58289' is not returning 'b1c703'");

        bytes memory expected488 = hex"8943";
        uint64 value488 = 8585;

        Buffer.buffer memory result488 = Leb128.encodeUnsignedLeb128FromUInt64(value488);

        require(keccak256(result488.buf) == keccak256(expected488), "'8585' is not returning '8943'");
    }
}
