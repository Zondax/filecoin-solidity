
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
contract Leb128Generated3Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {

        bytes memory expected172 = hex"b201";
        uint64 value172 = 178;

        Buffer.buffer memory result172 = Leb128.encodeUnsignedLeb128FromUInt64(value172);

        require(keccak256(result172.buf) == keccak256(expected172), "'178' is not returning 'b201'");    

        bytes memory expected173 = hex"bd01";
        uint64 value173 = 189;

        Buffer.buffer memory result173 = Leb128.encodeUnsignedLeb128FromUInt64(value173);

        require(keccak256(result173.buf) == keccak256(expected173), "'189' is not returning 'bd01'");    

        bytes memory expected174 = hex"af01";
        uint64 value174 = 175;

        Buffer.buffer memory result174 = Leb128.encodeUnsignedLeb128FromUInt64(value174);

        require(keccak256(result174.buf) == keccak256(expected174), "'175' is not returning 'af01'");    

        bytes memory expected175 = hex"a101";
        uint64 value175 = 161;

        Buffer.buffer memory result175 = Leb128.encodeUnsignedLeb128FromUInt64(value175);

        require(keccak256(result175.buf) == keccak256(expected175), "'161' is not returning 'a101'");    

        bytes memory expected176 = hex"ff01";
        uint64 value176 = 255;

        Buffer.buffer memory result176 = Leb128.encodeUnsignedLeb128FromUInt64(value176);

        require(keccak256(result176.buf) == keccak256(expected176), "'255' is not returning 'ff01'");    

        bytes memory expected177 = hex"6d";
        uint64 value177 = 109;

        Buffer.buffer memory result177 = Leb128.encodeUnsignedLeb128FromUInt64(value177);

        require(keccak256(result177.buf) == keccak256(expected177), "'109' is not returning '6d'");    

        bytes memory expected178 = hex"0a";
        uint64 value178 = 10;

        Buffer.buffer memory result178 = Leb128.encodeUnsignedLeb128FromUInt64(value178);

        require(keccak256(result178.buf) == keccak256(expected178), "'10' is not returning '0a'");    

        bytes memory expected179 = hex"08";
        uint64 value179 = 8;

        Buffer.buffer memory result179 = Leb128.encodeUnsignedLeb128FromUInt64(value179);

        require(keccak256(result179.buf) == keccak256(expected179), "'8' is not returning '08'");    

        bytes memory expected180 = hex"4a";
        uint64 value180 = 74;

        Buffer.buffer memory result180 = Leb128.encodeUnsignedLeb128FromUInt64(value180);

        require(keccak256(result180.buf) == keccak256(expected180), "'74' is not returning '4a'");    

        bytes memory expected181 = hex"b701";
        uint64 value181 = 183;

        Buffer.buffer memory result181 = Leb128.encodeUnsignedLeb128FromUInt64(value181);

        require(keccak256(result181.buf) == keccak256(expected181), "'183' is not returning 'b701'");    

        bytes memory expected182 = hex"e801";
        uint64 value182 = 232;

        Buffer.buffer memory result182 = Leb128.encodeUnsignedLeb128FromUInt64(value182);

        require(keccak256(result182.buf) == keccak256(expected182), "'232' is not returning 'e801'");    

        bytes memory expected183 = hex"bd01";
        uint64 value183 = 189;

        Buffer.buffer memory result183 = Leb128.encodeUnsignedLeb128FromUInt64(value183);

        require(keccak256(result183.buf) == keccak256(expected183), "'189' is not returning 'bd01'");    

        bytes memory expected184 = hex"c801";
        uint64 value184 = 200;

        Buffer.buffer memory result184 = Leb128.encodeUnsignedLeb128FromUInt64(value184);

        require(keccak256(result184.buf) == keccak256(expected184), "'200' is not returning 'c801'");    

        bytes memory expected185 = hex"36";
        uint64 value185 = 54;

        Buffer.buffer memory result185 = Leb128.encodeUnsignedLeb128FromUInt64(value185);

        require(keccak256(result185.buf) == keccak256(expected185), "'54' is not returning '36'");    

        bytes memory expected186 = hex"33";
        uint64 value186 = 51;

        Buffer.buffer memory result186 = Leb128.encodeUnsignedLeb128FromUInt64(value186);

        require(keccak256(result186.buf) == keccak256(expected186), "'51' is not returning '33'");    

        bytes memory expected187 = hex"8801";
        uint64 value187 = 136;

        Buffer.buffer memory result187 = Leb128.encodeUnsignedLeb128FromUInt64(value187);

        require(keccak256(result187.buf) == keccak256(expected187), "'136' is not returning '8801'");    

        bytes memory expected188 = hex"9801";
        uint64 value188 = 152;

        Buffer.buffer memory result188 = Leb128.encodeUnsignedLeb128FromUInt64(value188);

        require(keccak256(result188.buf) == keccak256(expected188), "'152' is not returning '9801'");    

        bytes memory expected189 = hex"f301";
        uint64 value189 = 243;

        Buffer.buffer memory result189 = Leb128.encodeUnsignedLeb128FromUInt64(value189);

        require(keccak256(result189.buf) == keccak256(expected189), "'243' is not returning 'f301'");    

        bytes memory expected190 = hex"26";
        uint64 value190 = 38;

        Buffer.buffer memory result190 = Leb128.encodeUnsignedLeb128FromUInt64(value190);

        require(keccak256(result190.buf) == keccak256(expected190), "'38' is not returning '26'");    

        bytes memory expected191 = hex"de01";
        uint64 value191 = 222;

        Buffer.buffer memory result191 = Leb128.encodeUnsignedLeb128FromUInt64(value191);

        require(keccak256(result191.buf) == keccak256(expected191), "'222' is not returning 'de01'");    

        bytes memory expected192 = hex"c301";
        uint64 value192 = 195;

        Buffer.buffer memory result192 = Leb128.encodeUnsignedLeb128FromUInt64(value192);

        require(keccak256(result192.buf) == keccak256(expected192), "'195' is not returning 'c301'");    

        bytes memory expected193 = hex"0b";
        uint64 value193 = 11;

        Buffer.buffer memory result193 = Leb128.encodeUnsignedLeb128FromUInt64(value193);

        require(keccak256(result193.buf) == keccak256(expected193), "'11' is not returning '0b'");    

        bytes memory expected194 = hex"c701";
        uint64 value194 = 199;

        Buffer.buffer memory result194 = Leb128.encodeUnsignedLeb128FromUInt64(value194);

        require(keccak256(result194.buf) == keccak256(expected194), "'199' is not returning 'c701'");    

        bytes memory expected195 = hex"dc01";
        uint64 value195 = 220;

        Buffer.buffer memory result195 = Leb128.encodeUnsignedLeb128FromUInt64(value195);

        require(keccak256(result195.buf) == keccak256(expected195), "'220' is not returning 'dc01'");    

        bytes memory expected196 = hex"5b";
        uint64 value196 = 91;

        Buffer.buffer memory result196 = Leb128.encodeUnsignedLeb128FromUInt64(value196);

        require(keccak256(result196.buf) == keccak256(expected196), "'91' is not returning '5b'");    

        bytes memory expected197 = hex"60";
        uint64 value197 = 96;

        Buffer.buffer memory result197 = Leb128.encodeUnsignedLeb128FromUInt64(value197);

        require(keccak256(result197.buf) == keccak256(expected197), "'96' is not returning '60'");    

        bytes memory expected198 = hex"9e01";
        uint64 value198 = 158;

        Buffer.buffer memory result198 = Leb128.encodeUnsignedLeb128FromUInt64(value198);

        require(keccak256(result198.buf) == keccak256(expected198), "'158' is not returning '9e01'");    

        bytes memory expected199 = hex"f601";
        uint64 value199 = 246;

        Buffer.buffer memory result199 = Leb128.encodeUnsignedLeb128FromUInt64(value199);

        require(keccak256(result199.buf) == keccak256(expected199), "'246' is not returning 'f601'");    

        bytes memory expected200 = hex"0e";
        uint64 value200 = 14;

        Buffer.buffer memory result200 = Leb128.encodeUnsignedLeb128FromUInt64(value200);

        require(keccak256(result200.buf) == keccak256(expected200), "'14' is not returning '0e'");    

        bytes memory expected201 = hex"b201";
        uint64 value201 = 178;

        Buffer.buffer memory result201 = Leb128.encodeUnsignedLeb128FromUInt64(value201);

        require(keccak256(result201.buf) == keccak256(expected201), "'178' is not returning 'b201'");    

        bytes memory expected202 = hex"78";
        uint64 value202 = 120;

        Buffer.buffer memory result202 = Leb128.encodeUnsignedLeb128FromUInt64(value202);

        require(keccak256(result202.buf) == keccak256(expected202), "'120' is not returning '78'");    

        bytes memory expected203 = hex"f201";
        uint64 value203 = 242;

        Buffer.buffer memory result203 = Leb128.encodeUnsignedLeb128FromUInt64(value203);

        require(keccak256(result203.buf) == keccak256(expected203), "'242' is not returning 'f201'");    

        bytes memory expected204 = hex"30";
        uint64 value204 = 48;

        Buffer.buffer memory result204 = Leb128.encodeUnsignedLeb128FromUInt64(value204);

        require(keccak256(result204.buf) == keccak256(expected204), "'48' is not returning '30'");    

        bytes memory expected205 = hex"bd01";
        uint64 value205 = 189;

        Buffer.buffer memory result205 = Leb128.encodeUnsignedLeb128FromUInt64(value205);

        require(keccak256(result205.buf) == keccak256(expected205), "'189' is not returning 'bd01'");    

        bytes memory expected206 = hex"79";
        uint64 value206 = 121;

        Buffer.buffer memory result206 = Leb128.encodeUnsignedLeb128FromUInt64(value206);

        require(keccak256(result206.buf) == keccak256(expected206), "'121' is not returning '79'");    

        bytes memory expected207 = hex"d701";
        uint64 value207 = 215;

        Buffer.buffer memory result207 = Leb128.encodeUnsignedLeb128FromUInt64(value207);

        require(keccak256(result207.buf) == keccak256(expected207), "'215' is not returning 'd701'");    

        bytes memory expected208 = hex"7c";
        uint64 value208 = 124;

        Buffer.buffer memory result208 = Leb128.encodeUnsignedLeb128FromUInt64(value208);

        require(keccak256(result208.buf) == keccak256(expected208), "'124' is not returning '7c'");    

        bytes memory expected209 = hex"c501";
        uint64 value209 = 197;

        Buffer.buffer memory result209 = Leb128.encodeUnsignedLeb128FromUInt64(value209);

        require(keccak256(result209.buf) == keccak256(expected209), "'197' is not returning 'c501'");    

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

    }
}
