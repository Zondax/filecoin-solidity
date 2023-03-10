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
contract Leb128Generated3Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {
        bytes memory expected140 = hex"43";
        uint64 value140 = 67;

        Buffer.buffer memory result140 = Leb128.encodeUnsignedLeb128FromUInt64(value140);

        require(keccak256(result140.buf) == keccak256(expected140), "'67' is not returning '43'");

        bytes memory expected141 = hex"5b";
        uint64 value141 = 91;

        Buffer.buffer memory result141 = Leb128.encodeUnsignedLeb128FromUInt64(value141);

        require(keccak256(result141.buf) == keccak256(expected141), "'91' is not returning '5b'");

        bytes memory expected142 = hex"28";
        uint64 value142 = 40;

        Buffer.buffer memory result142 = Leb128.encodeUnsignedLeb128FromUInt64(value142);

        require(keccak256(result142.buf) == keccak256(expected142), "'40' is not returning '28'");

        bytes memory expected143 = hex"20";
        uint64 value143 = 32;

        Buffer.buffer memory result143 = Leb128.encodeUnsignedLeb128FromUInt64(value143);

        require(keccak256(result143.buf) == keccak256(expected143), "'32' is not returning '20'");

        bytes memory expected144 = hex"4d";
        uint64 value144 = 77;

        Buffer.buffer memory result144 = Leb128.encodeUnsignedLeb128FromUInt64(value144);

        require(keccak256(result144.buf) == keccak256(expected144), "'77' is not returning '4d'");

        bytes memory expected145 = hex"5a";
        uint64 value145 = 90;

        Buffer.buffer memory result145 = Leb128.encodeUnsignedLeb128FromUInt64(value145);

        require(keccak256(result145.buf) == keccak256(expected145), "'90' is not returning '5a'");

        bytes memory expected146 = hex"2d";
        uint64 value146 = 45;

        Buffer.buffer memory result146 = Leb128.encodeUnsignedLeb128FromUInt64(value146);

        require(keccak256(result146.buf) == keccak256(expected146), "'45' is not returning '2d'");

        bytes memory expected147 = hex"33";
        uint64 value147 = 51;

        Buffer.buffer memory result147 = Leb128.encodeUnsignedLeb128FromUInt64(value147);

        require(keccak256(result147.buf) == keccak256(expected147), "'51' is not returning '33'");

        bytes memory expected148 = hex"2e";
        uint64 value148 = 46;

        Buffer.buffer memory result148 = Leb128.encodeUnsignedLeb128FromUInt64(value148);

        require(keccak256(result148.buf) == keccak256(expected148), "'46' is not returning '2e'");

        bytes memory expected149 = hex"0a";
        uint64 value149 = 10;

        Buffer.buffer memory result149 = Leb128.encodeUnsignedLeb128FromUInt64(value149);

        require(keccak256(result149.buf) == keccak256(expected149), "'10' is not returning '0a'");

        bytes memory expected150 = hex"9901";
        uint64 value150 = 153;

        Buffer.buffer memory result150 = Leb128.encodeUnsignedLeb128FromUInt64(value150);

        require(keccak256(result150.buf) == keccak256(expected150), "'153' is not returning '9901'");

        bytes memory expected151 = hex"ea01";
        uint64 value151 = 234;

        Buffer.buffer memory result151 = Leb128.encodeUnsignedLeb128FromUInt64(value151);

        require(keccak256(result151.buf) == keccak256(expected151), "'234' is not returning 'ea01'");

        bytes memory expected152 = hex"47";
        uint64 value152 = 71;

        Buffer.buffer memory result152 = Leb128.encodeUnsignedLeb128FromUInt64(value152);

        require(keccak256(result152.buf) == keccak256(expected152), "'71' is not returning '47'");

        bytes memory expected153 = hex"aa01";
        uint64 value153 = 170;

        Buffer.buffer memory result153 = Leb128.encodeUnsignedLeb128FromUInt64(value153);

        require(keccak256(result153.buf) == keccak256(expected153), "'170' is not returning 'aa01'");

        bytes memory expected154 = hex"71";
        uint64 value154 = 113;

        Buffer.buffer memory result154 = Leb128.encodeUnsignedLeb128FromUInt64(value154);

        require(keccak256(result154.buf) == keccak256(expected154), "'113' is not returning '71'");

        bytes memory expected155 = hex"9801";
        uint64 value155 = 152;

        Buffer.buffer memory result155 = Leb128.encodeUnsignedLeb128FromUInt64(value155);

        require(keccak256(result155.buf) == keccak256(expected155), "'152' is not returning '9801'");

        bytes memory expected156 = hex"d101";
        uint64 value156 = 209;

        Buffer.buffer memory result156 = Leb128.encodeUnsignedLeb128FromUInt64(value156);

        require(keccak256(result156.buf) == keccak256(expected156), "'209' is not returning 'd101'");

        bytes memory expected157 = hex"8301";
        uint64 value157 = 131;

        Buffer.buffer memory result157 = Leb128.encodeUnsignedLeb128FromUInt64(value157);

        require(keccak256(result157.buf) == keccak256(expected157), "'131' is not returning '8301'");

        bytes memory expected158 = hex"1b";
        uint64 value158 = 27;

        Buffer.buffer memory result158 = Leb128.encodeUnsignedLeb128FromUInt64(value158);

        require(keccak256(result158.buf) == keccak256(expected158), "'27' is not returning '1b'");

        bytes memory expected159 = hex"75";
        uint64 value159 = 117;

        Buffer.buffer memory result159 = Leb128.encodeUnsignedLeb128FromUInt64(value159);

        require(keccak256(result159.buf) == keccak256(expected159), "'117' is not returning '75'");

        bytes memory expected160 = hex"9701";
        uint64 value160 = 151;

        Buffer.buffer memory result160 = Leb128.encodeUnsignedLeb128FromUInt64(value160);

        require(keccak256(result160.buf) == keccak256(expected160), "'151' is not returning '9701'");

        bytes memory expected161 = hex"f001";
        uint64 value161 = 240;

        Buffer.buffer memory result161 = Leb128.encodeUnsignedLeb128FromUInt64(value161);

        require(keccak256(result161.buf) == keccak256(expected161), "'240' is not returning 'f001'");

        bytes memory expected162 = hex"8e01";
        uint64 value162 = 142;

        Buffer.buffer memory result162 = Leb128.encodeUnsignedLeb128FromUInt64(value162);

        require(keccak256(result162.buf) == keccak256(expected162), "'142' is not returning '8e01'");

        bytes memory expected163 = hex"f801";
        uint64 value163 = 248;

        Buffer.buffer memory result163 = Leb128.encodeUnsignedLeb128FromUInt64(value163);

        require(keccak256(result163.buf) == keccak256(expected163), "'248' is not returning 'f801'");

        bytes memory expected164 = hex"d601";
        uint64 value164 = 214;

        Buffer.buffer memory result164 = Leb128.encodeUnsignedLeb128FromUInt64(value164);

        require(keccak256(result164.buf) == keccak256(expected164), "'214' is not returning 'd601'");

        bytes memory expected165 = hex"b101";
        uint64 value165 = 177;

        Buffer.buffer memory result165 = Leb128.encodeUnsignedLeb128FromUInt64(value165);

        require(keccak256(result165.buf) == keccak256(expected165), "'177' is not returning 'b101'");

        bytes memory expected166 = hex"bb01";
        uint64 value166 = 187;

        Buffer.buffer memory result166 = Leb128.encodeUnsignedLeb128FromUInt64(value166);

        require(keccak256(result166.buf) == keccak256(expected166), "'187' is not returning 'bb01'");

        bytes memory expected167 = hex"3b";
        uint64 value167 = 59;

        Buffer.buffer memory result167 = Leb128.encodeUnsignedLeb128FromUInt64(value167);

        require(keccak256(result167.buf) == keccak256(expected167), "'59' is not returning '3b'");

        bytes memory expected168 = hex"f901";
        uint64 value168 = 249;

        Buffer.buffer memory result168 = Leb128.encodeUnsignedLeb128FromUInt64(value168);

        require(keccak256(result168.buf) == keccak256(expected168), "'249' is not returning 'f901'");

        bytes memory expected169 = hex"f301";
        uint64 value169 = 243;

        Buffer.buffer memory result169 = Leb128.encodeUnsignedLeb128FromUInt64(value169);

        require(keccak256(result169.buf) == keccak256(expected169), "'243' is not returning 'f301'");

        bytes memory expected170 = hex"fa01";
        uint64 value170 = 250;

        Buffer.buffer memory result170 = Leb128.encodeUnsignedLeb128FromUInt64(value170);

        require(keccak256(result170.buf) == keccak256(expected170), "'250' is not returning 'fa01'");

        bytes memory expected171 = hex"00";
        uint64 value171 = 0;

        Buffer.buffer memory result171 = Leb128.encodeUnsignedLeb128FromUInt64(value171);

        require(keccak256(result171.buf) == keccak256(expected171), "'0' is not returning '00'");

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
    }
}
