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
contract Leb128Generated4Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {
        bytes memory expected210 = hex"c101";
        uint64 value210 = 193;

        Buffer.buffer memory result210 = Leb128.encodeUnsignedLeb128FromUInt64(value210);

        require(keccak256(result210.buf) == keccak256(expected210), "'193' is not returning 'c101'");

        bytes memory expected211 = hex"08";
        uint64 value211 = 8;

        Buffer.buffer memory result211 = Leb128.encodeUnsignedLeb128FromUInt64(value211);

        require(keccak256(result211.buf) == keccak256(expected211), "'8' is not returning '08'");

        bytes memory expected212 = hex"e701";
        uint64 value212 = 231;

        Buffer.buffer memory result212 = Leb128.encodeUnsignedLeb128FromUInt64(value212);

        require(keccak256(result212.buf) == keccak256(expected212), "'231' is not returning 'e701'");

        bytes memory expected213 = hex"8701";
        uint64 value213 = 135;

        Buffer.buffer memory result213 = Leb128.encodeUnsignedLeb128FromUInt64(value213);

        require(keccak256(result213.buf) == keccak256(expected213), "'135' is not returning '8701'");

        bytes memory expected214 = hex"20";
        uint64 value214 = 32;

        Buffer.buffer memory result214 = Leb128.encodeUnsignedLeb128FromUInt64(value214);

        require(keccak256(result214.buf) == keccak256(expected214), "'32' is not returning '20'");

        bytes memory expected215 = hex"66";
        uint64 value215 = 102;

        Buffer.buffer memory result215 = Leb128.encodeUnsignedLeb128FromUInt64(value215);

        require(keccak256(result215.buf) == keccak256(expected215), "'102' is not returning '66'");

        bytes memory expected216 = hex"08";
        uint64 value216 = 8;

        Buffer.buffer memory result216 = Leb128.encodeUnsignedLeb128FromUInt64(value216);

        require(keccak256(result216.buf) == keccak256(expected216), "'8' is not returning '08'");

        bytes memory expected217 = hex"10";
        uint64 value217 = 16;

        Buffer.buffer memory result217 = Leb128.encodeUnsignedLeb128FromUInt64(value217);

        require(keccak256(result217.buf) == keccak256(expected217), "'16' is not returning '10'");

        bytes memory expected218 = hex"dd01";
        uint64 value218 = 221;

        Buffer.buffer memory result218 = Leb128.encodeUnsignedLeb128FromUInt64(value218);

        require(keccak256(result218.buf) == keccak256(expected218), "'221' is not returning 'dd01'");

        bytes memory expected219 = hex"64";
        uint64 value219 = 100;

        Buffer.buffer memory result219 = Leb128.encodeUnsignedLeb128FromUInt64(value219);

        require(keccak256(result219.buf) == keccak256(expected219), "'100' is not returning '64'");

        bytes memory expected220 = hex"8c01";
        uint64 value220 = 140;

        Buffer.buffer memory result220 = Leb128.encodeUnsignedLeb128FromUInt64(value220);

        require(keccak256(result220.buf) == keccak256(expected220), "'140' is not returning '8c01'");

        bytes memory expected221 = hex"62";
        uint64 value221 = 98;

        Buffer.buffer memory result221 = Leb128.encodeUnsignedLeb128FromUInt64(value221);

        require(keccak256(result221.buf) == keccak256(expected221), "'98' is not returning '62'");

        bytes memory expected222 = hex"42";
        uint64 value222 = 66;

        Buffer.buffer memory result222 = Leb128.encodeUnsignedLeb128FromUInt64(value222);

        require(keccak256(result222.buf) == keccak256(expected222), "'66' is not returning '42'");

        bytes memory expected223 = hex"9f01";
        uint64 value223 = 159;

        Buffer.buffer memory result223 = Leb128.encodeUnsignedLeb128FromUInt64(value223);

        require(keccak256(result223.buf) == keccak256(expected223), "'159' is not returning '9f01'");

        bytes memory expected224 = hex"06";
        uint64 value224 = 6;

        Buffer.buffer memory result224 = Leb128.encodeUnsignedLeb128FromUInt64(value224);

        require(keccak256(result224.buf) == keccak256(expected224), "'6' is not returning '06'");

        bytes memory expected225 = hex"bf01";
        uint64 value225 = 191;

        Buffer.buffer memory result225 = Leb128.encodeUnsignedLeb128FromUInt64(value225);

        require(keccak256(result225.buf) == keccak256(expected225), "'191' is not returning 'bf01'");

        bytes memory expected226 = hex"ff01";
        uint64 value226 = 255;

        Buffer.buffer memory result226 = Leb128.encodeUnsignedLeb128FromUInt64(value226);

        require(keccak256(result226.buf) == keccak256(expected226), "'255' is not returning 'ff01'");

        bytes memory expected227 = hex"d001";
        uint64 value227 = 208;

        Buffer.buffer memory result227 = Leb128.encodeUnsignedLeb128FromUInt64(value227);

        require(keccak256(result227.buf) == keccak256(expected227), "'208' is not returning 'd001'");

        bytes memory expected228 = hex"8401";
        uint64 value228 = 132;

        Buffer.buffer memory result228 = Leb128.encodeUnsignedLeb128FromUInt64(value228);

        require(keccak256(result228.buf) == keccak256(expected228), "'132' is not returning '8401'");

        bytes memory expected229 = hex"d701";
        uint64 value229 = 215;

        Buffer.buffer memory result229 = Leb128.encodeUnsignedLeb128FromUInt64(value229);

        require(keccak256(result229.buf) == keccak256(expected229), "'215' is not returning 'd701'");

        bytes memory expected230 = hex"da01";
        uint64 value230 = 218;

        Buffer.buffer memory result230 = Leb128.encodeUnsignedLeb128FromUInt64(value230);

        require(keccak256(result230.buf) == keccak256(expected230), "'218' is not returning 'da01'");

        bytes memory expected231 = hex"48";
        uint64 value231 = 72;

        Buffer.buffer memory result231 = Leb128.encodeUnsignedLeb128FromUInt64(value231);

        require(keccak256(result231.buf) == keccak256(expected231), "'72' is not returning '48'");

        bytes memory expected232 = hex"17";
        uint64 value232 = 23;

        Buffer.buffer memory result232 = Leb128.encodeUnsignedLeb128FromUInt64(value232);

        require(keccak256(result232.buf) == keccak256(expected232), "'23' is not returning '17'");

        bytes memory expected233 = hex"12";
        uint64 value233 = 18;

        Buffer.buffer memory result233 = Leb128.encodeUnsignedLeb128FromUInt64(value233);

        require(keccak256(result233.buf) == keccak256(expected233), "'18' is not returning '12'");

        bytes memory expected234 = hex"9201";
        uint64 value234 = 146;

        Buffer.buffer memory result234 = Leb128.encodeUnsignedLeb128FromUInt64(value234);

        require(keccak256(result234.buf) == keccak256(expected234), "'146' is not returning '9201'");

        bytes memory expected235 = hex"76";
        uint64 value235 = 118;

        Buffer.buffer memory result235 = Leb128.encodeUnsignedLeb128FromUInt64(value235);

        require(keccak256(result235.buf) == keccak256(expected235), "'118' is not returning '76'");

        bytes memory expected236 = hex"71";
        uint64 value236 = 113;

        Buffer.buffer memory result236 = Leb128.encodeUnsignedLeb128FromUInt64(value236);

        require(keccak256(result236.buf) == keccak256(expected236), "'113' is not returning '71'");

        bytes memory expected237 = hex"4c";
        uint64 value237 = 76;

        Buffer.buffer memory result237 = Leb128.encodeUnsignedLeb128FromUInt64(value237);

        require(keccak256(result237.buf) == keccak256(expected237), "'76' is not returning '4c'");

        bytes memory expected238 = hex"cf01";
        uint64 value238 = 207;

        Buffer.buffer memory result238 = Leb128.encodeUnsignedLeb128FromUInt64(value238);

        require(keccak256(result238.buf) == keccak256(expected238), "'207' is not returning 'cf01'");

        bytes memory expected239 = hex"9101";
        uint64 value239 = 145;

        Buffer.buffer memory result239 = Leb128.encodeUnsignedLeb128FromUInt64(value239);

        require(keccak256(result239.buf) == keccak256(expected239), "'145' is not returning '9101'");

        bytes memory expected240 = hex"2f";
        uint64 value240 = 47;

        Buffer.buffer memory result240 = Leb128.encodeUnsignedLeb128FromUInt64(value240);

        require(keccak256(result240.buf) == keccak256(expected240), "'47' is not returning '2f'");

        bytes memory expected241 = hex"23";
        uint64 value241 = 35;

        Buffer.buffer memory result241 = Leb128.encodeUnsignedLeb128FromUInt64(value241);

        require(keccak256(result241.buf) == keccak256(expected241), "'35' is not returning '23'");

        bytes memory expected242 = hex"a401";
        uint64 value242 = 164;

        Buffer.buffer memory result242 = Leb128.encodeUnsignedLeb128FromUInt64(value242);

        require(keccak256(result242.buf) == keccak256(expected242), "'164' is not returning 'a401'");

        bytes memory expected243 = hex"72";
        uint64 value243 = 114;

        Buffer.buffer memory result243 = Leb128.encodeUnsignedLeb128FromUInt64(value243);

        require(keccak256(result243.buf) == keccak256(expected243), "'114' is not returning '72'");

        bytes memory expected244 = hex"f301";
        uint64 value244 = 243;

        Buffer.buffer memory result244 = Leb128.encodeUnsignedLeb128FromUInt64(value244);

        require(keccak256(result244.buf) == keccak256(expected244), "'243' is not returning 'f301'");

        bytes memory expected245 = hex"3f";
        uint64 value245 = 63;

        Buffer.buffer memory result245 = Leb128.encodeUnsignedLeb128FromUInt64(value245);

        require(keccak256(result245.buf) == keccak256(expected245), "'63' is not returning '3f'");

        bytes memory expected246 = hex"f101";
        uint64 value246 = 241;

        Buffer.buffer memory result246 = Leb128.encodeUnsignedLeb128FromUInt64(value246);

        require(keccak256(result246.buf) == keccak256(expected246), "'241' is not returning 'f101'");

        bytes memory expected247 = hex"dd01";
        uint64 value247 = 221;

        Buffer.buffer memory result247 = Leb128.encodeUnsignedLeb128FromUInt64(value247);

        require(keccak256(result247.buf) == keccak256(expected247), "'221' is not returning 'dd01'");

        bytes memory expected248 = hex"0e";
        uint64 value248 = 14;

        Buffer.buffer memory result248 = Leb128.encodeUnsignedLeb128FromUInt64(value248);

        require(keccak256(result248.buf) == keccak256(expected248), "'14' is not returning '0e'");

        bytes memory expected249 = hex"51";
        uint64 value249 = 81;

        Buffer.buffer memory result249 = Leb128.encodeUnsignedLeb128FromUInt64(value249);

        require(keccak256(result249.buf) == keccak256(expected249), "'81' is not returning '51'");

        bytes memory expected250 = hex"9b01";
        uint64 value250 = 155;

        Buffer.buffer memory result250 = Leb128.encodeUnsignedLeb128FromUInt64(value250);

        require(keccak256(result250.buf) == keccak256(expected250), "'155' is not returning '9b01'");

        bytes memory expected251 = hex"79";
        uint64 value251 = 121;

        Buffer.buffer memory result251 = Leb128.encodeUnsignedLeb128FromUInt64(value251);

        require(keccak256(result251.buf) == keccak256(expected251), "'121' is not returning '79'");

        bytes memory expected252 = hex"9d01";
        uint64 value252 = 157;

        Buffer.buffer memory result252 = Leb128.encodeUnsignedLeb128FromUInt64(value252);

        require(keccak256(result252.buf) == keccak256(expected252), "'157' is not returning '9d01'");

        bytes memory expected253 = hex"77";
        uint64 value253 = 119;

        Buffer.buffer memory result253 = Leb128.encodeUnsignedLeb128FromUInt64(value253);

        require(keccak256(result253.buf) == keccak256(expected253), "'119' is not returning '77'");

        bytes memory expected254 = hex"da01";
        uint64 value254 = 218;

        Buffer.buffer memory result254 = Leb128.encodeUnsignedLeb128FromUInt64(value254);

        require(keccak256(result254.buf) == keccak256(expected254), "'218' is not returning 'da01'");

        bytes memory expected255 = hex"3f";
        uint64 value255 = 63;

        Buffer.buffer memory result255 = Leb128.encodeUnsignedLeb128FromUInt64(value255);

        require(keccak256(result255.buf) == keccak256(expected255), "'63' is not returning '3f'");

        bytes memory expected256 = hex"ea9001";
        uint64 value256 = 18538;

        Buffer.buffer memory result256 = Leb128.encodeUnsignedLeb128FromUInt64(value256);

        require(keccak256(result256.buf) == keccak256(expected256), "'18538' is not returning 'ea9001'");

        bytes memory expected257 = hex"835e";
        uint64 value257 = 12035;

        Buffer.buffer memory result257 = Leb128.encodeUnsignedLeb128FromUInt64(value257);

        require(keccak256(result257.buf) == keccak256(expected257), "'12035' is not returning '835e'");

        bytes memory expected258 = hex"b9b701";
        uint64 value258 = 23481;

        Buffer.buffer memory result258 = Leb128.encodeUnsignedLeb128FromUInt64(value258);

        require(keccak256(result258.buf) == keccak256(expected258), "'23481' is not returning 'b9b701'");

        bytes memory expected259 = hex"b4b303";
        uint64 value259 = 55732;

        Buffer.buffer memory result259 = Leb128.encodeUnsignedLeb128FromUInt64(value259);

        require(keccak256(result259.buf) == keccak256(expected259), "'55732' is not returning 'b4b303'");

        bytes memory expected260 = hex"cea602";
        uint64 value260 = 37710;

        Buffer.buffer memory result260 = Leb128.encodeUnsignedLeb128FromUInt64(value260);

        require(keccak256(result260.buf) == keccak256(expected260), "'37710' is not returning 'cea602'");

        bytes memory expected261 = hex"c79f02";
        uint64 value261 = 36807;

        Buffer.buffer memory result261 = Leb128.encodeUnsignedLeb128FromUInt64(value261);

        require(keccak256(result261.buf) == keccak256(expected261), "'36807' is not returning 'c79f02'");

        bytes memory expected262 = hex"9ad702";
        uint64 value262 = 43930;

        Buffer.buffer memory result262 = Leb128.encodeUnsignedLeb128FromUInt64(value262);

        require(keccak256(result262.buf) == keccak256(expected262), "'43930' is not returning '9ad702'");

        bytes memory expected263 = hex"d69b01";
        uint64 value263 = 19926;

        Buffer.buffer memory result263 = Leb128.encodeUnsignedLeb128FromUInt64(value263);

        require(keccak256(result263.buf) == keccak256(expected263), "'19926' is not returning 'd69b01'");

        bytes memory expected264 = hex"bd8801";
        uint64 value264 = 17469;

        Buffer.buffer memory result264 = Leb128.encodeUnsignedLeb128FromUInt64(value264);

        require(keccak256(result264.buf) == keccak256(expected264), "'17469' is not returning 'bd8801'");

        bytes memory expected265 = hex"b66e";
        uint64 value265 = 14134;

        Buffer.buffer memory result265 = Leb128.encodeUnsignedLeb128FromUInt64(value265);

        require(keccak256(result265.buf) == keccak256(expected265), "'14134' is not returning 'b66e'");

        bytes memory expected266 = hex"ff49";
        uint64 value266 = 9471;

        Buffer.buffer memory result266 = Leb128.encodeUnsignedLeb128FromUInt64(value266);

        require(keccak256(result266.buf) == keccak256(expected266), "'9471' is not returning 'ff49'");

        bytes memory expected267 = hex"bfe301";
        uint64 value267 = 29119;

        Buffer.buffer memory result267 = Leb128.encodeUnsignedLeb128FromUInt64(value267);

        require(keccak256(result267.buf) == keccak256(expected267), "'29119' is not returning 'bfe301'");

        bytes memory expected268 = hex"cd0e";
        uint64 value268 = 1869;

        Buffer.buffer memory result268 = Leb128.encodeUnsignedLeb128FromUInt64(value268);

        require(keccak256(result268.buf) == keccak256(expected268), "'1869' is not returning 'cd0e'");

        bytes memory expected269 = hex"e85e";
        uint64 value269 = 12136;

        Buffer.buffer memory result269 = Leb128.encodeUnsignedLeb128FromUInt64(value269);

        require(keccak256(result269.buf) == keccak256(expected269), "'12136' is not returning 'e85e'");

        bytes memory expected270 = hex"b8ab02";
        uint64 value270 = 38328;

        Buffer.buffer memory result270 = Leb128.encodeUnsignedLeb128FromUInt64(value270);

        require(keccak256(result270.buf) == keccak256(expected270), "'38328' is not returning 'b8ab02'");

        bytes memory expected271 = hex"c043";
        uint64 value271 = 8640;

        Buffer.buffer memory result271 = Leb128.encodeUnsignedLeb128FromUInt64(value271);

        require(keccak256(result271.buf) == keccak256(expected271), "'8640' is not returning 'c043'");

        bytes memory expected272 = hex"c6ee02";
        uint64 value272 = 46918;

        Buffer.buffer memory result272 = Leb128.encodeUnsignedLeb128FromUInt64(value272);

        require(keccak256(result272.buf) == keccak256(expected272), "'46918' is not returning 'c6ee02'");

        bytes memory expected273 = hex"c3b403";
        uint64 value273 = 55875;

        Buffer.buffer memory result273 = Leb128.encodeUnsignedLeb128FromUInt64(value273);

        require(keccak256(result273.buf) == keccak256(expected273), "'55875' is not returning 'c3b403'");

        bytes memory expected274 = hex"9e05";
        uint64 value274 = 670;

        Buffer.buffer memory result274 = Leb128.encodeUnsignedLeb128FromUInt64(value274);

        require(keccak256(result274.buf) == keccak256(expected274), "'670' is not returning '9e05'");

        bytes memory expected275 = hex"d4d603";
        uint64 value275 = 60244;

        Buffer.buffer memory result275 = Leb128.encodeUnsignedLeb128FromUInt64(value275);

        require(keccak256(result275.buf) == keccak256(expected275), "'60244' is not returning 'd4d603'");

        bytes memory expected276 = hex"a4d801";
        uint64 value276 = 27684;

        Buffer.buffer memory result276 = Leb128.encodeUnsignedLeb128FromUInt64(value276);

        require(keccak256(result276.buf) == keccak256(expected276), "'27684' is not returning 'a4d801'");

        bytes memory expected277 = hex"d69803";
        uint64 value277 = 52310;

        Buffer.buffer memory result277 = Leb128.encodeUnsignedLeb128FromUInt64(value277);

        require(keccak256(result277.buf) == keccak256(expected277), "'52310' is not returning 'd69803'");

        bytes memory expected278 = hex"fc8d03";
        uint64 value278 = 50940;

        Buffer.buffer memory result278 = Leb128.encodeUnsignedLeb128FromUInt64(value278);

        require(keccak256(result278.buf) == keccak256(expected278), "'50940' is not returning 'fc8d03'");
    }
}
