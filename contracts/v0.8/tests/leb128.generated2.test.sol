
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
contract Leb128Generated2Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {

        bytes memory expected86 = hex"9301";
        uint64 value86 = 147;

        Buffer.buffer memory result86 = Leb128.encodeUnsignedLeb128FromUInt64(value86);

        require(keccak256(result86.buf) == keccak256(expected86), "'147' is not returning '9301'");    

        bytes memory expected87 = hex"d101";
        uint64 value87 = 209;

        Buffer.buffer memory result87 = Leb128.encodeUnsignedLeb128FromUInt64(value87);

        require(keccak256(result87.buf) == keccak256(expected87), "'209' is not returning 'd101'");    

        bytes memory expected88 = hex"25";
        uint64 value88 = 37;

        Buffer.buffer memory result88 = Leb128.encodeUnsignedLeb128FromUInt64(value88);

        require(keccak256(result88.buf) == keccak256(expected88), "'37' is not returning '25'");    

        bytes memory expected89 = hex"7d";
        uint64 value89 = 125;

        Buffer.buffer memory result89 = Leb128.encodeUnsignedLeb128FromUInt64(value89);

        require(keccak256(result89.buf) == keccak256(expected89), "'125' is not returning '7d'");    

        bytes memory expected90 = hex"b701";
        uint64 value90 = 183;

        Buffer.buffer memory result90 = Leb128.encodeUnsignedLeb128FromUInt64(value90);

        require(keccak256(result90.buf) == keccak256(expected90), "'183' is not returning 'b701'");    

        bytes memory expected91 = hex"d701";
        uint64 value91 = 215;

        Buffer.buffer memory result91 = Leb128.encodeUnsignedLeb128FromUInt64(value91);

        require(keccak256(result91.buf) == keccak256(expected91), "'215' is not returning 'd701'");    

        bytes memory expected92 = hex"52";
        uint64 value92 = 82;

        Buffer.buffer memory result92 = Leb128.encodeUnsignedLeb128FromUInt64(value92);

        require(keccak256(result92.buf) == keccak256(expected92), "'82' is not returning '52'");    

        bytes memory expected93 = hex"c501";
        uint64 value93 = 197;

        Buffer.buffer memory result93 = Leb128.encodeUnsignedLeb128FromUInt64(value93);

        require(keccak256(result93.buf) == keccak256(expected93), "'197' is not returning 'c501'");    

        bytes memory expected94 = hex"ee01";
        uint64 value94 = 238;

        Buffer.buffer memory result94 = Leb128.encodeUnsignedLeb128FromUInt64(value94);

        require(keccak256(result94.buf) == keccak256(expected94), "'238' is not returning 'ee01'");    

        bytes memory expected95 = hex"53";
        uint64 value95 = 83;

        Buffer.buffer memory result95 = Leb128.encodeUnsignedLeb128FromUInt64(value95);

        require(keccak256(result95.buf) == keccak256(expected95), "'83' is not returning '53'");    

        bytes memory expected96 = hex"1b";
        uint64 value96 = 27;

        Buffer.buffer memory result96 = Leb128.encodeUnsignedLeb128FromUInt64(value96);

        require(keccak256(result96.buf) == keccak256(expected96), "'27' is not returning '1b'");    

        bytes memory expected97 = hex"bf01";
        uint64 value97 = 191;

        Buffer.buffer memory result97 = Leb128.encodeUnsignedLeb128FromUInt64(value97);

        require(keccak256(result97.buf) == keccak256(expected97), "'191' is not returning 'bf01'");    

        bytes memory expected98 = hex"7d";
        uint64 value98 = 125;

        Buffer.buffer memory result98 = Leb128.encodeUnsignedLeb128FromUInt64(value98);

        require(keccak256(result98.buf) == keccak256(expected98), "'125' is not returning '7d'");    

        bytes memory expected99 = hex"1a";
        uint64 value99 = 26;

        Buffer.buffer memory result99 = Leb128.encodeUnsignedLeb128FromUInt64(value99);

        require(keccak256(result99.buf) == keccak256(expected99), "'26' is not returning '1a'");    

        bytes memory expected100 = hex"8401";
        uint64 value100 = 132;

        Buffer.buffer memory result100 = Leb128.encodeUnsignedLeb128FromUInt64(value100);

        require(keccak256(result100.buf) == keccak256(expected100), "'132' is not returning '8401'");    

        bytes memory expected101 = hex"8a01";
        uint64 value101 = 138;

        Buffer.buffer memory result101 = Leb128.encodeUnsignedLeb128FromUInt64(value101);

        require(keccak256(result101.buf) == keccak256(expected101), "'138' is not returning '8a01'");    

        bytes memory expected102 = hex"09";
        uint64 value102 = 9;

        Buffer.buffer memory result102 = Leb128.encodeUnsignedLeb128FromUInt64(value102);

        require(keccak256(result102.buf) == keccak256(expected102), "'9' is not returning '09'");    

        bytes memory expected103 = hex"20";
        uint64 value103 = 32;

        Buffer.buffer memory result103 = Leb128.encodeUnsignedLeb128FromUInt64(value103);

        require(keccak256(result103.buf) == keccak256(expected103), "'32' is not returning '20'");    

        bytes memory expected104 = hex"74";
        uint64 value104 = 116;

        Buffer.buffer memory result104 = Leb128.encodeUnsignedLeb128FromUInt64(value104);

        require(keccak256(result104.buf) == keccak256(expected104), "'116' is not returning '74'");    

        bytes memory expected105 = hex"00";
        uint64 value105 = 0;

        Buffer.buffer memory result105 = Leb128.encodeUnsignedLeb128FromUInt64(value105);

        require(keccak256(result105.buf) == keccak256(expected105), "'0' is not returning '00'");    

        bytes memory expected106 = hex"13";
        uint64 value106 = 19;

        Buffer.buffer memory result106 = Leb128.encodeUnsignedLeb128FromUInt64(value106);

        require(keccak256(result106.buf) == keccak256(expected106), "'19' is not returning '13'");    

        bytes memory expected107 = hex"b301";
        uint64 value107 = 179;

        Buffer.buffer memory result107 = Leb128.encodeUnsignedLeb128FromUInt64(value107);

        require(keccak256(result107.buf) == keccak256(expected107), "'179' is not returning 'b301'");    

        bytes memory expected108 = hex"78";
        uint64 value108 = 120;

        Buffer.buffer memory result108 = Leb128.encodeUnsignedLeb128FromUInt64(value108);

        require(keccak256(result108.buf) == keccak256(expected108), "'120' is not returning '78'");    

        bytes memory expected109 = hex"09";
        uint64 value109 = 9;

        Buffer.buffer memory result109 = Leb128.encodeUnsignedLeb128FromUInt64(value109);

        require(keccak256(result109.buf) == keccak256(expected109), "'9' is not returning '09'");    

        bytes memory expected110 = hex"15";
        uint64 value110 = 21;

        Buffer.buffer memory result110 = Leb128.encodeUnsignedLeb128FromUInt64(value110);

        require(keccak256(result110.buf) == keccak256(expected110), "'21' is not returning '15'");    

        bytes memory expected111 = hex"df01";
        uint64 value111 = 223;

        Buffer.buffer memory result111 = Leb128.encodeUnsignedLeb128FromUInt64(value111);

        require(keccak256(result111.buf) == keccak256(expected111), "'223' is not returning 'df01'");    

        bytes memory expected112 = hex"53";
        uint64 value112 = 83;

        Buffer.buffer memory result112 = Leb128.encodeUnsignedLeb128FromUInt64(value112);

        require(keccak256(result112.buf) == keccak256(expected112), "'83' is not returning '53'");    

        bytes memory expected113 = hex"da01";
        uint64 value113 = 218;

        Buffer.buffer memory result113 = Leb128.encodeUnsignedLeb128FromUInt64(value113);

        require(keccak256(result113.buf) == keccak256(expected113), "'218' is not returning 'da01'");    

        bytes memory expected114 = hex"af01";
        uint64 value114 = 175;

        Buffer.buffer memory result114 = Leb128.encodeUnsignedLeb128FromUInt64(value114);

        require(keccak256(result114.buf) == keccak256(expected114), "'175' is not returning 'af01'");    

        bytes memory expected115 = hex"8301";
        uint64 value115 = 131;

        Buffer.buffer memory result115 = Leb128.encodeUnsignedLeb128FromUInt64(value115);

        require(keccak256(result115.buf) == keccak256(expected115), "'131' is not returning '8301'");    

        bytes memory expected116 = hex"a201";
        uint64 value116 = 162;

        Buffer.buffer memory result116 = Leb128.encodeUnsignedLeb128FromUInt64(value116);

        require(keccak256(result116.buf) == keccak256(expected116), "'162' is not returning 'a201'");    

        bytes memory expected117 = hex"8a01";
        uint64 value117 = 138;

        Buffer.buffer memory result117 = Leb128.encodeUnsignedLeb128FromUInt64(value117);

        require(keccak256(result117.buf) == keccak256(expected117), "'138' is not returning '8a01'");    

        bytes memory expected118 = hex"c401";
        uint64 value118 = 196;

        Buffer.buffer memory result118 = Leb128.encodeUnsignedLeb128FromUInt64(value118);

        require(keccak256(result118.buf) == keccak256(expected118), "'196' is not returning 'c401'");    

        bytes memory expected119 = hex"6c";
        uint64 value119 = 108;

        Buffer.buffer memory result119 = Leb128.encodeUnsignedLeb128FromUInt64(value119);

        require(keccak256(result119.buf) == keccak256(expected119), "'108' is not returning '6c'");    

        bytes memory expected120 = hex"29";
        uint64 value120 = 41;

        Buffer.buffer memory result120 = Leb128.encodeUnsignedLeb128FromUInt64(value120);

        require(keccak256(result120.buf) == keccak256(expected120), "'41' is not returning '29'");    

        bytes memory expected121 = hex"06";
        uint64 value121 = 6;

        Buffer.buffer memory result121 = Leb128.encodeUnsignedLeb128FromUInt64(value121);

        require(keccak256(result121.buf) == keccak256(expected121), "'6' is not returning '06'");    

        bytes memory expected122 = hex"61";
        uint64 value122 = 97;

        Buffer.buffer memory result122 = Leb128.encodeUnsignedLeb128FromUInt64(value122);

        require(keccak256(result122.buf) == keccak256(expected122), "'97' is not returning '61'");    

        bytes memory expected123 = hex"ab01";
        uint64 value123 = 171;

        Buffer.buffer memory result123 = Leb128.encodeUnsignedLeb128FromUInt64(value123);

        require(keccak256(result123.buf) == keccak256(expected123), "'171' is not returning 'ab01'");    

        bytes memory expected124 = hex"2a";
        uint64 value124 = 42;

        Buffer.buffer memory result124 = Leb128.encodeUnsignedLeb128FromUInt64(value124);

        require(keccak256(result124.buf) == keccak256(expected124), "'42' is not returning '2a'");    

        bytes memory expected125 = hex"63";
        uint64 value125 = 99;

        Buffer.buffer memory result125 = Leb128.encodeUnsignedLeb128FromUInt64(value125);

        require(keccak256(result125.buf) == keccak256(expected125), "'99' is not returning '63'");    

        bytes memory expected126 = hex"8d01";
        uint64 value126 = 141;

        Buffer.buffer memory result126 = Leb128.encodeUnsignedLeb128FromUInt64(value126);

        require(keccak256(result126.buf) == keccak256(expected126), "'141' is not returning '8d01'");    

        bytes memory expected127 = hex"fd01";
        uint64 value127 = 253;

        Buffer.buffer memory result127 = Leb128.encodeUnsignedLeb128FromUInt64(value127);

        require(keccak256(result127.buf) == keccak256(expected127), "'253' is not returning 'fd01'");    

        bytes memory expected128 = hex"7a";
        uint64 value128 = 122;

        Buffer.buffer memory result128 = Leb128.encodeUnsignedLeb128FromUInt64(value128);

        require(keccak256(result128.buf) == keccak256(expected128), "'122' is not returning '7a'");    

        bytes memory expected129 = hex"8b01";
        uint64 value129 = 139;

        Buffer.buffer memory result129 = Leb128.encodeUnsignedLeb128FromUInt64(value129);

        require(keccak256(result129.buf) == keccak256(expected129), "'139' is not returning '8b01'");    

        bytes memory expected130 = hex"8f01";
        uint64 value130 = 143;

        Buffer.buffer memory result130 = Leb128.encodeUnsignedLeb128FromUInt64(value130);

        require(keccak256(result130.buf) == keccak256(expected130), "'143' is not returning '8f01'");    

        bytes memory expected131 = hex"0c";
        uint64 value131 = 12;

        Buffer.buffer memory result131 = Leb128.encodeUnsignedLeb128FromUInt64(value131);

        require(keccak256(result131.buf) == keccak256(expected131), "'12' is not returning '0c'");    

        bytes memory expected132 = hex"9601";
        uint64 value132 = 150;

        Buffer.buffer memory result132 = Leb128.encodeUnsignedLeb128FromUInt64(value132);

        require(keccak256(result132.buf) == keccak256(expected132), "'150' is not returning '9601'");    

        bytes memory expected133 = hex"a301";
        uint64 value133 = 163;

        Buffer.buffer memory result133 = Leb128.encodeUnsignedLeb128FromUInt64(value133);

        require(keccak256(result133.buf) == keccak256(expected133), "'163' is not returning 'a301'");    

        bytes memory expected134 = hex"c301";
        uint64 value134 = 195;

        Buffer.buffer memory result134 = Leb128.encodeUnsignedLeb128FromUInt64(value134);

        require(keccak256(result134.buf) == keccak256(expected134), "'195' is not returning 'c301'");    

        bytes memory expected135 = hex"8401";
        uint64 value135 = 132;

        Buffer.buffer memory result135 = Leb128.encodeUnsignedLeb128FromUInt64(value135);

        require(keccak256(result135.buf) == keccak256(expected135), "'132' is not returning '8401'");    

        bytes memory expected136 = hex"19";
        uint64 value136 = 25;

        Buffer.buffer memory result136 = Leb128.encodeUnsignedLeb128FromUInt64(value136);

        require(keccak256(result136.buf) == keccak256(expected136), "'25' is not returning '19'");    

        bytes memory expected137 = hex"04";
        uint64 value137 = 4;

        Buffer.buffer memory result137 = Leb128.encodeUnsignedLeb128FromUInt64(value137);

        require(keccak256(result137.buf) == keccak256(expected137), "'4' is not returning '04'");    

        bytes memory expected138 = hex"77";
        uint64 value138 = 119;

        Buffer.buffer memory result138 = Leb128.encodeUnsignedLeb128FromUInt64(value138);

        require(keccak256(result138.buf) == keccak256(expected138), "'119' is not returning '77'");    

        bytes memory expected139 = hex"66";
        uint64 value139 = 102;

        Buffer.buffer memory result139 = Leb128.encodeUnsignedLeb128FromUInt64(value139);

        require(keccak256(result139.buf) == keccak256(expected139), "'102' is not returning '66'");    

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

    }
}
