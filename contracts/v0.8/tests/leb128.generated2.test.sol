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
contract Leb128Generated2Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {
        bytes memory expected70 = hex"64";
        uint64 value70 = 100;

        Buffer.buffer memory result70 = Leb128.encodeUnsignedLeb128FromUInt64(value70);

        require(keccak256(result70.buf) == keccak256(expected70), "'100' is not returning '64'");

        bytes memory expected71 = hex"8401";
        uint64 value71 = 132;

        Buffer.buffer memory result71 = Leb128.encodeUnsignedLeb128FromUInt64(value71);

        require(keccak256(result71.buf) == keccak256(expected71), "'132' is not returning '8401'");

        bytes memory expected72 = hex"76";
        uint64 value72 = 118;

        Buffer.buffer memory result72 = Leb128.encodeUnsignedLeb128FromUInt64(value72);

        require(keccak256(result72.buf) == keccak256(expected72), "'118' is not returning '76'");

        bytes memory expected73 = hex"cd01";
        uint64 value73 = 205;

        Buffer.buffer memory result73 = Leb128.encodeUnsignedLeb128FromUInt64(value73);

        require(keccak256(result73.buf) == keccak256(expected73), "'205' is not returning 'cd01'");

        bytes memory expected74 = hex"fb01";
        uint64 value74 = 251;

        Buffer.buffer memory result74 = Leb128.encodeUnsignedLeb128FromUInt64(value74);

        require(keccak256(result74.buf) == keccak256(expected74), "'251' is not returning 'fb01'");

        bytes memory expected75 = hex"1a";
        uint64 value75 = 26;

        Buffer.buffer memory result75 = Leb128.encodeUnsignedLeb128FromUInt64(value75);

        require(keccak256(result75.buf) == keccak256(expected75), "'26' is not returning '1a'");

        bytes memory expected76 = hex"cb01";
        uint64 value76 = 203;

        Buffer.buffer memory result76 = Leb128.encodeUnsignedLeb128FromUInt64(value76);

        require(keccak256(result76.buf) == keccak256(expected76), "'203' is not returning 'cb01'");

        bytes memory expected77 = hex"fc01";
        uint64 value77 = 252;

        Buffer.buffer memory result77 = Leb128.encodeUnsignedLeb128FromUInt64(value77);

        require(keccak256(result77.buf) == keccak256(expected77), "'252' is not returning 'fc01'");

        bytes memory expected78 = hex"1d";
        uint64 value78 = 29;

        Buffer.buffer memory result78 = Leb128.encodeUnsignedLeb128FromUInt64(value78);

        require(keccak256(result78.buf) == keccak256(expected78), "'29' is not returning '1d'");

        bytes memory expected79 = hex"b601";
        uint64 value79 = 182;

        Buffer.buffer memory result79 = Leb128.encodeUnsignedLeb128FromUInt64(value79);

        require(keccak256(result79.buf) == keccak256(expected79), "'182' is not returning 'b601'");

        bytes memory expected80 = hex"dd01";
        uint64 value80 = 221;

        Buffer.buffer memory result80 = Leb128.encodeUnsignedLeb128FromUInt64(value80);

        require(keccak256(result80.buf) == keccak256(expected80), "'221' is not returning 'dd01'");

        bytes memory expected81 = hex"b501";
        uint64 value81 = 181;

        Buffer.buffer memory result81 = Leb128.encodeUnsignedLeb128FromUInt64(value81);

        require(keccak256(result81.buf) == keccak256(expected81), "'181' is not returning 'b501'");

        bytes memory expected82 = hex"e301";
        uint64 value82 = 227;

        Buffer.buffer memory result82 = Leb128.encodeUnsignedLeb128FromUInt64(value82);

        require(keccak256(result82.buf) == keccak256(expected82), "'227' is not returning 'e301'");

        bytes memory expected83 = hex"2b";
        uint64 value83 = 43;

        Buffer.buffer memory result83 = Leb128.encodeUnsignedLeb128FromUInt64(value83);

        require(keccak256(result83.buf) == keccak256(expected83), "'43' is not returning '2b'");

        bytes memory expected84 = hex"44";
        uint64 value84 = 68;

        Buffer.buffer memory result84 = Leb128.encodeUnsignedLeb128FromUInt64(value84);

        require(keccak256(result84.buf) == keccak256(expected84), "'68' is not returning '44'");

        bytes memory expected85 = hex"44";
        uint64 value85 = 68;

        Buffer.buffer memory result85 = Leb128.encodeUnsignedLeb128FromUInt64(value85);

        require(keccak256(result85.buf) == keccak256(expected85), "'68' is not returning '44'");

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
    }
}
