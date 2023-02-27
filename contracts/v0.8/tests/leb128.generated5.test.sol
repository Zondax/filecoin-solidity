
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
contract Leb128Generated5Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {

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

        bytes memory expected349 = hex"abe602";
        uint64 value349 = 45867;

        Buffer.buffer memory result349 = Leb128.encodeUnsignedLeb128FromUInt64(value349);

        require(keccak256(result349.buf) == keccak256(expected349), "'45867' is not returning 'abe602'");    

        bytes memory expected350 = hex"cc78";
        uint64 value350 = 15436;

        Buffer.buffer memory result350 = Leb128.encodeUnsignedLeb128FromUInt64(value350);

        require(keccak256(result350.buf) == keccak256(expected350), "'15436' is not returning 'cc78'");    

        bytes memory expected351 = hex"e68d03";
        uint64 value351 = 50918;

        Buffer.buffer memory result351 = Leb128.encodeUnsignedLeb128FromUInt64(value351);

        require(keccak256(result351.buf) == keccak256(expected351), "'50918' is not returning 'e68d03'");    

        bytes memory expected352 = hex"9873";
        uint64 value352 = 14744;

        Buffer.buffer memory result352 = Leb128.encodeUnsignedLeb128FromUInt64(value352);

        require(keccak256(result352.buf) == keccak256(expected352), "'14744' is not returning '9873'");    

        bytes memory expected353 = hex"9d9302";
        uint64 value353 = 35229;

        Buffer.buffer memory result353 = Leb128.encodeUnsignedLeb128FromUInt64(value353);

        require(keccak256(result353.buf) == keccak256(expected353), "'35229' is not returning '9d9302'");    

        bytes memory expected354 = hex"d0bf01";
        uint64 value354 = 24528;

        Buffer.buffer memory result354 = Leb128.encodeUnsignedLeb128FromUInt64(value354);

        require(keccak256(result354.buf) == keccak256(expected354), "'24528' is not returning 'd0bf01'");    

        bytes memory expected355 = hex"988a03";
        uint64 value355 = 50456;

        Buffer.buffer memory result355 = Leb128.encodeUnsignedLeb128FromUInt64(value355);

        require(keccak256(result355.buf) == keccak256(expected355), "'50456' is not returning '988a03'");    

        bytes memory expected356 = hex"a4b002";
        uint64 value356 = 38948;

        Buffer.buffer memory result356 = Leb128.encodeUnsignedLeb128FromUInt64(value356);

        require(keccak256(result356.buf) == keccak256(expected356), "'38948' is not returning 'a4b002'");    

        bytes memory expected357 = hex"ddda02";
        uint64 value357 = 44381;

        Buffer.buffer memory result357 = Leb128.encodeUnsignedLeb128FromUInt64(value357);

        require(keccak256(result357.buf) == keccak256(expected357), "'44381' is not returning 'ddda02'");    

        bytes memory expected358 = hex"feda02";
        uint64 value358 = 44414;

        Buffer.buffer memory result358 = Leb128.encodeUnsignedLeb128FromUInt64(value358);

        require(keccak256(result358.buf) == keccak256(expected358), "'44414' is not returning 'feda02'");    

        bytes memory expected359 = hex"8aa203";
        uint64 value359 = 53514;

        Buffer.buffer memory result359 = Leb128.encodeUnsignedLeb128FromUInt64(value359);

        require(keccak256(result359.buf) == keccak256(expected359), "'53514' is not returning '8aa203'");    

        bytes memory expected360 = hex"a5d001";
        uint64 value360 = 26661;

        Buffer.buffer memory result360 = Leb128.encodeUnsignedLeb128FromUInt64(value360);

        require(keccak256(result360.buf) == keccak256(expected360), "'26661' is not returning 'a5d001'");    

        bytes memory expected361 = hex"9836";
        uint64 value361 = 6936;

        Buffer.buffer memory result361 = Leb128.encodeUnsignedLeb128FromUInt64(value361);

        require(keccak256(result361.buf) == keccak256(expected361), "'6936' is not returning '9836'");    

        bytes memory expected362 = hex"b7f703";
        uint64 value362 = 64439;

        Buffer.buffer memory result362 = Leb128.encodeUnsignedLeb128FromUInt64(value362);

        require(keccak256(result362.buf) == keccak256(expected362), "'64439' is not returning 'b7f703'");    

        bytes memory expected363 = hex"9032";
        uint64 value363 = 6416;

        Buffer.buffer memory result363 = Leb128.encodeUnsignedLeb128FromUInt64(value363);

        require(keccak256(result363.buf) == keccak256(expected363), "'6416' is not returning '9032'");    

        bytes memory expected364 = hex"84fb03";
        uint64 value364 = 64900;

        Buffer.buffer memory result364 = Leb128.encodeUnsignedLeb128FromUInt64(value364);

        require(keccak256(result364.buf) == keccak256(expected364), "'64900' is not returning '84fb03'");    

        bytes memory expected365 = hex"ed8001";
        uint64 value365 = 16493;

        Buffer.buffer memory result365 = Leb128.encodeUnsignedLeb128FromUInt64(value365);

        require(keccak256(result365.buf) == keccak256(expected365), "'16493' is not returning 'ed8001'");    

        bytes memory expected366 = hex"96d903";
        uint64 value366 = 60566;

        Buffer.buffer memory result366 = Leb128.encodeUnsignedLeb128FromUInt64(value366);

        require(keccak256(result366.buf) == keccak256(expected366), "'60566' is not returning '96d903'");    

        bytes memory expected367 = hex"b4d002";
        uint64 value367 = 43060;

        Buffer.buffer memory result367 = Leb128.encodeUnsignedLeb128FromUInt64(value367);

        require(keccak256(result367.buf) == keccak256(expected367), "'43060' is not returning 'b4d002'");    

        bytes memory expected368 = hex"9fe802";
        uint64 value368 = 46111;

        Buffer.buffer memory result368 = Leb128.encodeUnsignedLeb128FromUInt64(value368);

        require(keccak256(result368.buf) == keccak256(expected368), "'46111' is not returning '9fe802'");    

        bytes memory expected369 = hex"d559";
        uint64 value369 = 11477;

        Buffer.buffer memory result369 = Leb128.encodeUnsignedLeb128FromUInt64(value369);

        require(keccak256(result369.buf) == keccak256(expected369), "'11477' is not returning 'd559'");    

        bytes memory expected370 = hex"ed19";
        uint64 value370 = 3309;

        Buffer.buffer memory result370 = Leb128.encodeUnsignedLeb128FromUInt64(value370);

        require(keccak256(result370.buf) == keccak256(expected370), "'3309' is not returning 'ed19'");    

        bytes memory expected371 = hex"a1e202";
        uint64 value371 = 45345;

        Buffer.buffer memory result371 = Leb128.encodeUnsignedLeb128FromUInt64(value371);

        require(keccak256(result371.buf) == keccak256(expected371), "'45345' is not returning 'a1e202'");    

        bytes memory expected372 = hex"dacd02";
        uint64 value372 = 42714;

        Buffer.buffer memory result372 = Leb128.encodeUnsignedLeb128FromUInt64(value372);

        require(keccak256(result372.buf) == keccak256(expected372), "'42714' is not returning 'dacd02'");    

        bytes memory expected373 = hex"8e9e03";
        uint64 value373 = 53006;

        Buffer.buffer memory result373 = Leb128.encodeUnsignedLeb128FromUInt64(value373);

        require(keccak256(result373.buf) == keccak256(expected373), "'53006' is not returning '8e9e03'");    

        bytes memory expected374 = hex"8520";
        uint64 value374 = 4101;

        Buffer.buffer memory result374 = Leb128.encodeUnsignedLeb128FromUInt64(value374);

        require(keccak256(result374.buf) == keccak256(expected374), "'4101' is not returning '8520'");    

        bytes memory expected375 = hex"c5c001";
        uint64 value375 = 24645;

        Buffer.buffer memory result375 = Leb128.encodeUnsignedLeb128FromUInt64(value375);

        require(keccak256(result375.buf) == keccak256(expected375), "'24645' is not returning 'c5c001'");    

        bytes memory expected376 = hex"db2c";
        uint64 value376 = 5723;

        Buffer.buffer memory result376 = Leb128.encodeUnsignedLeb128FromUInt64(value376);

        require(keccak256(result376.buf) == keccak256(expected376), "'5723' is not returning 'db2c'");    

        bytes memory expected377 = hex"8df302";
        uint64 value377 = 47501;

        Buffer.buffer memory result377 = Leb128.encodeUnsignedLeb128FromUInt64(value377);

        require(keccak256(result377.buf) == keccak256(expected377), "'47501' is not returning '8df302'");    

        bytes memory expected378 = hex"eabd03";
        uint64 value378 = 57066;

        Buffer.buffer memory result378 = Leb128.encodeUnsignedLeb128FromUInt64(value378);

        require(keccak256(result378.buf) == keccak256(expected378), "'57066' is not returning 'eabd03'");    

        bytes memory expected379 = hex"898501";
        uint64 value379 = 17033;

        Buffer.buffer memory result379 = Leb128.encodeUnsignedLeb128FromUInt64(value379);

        require(keccak256(result379.buf) == keccak256(expected379), "'17033' is not returning '898501'");    

        bytes memory expected380 = hex"ca31";
        uint64 value380 = 6346;

        Buffer.buffer memory result380 = Leb128.encodeUnsignedLeb128FromUInt64(value380);

        require(keccak256(result380.buf) == keccak256(expected380), "'6346' is not returning 'ca31'");    

        bytes memory expected381 = hex"9862";
        uint64 value381 = 12568;

        Buffer.buffer memory result381 = Leb128.encodeUnsignedLeb128FromUInt64(value381);

        require(keccak256(result381.buf) == keccak256(expected381), "'12568' is not returning '9862'");    

        bytes memory expected382 = hex"8fe603";
        uint64 value382 = 62223;

        Buffer.buffer memory result382 = Leb128.encodeUnsignedLeb128FromUInt64(value382);

        require(keccak256(result382.buf) == keccak256(expected382), "'62223' is not returning '8fe603'");    

        bytes memory expected383 = hex"94b603";
        uint64 value383 = 56084;

        Buffer.buffer memory result383 = Leb128.encodeUnsignedLeb128FromUInt64(value383);

        require(keccak256(result383.buf) == keccak256(expected383), "'56084' is not returning '94b603'");    

        bytes memory expected384 = hex"c3b603";
        uint64 value384 = 56131;

        Buffer.buffer memory result384 = Leb128.encodeUnsignedLeb128FromUInt64(value384);

        require(keccak256(result384.buf) == keccak256(expected384), "'56131' is not returning 'c3b603'");    

        bytes memory expected385 = hex"91ea01";
        uint64 value385 = 29969;

        Buffer.buffer memory result385 = Leb128.encodeUnsignedLeb128FromUInt64(value385);

        require(keccak256(result385.buf) == keccak256(expected385), "'29969' is not returning '91ea01'");    

        bytes memory expected386 = hex"f1fc01";
        uint64 value386 = 32369;

        Buffer.buffer memory result386 = Leb128.encodeUnsignedLeb128FromUInt64(value386);

        require(keccak256(result386.buf) == keccak256(expected386), "'32369' is not returning 'f1fc01'");    

        bytes memory expected387 = hex"b7e003";
        uint64 value387 = 61495;

        Buffer.buffer memory result387 = Leb128.encodeUnsignedLeb128FromUInt64(value387);

        require(keccak256(result387.buf) == keccak256(expected387), "'61495' is not returning 'b7e003'");    

        bytes memory expected388 = hex"95df02";
        uint64 value388 = 44949;

        Buffer.buffer memory result388 = Leb128.encodeUnsignedLeb128FromUInt64(value388);

        require(keccak256(result388.buf) == keccak256(expected388), "'44949' is not returning '95df02'");    

        bytes memory expected389 = hex"d48603";
        uint64 value389 = 50004;

        Buffer.buffer memory result389 = Leb128.encodeUnsignedLeb128FromUInt64(value389);

        require(keccak256(result389.buf) == keccak256(expected389), "'50004' is not returning 'd48603'");    

        bytes memory expected390 = hex"8448";
        uint64 value390 = 9220;

        Buffer.buffer memory result390 = Leb128.encodeUnsignedLeb128FromUInt64(value390);

        require(keccak256(result390.buf) == keccak256(expected390), "'9220' is not returning '8448'");    

        bytes memory expected391 = hex"9050";
        uint64 value391 = 10256;

        Buffer.buffer memory result391 = Leb128.encodeUnsignedLeb128FromUInt64(value391);

        require(keccak256(result391.buf) == keccak256(expected391), "'10256' is not returning '9050'");    

        bytes memory expected392 = hex"a4e502";
        uint64 value392 = 45732;

        Buffer.buffer memory result392 = Leb128.encodeUnsignedLeb128FromUInt64(value392);

        require(keccak256(result392.buf) == keccak256(expected392), "'45732' is not returning 'a4e502'");    

        bytes memory expected393 = hex"a6d702";
        uint64 value393 = 43942;

        Buffer.buffer memory result393 = Leb128.encodeUnsignedLeb128FromUInt64(value393);

        require(keccak256(result393.buf) == keccak256(expected393), "'43942' is not returning 'a6d702'");    

        bytes memory expected394 = hex"bd0b";
        uint64 value394 = 1469;

        Buffer.buffer memory result394 = Leb128.encodeUnsignedLeb128FromUInt64(value394);

        require(keccak256(result394.buf) == keccak256(expected394), "'1469' is not returning 'bd0b'");    

        bytes memory expected395 = hex"b6e201";
        uint64 value395 = 28982;

        Buffer.buffer memory result395 = Leb128.encodeUnsignedLeb128FromUInt64(value395);

        require(keccak256(result395.buf) == keccak256(expected395), "'28982' is not returning 'b6e201'");    

        bytes memory expected396 = hex"a103";
        uint64 value396 = 417;

        Buffer.buffer memory result396 = Leb128.encodeUnsignedLeb128FromUInt64(value396);

        require(keccak256(result396.buf) == keccak256(expected396), "'417' is not returning 'a103'");    

        bytes memory expected397 = hex"d9c803";
        uint64 value397 = 58457;

        Buffer.buffer memory result397 = Leb128.encodeUnsignedLeb128FromUInt64(value397);

        require(keccak256(result397.buf) == keccak256(expected397), "'58457' is not returning 'd9c803'");    

        bytes memory expected398 = hex"d5a502";
        uint64 value398 = 37589;

        Buffer.buffer memory result398 = Leb128.encodeUnsignedLeb128FromUInt64(value398);

        require(keccak256(result398.buf) == keccak256(expected398), "'37589' is not returning 'd5a502'");    

        bytes memory expected399 = hex"c7e501";
        uint64 value399 = 29383;

        Buffer.buffer memory result399 = Leb128.encodeUnsignedLeb128FromUInt64(value399);

        require(keccak256(result399.buf) == keccak256(expected399), "'29383' is not returning 'c7e501'");    

        bytes memory expected400 = hex"c0a401";
        uint64 value400 = 21056;

        Buffer.buffer memory result400 = Leb128.encodeUnsignedLeb128FromUInt64(value400);

        require(keccak256(result400.buf) == keccak256(expected400), "'21056' is not returning 'c0a401'");    

        bytes memory expected401 = hex"8925";
        uint64 value401 = 4745;

        Buffer.buffer memory result401 = Leb128.encodeUnsignedLeb128FromUInt64(value401);

        require(keccak256(result401.buf) == keccak256(expected401), "'4745' is not returning '8925'");    

        bytes memory expected402 = hex"ba9502";
        uint64 value402 = 35514;

        Buffer.buffer memory result402 = Leb128.encodeUnsignedLeb128FromUInt64(value402);

        require(keccak256(result402.buf) == keccak256(expected402), "'35514' is not returning 'ba9502'");    

        bytes memory expected403 = hex"9ef103";
        uint64 value403 = 63646;

        Buffer.buffer memory result403 = Leb128.encodeUnsignedLeb128FromUInt64(value403);

        require(keccak256(result403.buf) == keccak256(expected403), "'63646' is not returning '9ef103'");    

        bytes memory expected404 = hex"9a16";
        uint64 value404 = 2842;

        Buffer.buffer memory result404 = Leb128.encodeUnsignedLeb128FromUInt64(value404);

        require(keccak256(result404.buf) == keccak256(expected404), "'2842' is not returning '9a16'");    

        bytes memory expected405 = hex"e2aa01";
        uint64 value405 = 21858;

        Buffer.buffer memory result405 = Leb128.encodeUnsignedLeb128FromUInt64(value405);

        require(keccak256(result405.buf) == keccak256(expected405), "'21858' is not returning 'e2aa01'");    

        bytes memory expected406 = hex"c4bb02";
        uint64 value406 = 40388;

        Buffer.buffer memory result406 = Leb128.encodeUnsignedLeb128FromUInt64(value406);

        require(keccak256(result406.buf) == keccak256(expected406), "'40388' is not returning 'c4bb02'");    

        bytes memory expected407 = hex"f8ec01";
        uint64 value407 = 30328;

        Buffer.buffer memory result407 = Leb128.encodeUnsignedLeb128FromUInt64(value407);

        require(keccak256(result407.buf) == keccak256(expected407), "'30328' is not returning 'f8ec01'");    

        bytes memory expected408 = hex"8fb802";
        uint64 value408 = 39951;

        Buffer.buffer memory result408 = Leb128.encodeUnsignedLeb128FromUInt64(value408);

        require(keccak256(result408.buf) == keccak256(expected408), "'39951' is not returning '8fb802'");    

        bytes memory expected409 = hex"bdbb01";
        uint64 value409 = 23997;

        Buffer.buffer memory result409 = Leb128.encodeUnsignedLeb128FromUInt64(value409);

        require(keccak256(result409.buf) == keccak256(expected409), "'23997' is not returning 'bdbb01'");    

        bytes memory expected410 = hex"e2eb03";
        uint64 value410 = 62946;

        Buffer.buffer memory result410 = Leb128.encodeUnsignedLeb128FromUInt64(value410);

        require(keccak256(result410.buf) == keccak256(expected410), "'62946' is not returning 'e2eb03'");    

        bytes memory expected411 = hex"c29602";
        uint64 value411 = 35650;

        Buffer.buffer memory result411 = Leb128.encodeUnsignedLeb128FromUInt64(value411);

        require(keccak256(result411.buf) == keccak256(expected411), "'35650' is not returning 'c29602'");    

        bytes memory expected412 = hex"ae44";
        uint64 value412 = 8750;

        Buffer.buffer memory result412 = Leb128.encodeUnsignedLeb128FromUInt64(value412);

        require(keccak256(result412.buf) == keccak256(expected412), "'8750' is not returning 'ae44'");    

        bytes memory expected413 = hex"81ea02";
        uint64 value413 = 46337;

        Buffer.buffer memory result413 = Leb128.encodeUnsignedLeb128FromUInt64(value413);

        require(keccak256(result413.buf) == keccak256(expected413), "'46337' is not returning '81ea02'");    

        bytes memory expected414 = hex"81ae01";
        uint64 value414 = 22273;

        Buffer.buffer memory result414 = Leb128.encodeUnsignedLeb128FromUInt64(value414);

        require(keccak256(result414.buf) == keccak256(expected414), "'22273' is not returning '81ae01'");    

        bytes memory expected415 = hex"8ca303";
        uint64 value415 = 53644;

        Buffer.buffer memory result415 = Leb128.encodeUnsignedLeb128FromUInt64(value415);

        require(keccak256(result415.buf) == keccak256(expected415), "'53644' is not returning '8ca303'");    

        bytes memory expected416 = hex"c65b";
        uint64 value416 = 11718;

        Buffer.buffer memory result416 = Leb128.encodeUnsignedLeb128FromUInt64(value416);

        require(keccak256(result416.buf) == keccak256(expected416), "'11718' is not returning 'c65b'");    

        bytes memory expected417 = hex"ea18";
        uint64 value417 = 3178;

        Buffer.buffer memory result417 = Leb128.encodeUnsignedLeb128FromUInt64(value417);

        require(keccak256(result417.buf) == keccak256(expected417), "'3178' is not returning 'ea18'");    

        bytes memory expected418 = hex"8a8702";
        uint64 value418 = 33674;

        Buffer.buffer memory result418 = Leb128.encodeUnsignedLeb128FromUInt64(value418);

        require(keccak256(result418.buf) == keccak256(expected418), "'33674' is not returning '8a8702'");    

        bytes memory expected419 = hex"dcef01";
        uint64 value419 = 30684;

        Buffer.buffer memory result419 = Leb128.encodeUnsignedLeb128FromUInt64(value419);

        require(keccak256(result419.buf) == keccak256(expected419), "'30684' is not returning 'dcef01'");    

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

    }
}
