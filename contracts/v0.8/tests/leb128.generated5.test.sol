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
contract Leb128Generated5Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {
        bytes memory expected280 = hex"e78701";
        uint64 value280 = 17383;

        Buffer.buffer memory result280 = Leb128.encodeUnsignedLeb128FromUInt64(value280);

        require(keccak256(result280.buf) == keccak256(expected280), "'17383' is not returning 'e78701'");

        bytes memory expected281 = hex"ccd002";
        uint64 value281 = 43084;

        Buffer.buffer memory result281 = Leb128.encodeUnsignedLeb128FromUInt64(value281);

        require(keccak256(result281.buf) == keccak256(expected281), "'43084' is not returning 'ccd002'");

        bytes memory expected282 = hex"b0fa02";
        uint64 value282 = 48432;

        Buffer.buffer memory result282 = Leb128.encodeUnsignedLeb128FromUInt64(value282);

        require(keccak256(result282.buf) == keccak256(expected282), "'48432' is not returning 'b0fa02'");

        bytes memory expected283 = hex"f4d403";
        uint64 value283 = 60020;

        Buffer.buffer memory result283 = Leb128.encodeUnsignedLeb128FromUInt64(value283);

        require(keccak256(result283.buf) == keccak256(expected283), "'60020' is not returning 'f4d403'");

        bytes memory expected284 = hex"c40e";
        uint64 value284 = 1860;

        Buffer.buffer memory result284 = Leb128.encodeUnsignedLeb128FromUInt64(value284);

        require(keccak256(result284.buf) == keccak256(expected284), "'1860' is not returning 'c40e'");

        bytes memory expected285 = hex"bcff02";
        uint64 value285 = 49084;

        Buffer.buffer memory result285 = Leb128.encodeUnsignedLeb128FromUInt64(value285);

        require(keccak256(result285.buf) == keccak256(expected285), "'49084' is not returning 'bcff02'");

        bytes memory expected286 = hex"c17c";
        uint64 value286 = 15937;

        Buffer.buffer memory result286 = Leb128.encodeUnsignedLeb128FromUInt64(value286);

        require(keccak256(result286.buf) == keccak256(expected286), "'15937' is not returning 'c17c'");

        bytes memory expected287 = hex"8ba501";
        uint64 value287 = 21131;

        Buffer.buffer memory result287 = Leb128.encodeUnsignedLeb128FromUInt64(value287);

        require(keccak256(result287.buf) == keccak256(expected287), "'21131' is not returning '8ba501'");

        bytes memory expected288 = hex"e6f801";
        uint64 value288 = 31846;

        Buffer.buffer memory result288 = Leb128.encodeUnsignedLeb128FromUInt64(value288);

        require(keccak256(result288.buf) == keccak256(expected288), "'31846' is not returning 'e6f801'");

        bytes memory expected289 = hex"9e8502";
        uint64 value289 = 33438;

        Buffer.buffer memory result289 = Leb128.encodeUnsignedLeb128FromUInt64(value289);

        require(keccak256(result289.buf) == keccak256(expected289), "'33438' is not returning '9e8502'");

        bytes memory expected290 = hex"8ffb01";
        uint64 value290 = 32143;

        Buffer.buffer memory result290 = Leb128.encodeUnsignedLeb128FromUInt64(value290);

        require(keccak256(result290.buf) == keccak256(expected290), "'32143' is not returning '8ffb01'");

        bytes memory expected291 = hex"c2c903";
        uint64 value291 = 58562;

        Buffer.buffer memory result291 = Leb128.encodeUnsignedLeb128FromUInt64(value291);

        require(keccak256(result291.buf) == keccak256(expected291), "'58562' is not returning 'c2c903'");

        bytes memory expected292 = hex"dcaf01";
        uint64 value292 = 22492;

        Buffer.buffer memory result292 = Leb128.encodeUnsignedLeb128FromUInt64(value292);

        require(keccak256(result292.buf) == keccak256(expected292), "'22492' is not returning 'dcaf01'");

        bytes memory expected293 = hex"e1b802";
        uint64 value293 = 40033;

        Buffer.buffer memory result293 = Leb128.encodeUnsignedLeb128FromUInt64(value293);

        require(keccak256(result293.buf) == keccak256(expected293), "'40033' is not returning 'e1b802'");

        bytes memory expected294 = hex"84fa02";
        uint64 value294 = 48388;

        Buffer.buffer memory result294 = Leb128.encodeUnsignedLeb128FromUInt64(value294);

        require(keccak256(result294.buf) == keccak256(expected294), "'48388' is not returning '84fa02'");

        bytes memory expected295 = hex"eae401";
        uint64 value295 = 29290;

        Buffer.buffer memory result295 = Leb128.encodeUnsignedLeb128FromUInt64(value295);

        require(keccak256(result295.buf) == keccak256(expected295), "'29290' is not returning 'eae401'");

        bytes memory expected296 = hex"a8a403";
        uint64 value296 = 53800;

        Buffer.buffer memory result296 = Leb128.encodeUnsignedLeb128FromUInt64(value296);

        require(keccak256(result296.buf) == keccak256(expected296), "'53800' is not returning 'a8a403'");

        bytes memory expected297 = hex"a2c003";
        uint64 value297 = 57378;

        Buffer.buffer memory result297 = Leb128.encodeUnsignedLeb128FromUInt64(value297);

        require(keccak256(result297.buf) == keccak256(expected297), "'57378' is not returning 'a2c003'");

        bytes memory expected298 = hex"b9f402";
        uint64 value298 = 47673;

        Buffer.buffer memory result298 = Leb128.encodeUnsignedLeb128FromUInt64(value298);

        require(keccak256(result298.buf) == keccak256(expected298), "'47673' is not returning 'b9f402'");

        bytes memory expected299 = hex"82ce03";
        uint64 value299 = 59138;

        Buffer.buffer memory result299 = Leb128.encodeUnsignedLeb128FromUInt64(value299);

        require(keccak256(result299.buf) == keccak256(expected299), "'59138' is not returning '82ce03'");

        bytes memory expected300 = hex"d2a202";
        uint64 value300 = 37202;

        Buffer.buffer memory result300 = Leb128.encodeUnsignedLeb128FromUInt64(value300);

        require(keccak256(result300.buf) == keccak256(expected300), "'37202' is not returning 'd2a202'");

        bytes memory expected301 = hex"a7ff02";
        uint64 value301 = 49063;

        Buffer.buffer memory result301 = Leb128.encodeUnsignedLeb128FromUInt64(value301);

        require(keccak256(result301.buf) == keccak256(expected301), "'49063' is not returning 'a7ff02'");

        bytes memory expected302 = hex"cbf502";
        uint64 value302 = 47819;

        Buffer.buffer memory result302 = Leb128.encodeUnsignedLeb128FromUInt64(value302);

        require(keccak256(result302.buf) == keccak256(expected302), "'47819' is not returning 'cbf502'");

        bytes memory expected303 = hex"e09c03";
        uint64 value303 = 52832;

        Buffer.buffer memory result303 = Leb128.encodeUnsignedLeb128FromUInt64(value303);

        require(keccak256(result303.buf) == keccak256(expected303), "'52832' is not returning 'e09c03'");

        bytes memory expected304 = hex"ccd603";
        uint64 value304 = 60236;

        Buffer.buffer memory result304 = Leb128.encodeUnsignedLeb128FromUInt64(value304);

        require(keccak256(result304.buf) == keccak256(expected304), "'60236' is not returning 'ccd603'");

        bytes memory expected305 = hex"cfb003";
        uint64 value305 = 55375;

        Buffer.buffer memory result305 = Leb128.encodeUnsignedLeb128FromUInt64(value305);

        require(keccak256(result305.buf) == keccak256(expected305), "'55375' is not returning 'cfb003'");

        bytes memory expected306 = hex"ef3b";
        uint64 value306 = 7663;

        Buffer.buffer memory result306 = Leb128.encodeUnsignedLeb128FromUInt64(value306);

        require(keccak256(result306.buf) == keccak256(expected306), "'7663' is not returning 'ef3b'");

        bytes memory expected307 = hex"a237";
        uint64 value307 = 7074;

        Buffer.buffer memory result307 = Leb128.encodeUnsignedLeb128FromUInt64(value307);

        require(keccak256(result307.buf) == keccak256(expected307), "'7074' is not returning 'a237'");

        bytes memory expected308 = hex"86c503";
        uint64 value308 = 57990;

        Buffer.buffer memory result308 = Leb128.encodeUnsignedLeb128FromUInt64(value308);

        require(keccak256(result308.buf) == keccak256(expected308), "'57990' is not returning '86c503'");

        bytes memory expected309 = hex"899401";
        uint64 value309 = 18953;

        Buffer.buffer memory result309 = Leb128.encodeUnsignedLeb128FromUInt64(value309);

        require(keccak256(result309.buf) == keccak256(expected309), "'18953' is not returning '899401'");

        bytes memory expected310 = hex"bd28";
        uint64 value310 = 5181;

        Buffer.buffer memory result310 = Leb128.encodeUnsignedLeb128FromUInt64(value310);

        require(keccak256(result310.buf) == keccak256(expected310), "'5181' is not returning 'bd28'");

        bytes memory expected311 = hex"b646";
        uint64 value311 = 9014;

        Buffer.buffer memory result311 = Leb128.encodeUnsignedLeb128FromUInt64(value311);

        require(keccak256(result311.buf) == keccak256(expected311), "'9014' is not returning 'b646'");

        bytes memory expected312 = hex"c953";
        uint64 value312 = 10697;

        Buffer.buffer memory result312 = Leb128.encodeUnsignedLeb128FromUInt64(value312);

        require(keccak256(result312.buf) == keccak256(expected312), "'10697' is not returning 'c953'");

        bytes memory expected313 = hex"e7f003";
        uint64 value313 = 63591;

        Buffer.buffer memory result313 = Leb128.encodeUnsignedLeb128FromUInt64(value313);

        require(keccak256(result313.buf) == keccak256(expected313), "'63591' is not returning 'e7f003'");

        bytes memory expected314 = hex"b1ed02";
        uint64 value314 = 46769;

        Buffer.buffer memory result314 = Leb128.encodeUnsignedLeb128FromUInt64(value314);

        require(keccak256(result314.buf) == keccak256(expected314), "'46769' is not returning 'b1ed02'");

        bytes memory expected315 = hex"edbc03";
        uint64 value315 = 56941;

        Buffer.buffer memory result315 = Leb128.encodeUnsignedLeb128FromUInt64(value315);

        require(keccak256(result315.buf) == keccak256(expected315), "'56941' is not returning 'edbc03'");

        bytes memory expected316 = hex"8fc902";
        uint64 value316 = 42127;

        Buffer.buffer memory result316 = Leb128.encodeUnsignedLeb128FromUInt64(value316);

        require(keccak256(result316.buf) == keccak256(expected316), "'42127' is not returning '8fc902'");

        bytes memory expected317 = hex"b99601";
        uint64 value317 = 19257;

        Buffer.buffer memory result317 = Leb128.encodeUnsignedLeb128FromUInt64(value317);

        require(keccak256(result317.buf) == keccak256(expected317), "'19257' is not returning 'b99601'");

        bytes memory expected318 = hex"948a01";
        uint64 value318 = 17684;

        Buffer.buffer memory result318 = Leb128.encodeUnsignedLeb128FromUInt64(value318);

        require(keccak256(result318.buf) == keccak256(expected318), "'17684' is not returning '948a01'");

        bytes memory expected319 = hex"ad0a";
        uint64 value319 = 1325;

        Buffer.buffer memory result319 = Leb128.encodeUnsignedLeb128FromUInt64(value319);

        require(keccak256(result319.buf) == keccak256(expected319), "'1325' is not returning 'ad0a'");

        bytes memory expected320 = hex"90e303";
        uint64 value320 = 61840;

        Buffer.buffer memory result320 = Leb128.encodeUnsignedLeb128FromUInt64(value320);

        require(keccak256(result320.buf) == keccak256(expected320), "'61840' is not returning '90e303'");

        bytes memory expected321 = hex"86be02";
        uint64 value321 = 40710;

        Buffer.buffer memory result321 = Leb128.encodeUnsignedLeb128FromUInt64(value321);

        require(keccak256(result321.buf) == keccak256(expected321), "'40710' is not returning '86be02'");

        bytes memory expected322 = hex"82e503";
        uint64 value322 = 62082;

        Buffer.buffer memory result322 = Leb128.encodeUnsignedLeb128FromUInt64(value322);

        require(keccak256(result322.buf) == keccak256(expected322), "'62082' is not returning '82e503'");

        bytes memory expected323 = hex"aeb601";
        uint64 value323 = 23342;

        Buffer.buffer memory result323 = Leb128.encodeUnsignedLeb128FromUInt64(value323);

        require(keccak256(result323.buf) == keccak256(expected323), "'23342' is not returning 'aeb601'");

        bytes memory expected324 = hex"f29102";
        uint64 value324 = 35058;

        Buffer.buffer memory result324 = Leb128.encodeUnsignedLeb128FromUInt64(value324);

        require(keccak256(result324.buf) == keccak256(expected324), "'35058' is not returning 'f29102'");

        bytes memory expected325 = hex"dfb902";
        uint64 value325 = 40159;

        Buffer.buffer memory result325 = Leb128.encodeUnsignedLeb128FromUInt64(value325);

        require(keccak256(result325.buf) == keccak256(expected325), "'40159' is not returning 'dfb902'");

        bytes memory expected326 = hex"9dd902";
        uint64 value326 = 44189;

        Buffer.buffer memory result326 = Leb128.encodeUnsignedLeb128FromUInt64(value326);

        require(keccak256(result326.buf) == keccak256(expected326), "'44189' is not returning '9dd902'");

        bytes memory expected327 = hex"d4e403";
        uint64 value327 = 62036;

        Buffer.buffer memory result327 = Leb128.encodeUnsignedLeb128FromUInt64(value327);

        require(keccak256(result327.buf) == keccak256(expected327), "'62036' is not returning 'd4e403'");

        bytes memory expected328 = hex"9fc202";
        uint64 value328 = 41247;

        Buffer.buffer memory result328 = Leb128.encodeUnsignedLeb128FromUInt64(value328);

        require(keccak256(result328.buf) == keccak256(expected328), "'41247' is not returning '9fc202'");

        bytes memory expected329 = hex"d8d003";
        uint64 value329 = 59480;

        Buffer.buffer memory result329 = Leb128.encodeUnsignedLeb128FromUInt64(value329);

        require(keccak256(result329.buf) == keccak256(expected329), "'59480' is not returning 'd8d003'");

        bytes memory expected330 = hex"a8aa02";
        uint64 value330 = 38184;

        Buffer.buffer memory result330 = Leb128.encodeUnsignedLeb128FromUInt64(value330);

        require(keccak256(result330.buf) == keccak256(expected330), "'38184' is not returning 'a8aa02'");

        bytes memory expected331 = hex"967a";
        uint64 value331 = 15638;

        Buffer.buffer memory result331 = Leb128.encodeUnsignedLeb128FromUInt64(value331);

        require(keccak256(result331.buf) == keccak256(expected331), "'15638' is not returning '967a'");

        bytes memory expected332 = hex"b1d003";
        uint64 value332 = 59441;

        Buffer.buffer memory result332 = Leb128.encodeUnsignedLeb128FromUInt64(value332);

        require(keccak256(result332.buf) == keccak256(expected332), "'59441' is not returning 'b1d003'");

        bytes memory expected333 = hex"859202";
        uint64 value333 = 35077;

        Buffer.buffer memory result333 = Leb128.encodeUnsignedLeb128FromUInt64(value333);

        require(keccak256(result333.buf) == keccak256(expected333), "'35077' is not returning '859202'");

        bytes memory expected334 = hex"8b1d";
        uint64 value334 = 3723;

        Buffer.buffer memory result334 = Leb128.encodeUnsignedLeb128FromUInt64(value334);

        require(keccak256(result334.buf) == keccak256(expected334), "'3723' is not returning '8b1d'");

        bytes memory expected335 = hex"e79601";
        uint64 value335 = 19303;

        Buffer.buffer memory result335 = Leb128.encodeUnsignedLeb128FromUInt64(value335);

        require(keccak256(result335.buf) == keccak256(expected335), "'19303' is not returning 'e79601'");

        bytes memory expected336 = hex"821e";
        uint64 value336 = 3842;

        Buffer.buffer memory result336 = Leb128.encodeUnsignedLeb128FromUInt64(value336);

        require(keccak256(result336.buf) == keccak256(expected336), "'3842' is not returning '821e'");

        bytes memory expected337 = hex"b1d001";
        uint64 value337 = 26673;

        Buffer.buffer memory result337 = Leb128.encodeUnsignedLeb128FromUInt64(value337);

        require(keccak256(result337.buf) == keccak256(expected337), "'26673' is not returning 'b1d001'");

        bytes memory expected338 = hex"e0fe03";
        uint64 value338 = 65376;

        Buffer.buffer memory result338 = Leb128.encodeUnsignedLeb128FromUInt64(value338);

        require(keccak256(result338.buf) == keccak256(expected338), "'65376' is not returning 'e0fe03'");

        bytes memory expected339 = hex"fdc602";
        uint64 value339 = 41853;

        Buffer.buffer memory result339 = Leb128.encodeUnsignedLeb128FromUInt64(value339);

        require(keccak256(result339.buf) == keccak256(expected339), "'41853' is not returning 'fdc602'");

        bytes memory expected340 = hex"f8e901";
        uint64 value340 = 29944;

        Buffer.buffer memory result340 = Leb128.encodeUnsignedLeb128FromUInt64(value340);

        require(keccak256(result340.buf) == keccak256(expected340), "'29944' is not returning 'f8e901'");

        bytes memory expected341 = hex"8ba802";
        uint64 value341 = 37899;

        Buffer.buffer memory result341 = Leb128.encodeUnsignedLeb128FromUInt64(value341);

        require(keccak256(result341.buf) == keccak256(expected341), "'37899' is not returning '8ba802'");

        bytes memory expected342 = hex"81c903";
        uint64 value342 = 58497;

        Buffer.buffer memory result342 = Leb128.encodeUnsignedLeb128FromUInt64(value342);

        require(keccak256(result342.buf) == keccak256(expected342), "'58497' is not returning '81c903'");

        bytes memory expected343 = hex"989501";
        uint64 value343 = 19096;

        Buffer.buffer memory result343 = Leb128.encodeUnsignedLeb128FromUInt64(value343);

        require(keccak256(result343.buf) == keccak256(expected343), "'19096' is not returning '989501'");

        bytes memory expected344 = hex"ba7a";
        uint64 value344 = 15674;

        Buffer.buffer memory result344 = Leb128.encodeUnsignedLeb128FromUInt64(value344);

        require(keccak256(result344.buf) == keccak256(expected344), "'15674' is not returning 'ba7a'");

        bytes memory expected345 = hex"99df01";
        uint64 value345 = 28569;

        Buffer.buffer memory result345 = Leb128.encodeUnsignedLeb128FromUInt64(value345);

        require(keccak256(result345.buf) == keccak256(expected345), "'28569' is not returning '99df01'");

        bytes memory expected346 = hex"edf703";
        uint64 value346 = 64493;

        Buffer.buffer memory result346 = Leb128.encodeUnsignedLeb128FromUInt64(value346);

        require(keccak256(result346.buf) == keccak256(expected346), "'64493' is not returning 'edf703'");

        bytes memory expected347 = hex"b4fd01";
        uint64 value347 = 32436;

        Buffer.buffer memory result347 = Leb128.encodeUnsignedLeb128FromUInt64(value347);

        require(keccak256(result347.buf) == keccak256(expected347), "'32436' is not returning 'b4fd01'");

        bytes memory expected348 = hex"f733";
        uint64 value348 = 6647;

        Buffer.buffer memory result348 = Leb128.encodeUnsignedLeb128FromUInt64(value348);

        require(keccak256(result348.buf) == keccak256(expected348), "'6647' is not returning 'f733'");
    }
}
