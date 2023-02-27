
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
contract Leb128Generated10Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {

        bytes memory expected774 = hex"b6c1eac8dde7ebb7ef01";
        uint64 value774 = 17253201377649926326;

        Buffer.buffer memory result774 = Leb128.encodeUnsignedLeb128FromUInt64(value774);

        require(keccak256(result774.buf) == keccak256(expected774), "'17253201377649926326' is not returning 'b6c1eac8dde7ebb7ef01'");    

        bytes memory expected775 = hex"ecf6b4b6f2f493d8d601";
        uint64 value775 = 15469952299346770796;

        Buffer.buffer memory result775 = Leb128.encodeUnsignedLeb128FromUInt64(value775);

        require(keccak256(result775.buf) == keccak256(expected775), "'15469952299346770796' is not returning 'ecf6b4b6f2f493d8d601'");    

        bytes memory expected776 = hex"f585a5d5c0deedfd50";
        uint64 value776 = 5835458901455749877;

        Buffer.buffer memory result776 = Leb128.encodeUnsignedLeb128FromUInt64(value776);

        require(keccak256(result776.buf) == keccak256(expected776), "'5835458901455749877' is not returning 'f585a5d5c0deedfd50'");    

        bytes memory expected777 = hex"9a88cb859caaa3d2f701";
        uint64 value777 = 17844543005813556250;

        Buffer.buffer memory result777 = Leb128.encodeUnsignedLeb128FromUInt64(value777);

        require(keccak256(result777.buf) == keccak256(expected777), "'17844543005813556250' is not returning '9a88cb859caaa3d2f701'");    

        bytes memory expected778 = hex"d984bdeecce1aefb44";
        uint64 value778 = 4969364902516834905;

        Buffer.buffer memory result778 = Leb128.encodeUnsignedLeb128FromUInt64(value778);

        require(keccak256(result778.buf) == keccak256(expected778), "'4969364902516834905' is not returning 'd984bdeecce1aefb44'");    

        bytes memory expected779 = hex"9ad993c4d5c986f05c";
        uint64 value779 = 6692377965772467354;

        Buffer.buffer memory result779 = Leb128.encodeUnsignedLeb128FromUInt64(value779);

        require(keccak256(result779.buf) == keccak256(expected779), "'6692377965772467354' is not returning '9ad993c4d5c986f05c'");    

        bytes memory expected780 = hex"ffc688f8aee395bd14";
        uint64 value780 = 1475587601107919743;

        Buffer.buffer memory result780 = Leb128.encodeUnsignedLeb128FromUInt64(value780);

        require(keccak256(result780.buf) == keccak256(expected780), "'1475587601107919743' is not returning 'ffc688f8aee395bd14'");    

        bytes memory expected781 = hex"daa2cea1deb9f5aa35";
        uint64 value781 = 3843212937304183130;

        Buffer.buffer memory result781 = Leb128.encodeUnsignedLeb128FromUInt64(value781);

        require(keccak256(result781.buf) == keccak256(expected781), "'3843212937304183130' is not returning 'daa2cea1deb9f5aa35'");    

        bytes memory expected782 = hex"8ec4afc1d7b3bbd78701";
        uint64 value782 = 9777013101649715726;

        Buffer.buffer memory result782 = Leb128.encodeUnsignedLeb128FromUInt64(value782);

        require(keccak256(result782.buf) == keccak256(expected782), "'9777013101649715726' is not returning '8ec4afc1d7b3bbd78701'");    

        bytes memory expected783 = hex"9eb1c7e6c8ae93e515";
        uint64 value783 = 1570152583066146974;

        Buffer.buffer memory result783 = Leb128.encodeUnsignedLeb128FromUInt64(value783);

        require(keccak256(result783.buf) == keccak256(expected783), "'1570152583066146974' is not returning '9eb1c7e6c8ae93e515'");    

        bytes memory expected784 = hex"e896dadbb7aacdeef001";
        uint64 value784 = 17356087171625683816;

        Buffer.buffer memory result784 = Leb128.encodeUnsignedLeb128FromUInt64(value784);

        require(keccak256(result784.buf) == keccak256(expected784), "'17356087171625683816' is not returning 'e896dadbb7aacdeef001'");    

        bytes memory expected785 = hex"a9a9b0d3ddfbb59546";
        uint64 value785 = 5056090879529063593;

        Buffer.buffer memory result785 = Leb128.encodeUnsignedLeb128FromUInt64(value785);

        require(keccak256(result785.buf) == keccak256(expected785), "'5056090879529063593' is not returning 'a9a9b0d3ddfbb59546'");    

        bytes memory expected786 = hex"8696e5f3f4efcffc2e";
        uint64 value786 = 3384806410955606790;

        Buffer.buffer memory result786 = Leb128.encodeUnsignedLeb128FromUInt64(value786);

        require(keccak256(result786.buf) == keccak256(expected786), "'3384806410955606790' is not returning '8696e5f3f4efcffc2e'");    

        bytes memory expected787 = hex"93a1f49eb8ebe1a467";
        uint64 value787 = 7442628686330531987;

        Buffer.buffer memory result787 = Leb128.encodeUnsignedLeb128FromUInt64(value787);

        require(keccak256(result787.buf) == keccak256(expected787), "'7442628686330531987' is not returning '93a1f49eb8ebe1a467'");    

        bytes memory expected788 = hex"e1ccc0d2c8b6e8ea12";
        uint64 value788 = 1357168659508766305;

        Buffer.buffer memory result788 = Leb128.encodeUnsignedLeb128FromUInt64(value788);

        require(keccak256(result788.buf) == keccak256(expected788), "'1357168659508766305' is not returning 'e1ccc0d2c8b6e8ea12'");    

        bytes memory expected789 = hex"ddd6d8cddbb9939662";
        uint64 value789 = 7074114660671564637;

        Buffer.buffer memory result789 = Leb128.encodeUnsignedLeb128FromUInt64(value789);

        require(keccak256(result789.buf) == keccak256(expected789), "'7074114660671564637' is not returning 'ddd6d8cddbb9939662'");    

        bytes memory expected790 = hex"fcbff5bd9ee18381e801";
        uint64 value790 = 16717941301969772540;

        Buffer.buffer memory result790 = Leb128.encodeUnsignedLeb128FromUInt64(value790);

        require(keccak256(result790.buf) == keccak256(expected790), "'16717941301969772540' is not returning 'fcbff5bd9ee18381e801'");    

        bytes memory expected791 = hex"ada6a2d4ef90a49121";
        uint64 value791 = 2387629661863056173;

        Buffer.buffer memory result791 = Leb128.encodeUnsignedLeb128FromUInt64(value791);

        require(keccak256(result791.buf) == keccak256(expected791), "'2387629661863056173' is not returning 'ada6a2d4ef90a49121'");    

        bytes memory expected792 = hex"f7edf9d88192b18e6d";
        uint64 value792 = 7862375172691359479;

        Buffer.buffer memory result792 = Leb128.encodeUnsignedLeb128FromUInt64(value792);

        require(keccak256(result792.buf) == keccak256(expected792), "'7862375172691359479' is not returning 'f7edf9d88192b18e6d'");    

        bytes memory expected793 = hex"f0d1ae83ba93e7a9f501";
        uint64 value793 = 17677645154584602864;

        Buffer.buffer memory result793 = Leb128.encodeUnsignedLeb128FromUInt64(value793);

        require(keccak256(result793.buf) == keccak256(expected793), "'17677645154584602864' is not returning 'f0d1ae83ba93e7a9f501'");    

        bytes memory expected794 = hex"87809cdb8cc6c99138";
        uint64 value794 = 4045118881321648135;

        Buffer.buffer memory result794 = Leb128.encodeUnsignedLeb128FromUInt64(value794);

        require(keccak256(result794.buf) == keccak256(expected794), "'4045118881321648135' is not returning '87809cdb8cc6c99138'");    

        bytes memory expected795 = hex"baf0b4be8ee1c89d7e";
        uint64 value795 = 9095902393560545338;

        Buffer.buffer memory result795 = Leb128.encodeUnsignedLeb128FromUInt64(value795);

        require(keccak256(result795.buf) == keccak256(expected795), "'9095902393560545338' is not returning 'baf0b4be8ee1c89d7e'");    

        bytes memory expected796 = hex"f0e2ef80d390b2e90e";
        uint64 value796 = 1068136536003572080;

        Buffer.buffer memory result796 = Leb128.encodeUnsignedLeb128FromUInt64(value796);

        require(keccak256(result796.buf) == keccak256(expected796), "'1068136536003572080' is not returning 'f0e2ef80d390b2e90e'");    

        bytes memory expected797 = hex"a3deb1e881fbcfe965";
        uint64 value797 = 7337278415349509923;

        Buffer.buffer memory result797 = Leb128.encodeUnsignedLeb128FromUInt64(value797);

        require(keccak256(result797.buf) == keccak256(expected797), "'7337278415349509923' is not returning 'a3deb1e881fbcfe965'");    

        bytes memory expected798 = hex"9bdeb0c29bc7eb9318";
        uint64 value798 = 1740551343930355483;

        Buffer.buffer memory result798 = Leb128.encodeUnsignedLeb128FromUInt64(value798);

        require(keccak256(result798.buf) == keccak256(expected798), "'1740551343930355483' is not returning '9bdeb0c29bc7eb9318'");    

        bytes memory expected799 = hex"c3bcc8b594b0b88436";
        uint64 value799 = 3893609823214902851;

        Buffer.buffer memory result799 = Leb128.encodeUnsignedLeb128FromUInt64(value799);

        require(keccak256(result799.buf) == keccak256(expected799), "'3893609823214902851' is not returning 'c3bcc8b594b0b88436'");    

        bytes memory expected800 = hex"8ae3d7c8c6a8839ae801";
        uint64 value800 = 16732013103060218250;

        Buffer.buffer memory result800 = Leb128.encodeUnsignedLeb128FromUInt64(value800);

        require(keccak256(result800.buf) == keccak256(expected800), "'16732013103060218250' is not returning '8ae3d7c8c6a8839ae801'");    

        bytes memory expected801 = hex"f6b185e0f3dbfaf58d01";
        uint64 value801 = 10226525623380170998;

        Buffer.buffer memory result801 = Leb128.encodeUnsignedLeb128FromUInt64(value801);

        require(keccak256(result801.buf) == keccak256(expected801), "'10226525623380170998' is not returning 'f6b185e0f3dbfaf58d01'");    

        bytes memory expected802 = hex"9c98d4bcd0c9b7a61a";
        uint64 value802 = 1895133965637192732;

        Buffer.buffer memory result802 = Leb128.encodeUnsignedLeb128FromUInt64(value802);

        require(keccak256(result802.buf) == keccak256(expected802), "'1895133965637192732' is not returning '9c98d4bcd0c9b7a61a'");    

        bytes memory expected803 = hex"f0f8e3eba5aec4a9dd01";
        uint64 value803 = 15948109888341212272;

        Buffer.buffer memory result803 = Leb128.encodeUnsignedLeb128FromUInt64(value803);

        require(keccak256(result803.buf) == keccak256(expected803), "'15948109888341212272' is not returning 'f0f8e3eba5aec4a9dd01'");    

        bytes memory expected804 = hex"c3d79ef5d7eabea670";
        uint64 value804 = 8092118975093648323;

        Buffer.buffer memory result804 = Leb128.encodeUnsignedLeb128FromUInt64(value804);

        require(keccak256(result804.buf) == keccak256(expected804), "'8092118975093648323' is not returning 'c3d79ef5d7eabea670'");    

        bytes memory expected805 = hex"aa87b2f9f5f2f5f59101";
        uint64 value805 = 10514734800163341226;

        Buffer.buffer memory result805 = Leb128.encodeUnsignedLeb128FromUInt64(value805);

        require(keccak256(result805.buf) == keccak256(expected805), "'10514734800163341226' is not returning 'aa87b2f9f5f2f5f59101'");    

        bytes memory expected806 = hex"a89bd694d999bbd8c001";
        uint64 value806 = 13884858018854964648;

        Buffer.buffer memory result806 = Leb128.encodeUnsignedLeb128FromUInt64(value806);

        require(keccak256(result806.buf) == keccak256(expected806), "'13884858018854964648' is not returning 'a89bd694d999bbd8c001'");    

        bytes memory expected807 = hex"9bfcb7d6ddaed8b44c";
        uint64 value807 = 5506039178247142939;

        Buffer.buffer memory result807 = Leb128.encodeUnsignedLeb128FromUInt64(value807);

        require(keccak256(result807.buf) == keccak256(expected807), "'5506039178247142939' is not returning '9bfcb7d6ddaed8b44c'");    

        bytes memory expected808 = hex"fdc2a4be9aa3d4a735";
        uint64 value808 = 3841378177801331069;

        Buffer.buffer memory result808 = Leb128.encodeUnsignedLeb128FromUInt64(value808);

        require(keccak256(result808.buf) == keccak256(expected808), "'3841378177801331069' is not returning 'fdc2a4be9aa3d4a735'");    

        bytes memory expected809 = hex"d5a7f8d8e1dd96bdf601";
        uint64 value809 = 17760608059192644565;

        Buffer.buffer memory result809 = Leb128.encodeUnsignedLeb128FromUInt64(value809);

        require(keccak256(result809.buf) == keccak256(expected809), "'17760608059192644565' is not returning 'd5a7f8d8e1dd96bdf601'");    

        bytes memory expected810 = hex"cd868de1c9a4abb461";
        uint64 value810 = 7019050392006902605;

        Buffer.buffer memory result810 = Leb128.encodeUnsignedLeb128FromUInt64(value810);

        require(keccak256(result810.buf) == keccak256(expected810), "'7019050392006902605' is not returning 'cd868de1c9a4abb461'");    

        bytes memory expected811 = hex"c8c191d8bed4b1c873";
        uint64 value811 = 8327374118332948680;

        Buffer.buffer memory result811 = Leb128.encodeUnsignedLeb128FromUInt64(value811);

        require(keccak256(result811.buf) == keccak256(expected811), "'8327374118332948680' is not returning 'c8c191d8bed4b1c873'");    

        bytes memory expected812 = hex"c5c4e1c4e8dbb2ca23";
        uint64 value812 = 2563897145003893317;

        Buffer.buffer memory result812 = Leb128.encodeUnsignedLeb128FromUInt64(value812);

        require(keccak256(result812.buf) == keccak256(expected812), "'2563897145003893317' is not returning 'c5c4e1c4e8dbb2ca23'");    

        bytes memory expected813 = hex"d9c9c6fcaad8eebaaf01";
        uint64 value813 = 12643216874244515033;

        Buffer.buffer memory result813 = Leb128.encodeUnsignedLeb128FromUInt64(value813);

        require(keccak256(result813.buf) == keccak256(expected813), "'12643216874244515033' is not returning 'd9c9c6fcaad8eebaaf01'");    

        bytes memory expected814 = hex"8e8bd58e9aee9c88b601";
        uint64 value814 = 13119112646413862286;

        Buffer.buffer memory result814 = Leb128.encodeUnsignedLeb128FromUInt64(value814);

        require(keccak256(result814.buf) == keccak256(expected814), "'13119112646413862286' is not returning '8e8bd58e9aee9c88b601'");    

        bytes memory expected815 = hex"dd8afef0c7e3d4a7fb01";
        uint64 value815 = 18108784008520238429;

        Buffer.buffer memory result815 = Leb128.encodeUnsignedLeb128FromUInt64(value815);

        require(keccak256(result815.buf) == keccak256(expected815), "'18108784008520238429' is not returning 'dd8afef0c7e3d4a7fb01'");    

        bytes memory expected816 = hex"f5f7f3a2b1cdccff19";
        uint64 value816 = 1873271405493943285;

        Buffer.buffer memory result816 = Leb128.encodeUnsignedLeb128FromUInt64(value816);

        require(keccak256(result816.buf) == keccak256(expected816), "'1873271405493943285' is not returning 'f5f7f3a2b1cdccff19'");    

        bytes memory expected817 = hex"c8cdd7979fe781957b";
        uint64 value817 = 8874913961157715656;

        Buffer.buffer memory result817 = Leb128.encodeUnsignedLeb128FromUInt64(value817);

        require(keccak256(result817.buf) == keccak256(expected817), "'8874913961157715656' is not returning 'c8cdd7979fe781957b'");    

        bytes memory expected818 = hex"bf8adddae4ce9a95a801";
        uint64 value818 = 12117614803696436543;

        Buffer.buffer memory result818 = Leb128.encodeUnsignedLeb128FromUInt64(value818);

        require(keccak256(result818.buf) == keccak256(expected818), "'12117614803696436543' is not returning 'bf8adddae4ce9a95a801'");    

        bytes memory expected819 = hex"b1b6aab58493c985bd01";
        uint64 value819 = 13622021734351412017;

        Buffer.buffer memory result819 = Leb128.encodeUnsignedLeb128FromUInt64(value819);

        require(keccak256(result819.buf) == keccak256(expected819), "'13622021734351412017' is not returning 'b1b6aab58493c985bd01'");    

        bytes memory expected820 = hex"c6a3dcb4bca7b1e89b01";
        uint64 value820 = 11227690731560178118;

        Buffer.buffer memory result820 = Leb128.encodeUnsignedLeb128FromUInt64(value820);

        require(keccak256(result820.buf) == keccak256(expected820), "'11227690731560178118' is not returning 'c6a3dcb4bca7b1e89b01'");    

        bytes memory expected821 = hex"9dfff597daa88c9bd101";
        uint64 value821 = 15075290977826340765;

        Buffer.buffer memory result821 = Leb128.encodeUnsignedLeb128FromUInt64(value821);

        require(keccak256(result821.buf) == keccak256(expected821), "'15075290977826340765' is not returning '9dfff597daa88c9bd101'");    

        bytes memory expected822 = hex"d2b4cb90e4e4d7be34";
        uint64 value822 = 3782283879983012434;

        Buffer.buffer memory result822 = Leb128.encodeUnsignedLeb128FromUInt64(value822);

        require(keccak256(result822.buf) == keccak256(expected822), "'3782283879983012434' is not returning 'd2b4cb90e4e4d7be34'");    

        bytes memory expected823 = hex"e8a8dfeab2dca6de1f";
        uint64 value823 = 2286873011306353768;

        Buffer.buffer memory result823 = Leb128.encodeUnsignedLeb128FromUInt64(value823);

        require(keccak256(result823.buf) == keccak256(expected823), "'2286873011306353768' is not returning 'e8a8dfeab2dca6de1f'");    

        bytes memory expected824 = hex"f5ad9fc8b8dff5efc801";
        uint64 value824 = 14474524103216191221;

        Buffer.buffer memory result824 = Leb128.encodeUnsignedLeb128FromUInt64(value824);

        require(keccak256(result824.buf) == keccak256(expected824), "'14474524103216191221' is not returning 'f5ad9fc8b8dff5efc801'");    

        bytes memory expected825 = hex"d6a49ec6bdaa94f99101";
        uint64 value825 = 10516557500424622678;

        Buffer.buffer memory result825 = Leb128.encodeUnsignedLeb128FromUInt64(value825);

        require(keccak256(result825.buf) == keccak256(expected825), "'10516557500424622678' is not returning 'd6a49ec6bdaa94f99101'");    

        bytes memory expected826 = hex"c6c2cf94d6b5f18457";
        uint64 value826 = 6271761304563999046;

        Buffer.buffer memory result826 = Leb128.encodeUnsignedLeb128FromUInt64(value826);

        require(keccak256(result826.buf) == keccak256(expected826), "'6271761304563999046' is not returning 'c6c2cf94d6b5f18457'");    

        bytes memory expected827 = hex"9afb9f909ff9c89861";
        uint64 value827 = 7003418245793840538;

        Buffer.buffer memory result827 = Leb128.encodeUnsignedLeb128FromUInt64(value827);

        require(keccak256(result827.buf) == keccak256(expected827), "'7003418245793840538' is not returning '9afb9f909ff9c89861'");    

        bytes memory expected828 = hex"82a2cbdce699ace141";
        uint64 value828 = 4738544158561718530;

        Buffer.buffer memory result828 = Leb128.encodeUnsignedLeb128FromUInt64(value828);

        require(keccak256(result828.buf) == keccak256(expected828), "'4738544158561718530' is not returning '82a2cbdce699ace141'");    

        bytes memory expected829 = hex"d792addbae8e9ad12b";
        uint64 value829 = 3144190332643264855;

        Buffer.buffer memory result829 = Leb128.encodeUnsignedLeb128FromUInt64(value829);

        require(keccak256(result829.buf) == keccak256(expected829), "'3144190332643264855' is not returning 'd792addbae8e9ad12b'");    

        bytes memory expected830 = hex"86b6def9c5e633";
        uint64 value830 = 227823842728710;

        Buffer.buffer memory result830 = Leb128.encodeUnsignedLeb128FromUInt64(value830);

        require(keccak256(result830.buf) == keccak256(expected830), "'227823842728710' is not returning '86b6def9c5e633'");    

        bytes memory expected831 = hex"c3f8baa5c2a8deb39001";
        uint64 value831 = 10405418797642988611;

        Buffer.buffer memory result831 = Leb128.encodeUnsignedLeb128FromUInt64(value831);

        require(keccak256(result831.buf) == keccak256(expected831), "'10405418797642988611' is not returning 'c3f8baa5c2a8deb39001'");    

        bytes memory expected832 = hex"b6bacde3aaf0c79775";
        uint64 value832 = 8444002472442420534;

        Buffer.buffer memory result832 = Leb128.encodeUnsignedLeb128FromUInt64(value832);

        require(keccak256(result832.buf) == keccak256(expected832), "'8444002472442420534' is not returning 'b6bacde3aaf0c79775'");    

        bytes memory expected833 = hex"d8a8c9b2998093e935";
        uint64 value833 = 3878245798820074584;

        Buffer.buffer memory result833 = Leb128.encodeUnsignedLeb128FromUInt64(value833);

        require(keccak256(result833.buf) == keccak256(expected833), "'3878245798820074584' is not returning 'd8a8c9b2998093e935'");    

        bytes memory expected834 = hex"a593d5f29a8ee7986f";
        uint64 value834 = 8012357224138885541;

        Buffer.buffer memory result834 = Leb128.encodeUnsignedLeb128FromUInt64(value834);

        require(keccak256(result834.buf) == keccak256(expected834), "'8012357224138885541' is not returning 'a593d5f29a8ee7986f'");    

        bytes memory expected835 = hex"8289e4fc9f91cb81a601";
        uint64 value835 = 11962454006436529282;

        Buffer.buffer memory result835 = Leb128.encodeUnsignedLeb128FromUInt64(value835);

        require(keccak256(result835.buf) == keccak256(expected835), "'11962454006436529282' is not returning '8289e4fc9f91cb81a601'");    

        bytes memory expected836 = hex"b8aaecc391c596e3af01";
        uint64 value836 = 12665910134576977208;

        Buffer.buffer memory result836 = Leb128.encodeUnsignedLeb128FromUInt64(value836);

        require(keccak256(result836.buf) == keccak256(expected836), "'12665910134576977208' is not returning 'b8aaecc391c596e3af01'");    

        bytes memory expected837 = hex"a7ec9a89bb8ada8fd101";
        uint64 value837 = 15068877586868647463;

        Buffer.buffer memory result837 = Leb128.encodeUnsignedLeb128FromUInt64(value837);

        require(keccak256(result837.buf) == keccak256(expected837), "'15068877586868647463' is not returning 'a7ec9a89bb8ada8fd101'");    

        bytes memory expected838 = hex"81c5c3f9cd9acdb63a";
        uint64 value838 = 4210079315543515777;

        Buffer.buffer memory result838 = Leb128.encodeUnsignedLeb128FromUInt64(value838);

        require(keccak256(result838.buf) == keccak256(expected838), "'4210079315543515777' is not returning '81c5c3f9cd9acdb63a'");    

        bytes memory expected839 = hex"c19495b3bdd4c0b69f01";
        uint64 value839 = 11487841127191890497;

        Buffer.buffer memory result839 = Leb128.encodeUnsignedLeb128FromUInt64(value839);

        require(keccak256(result839.buf) == keccak256(expected839), "'11487841127191890497' is not returning 'c19495b3bdd4c0b69f01'");    

        bytes memory expected840 = hex"81c7f6fc90b1a8c29101";
        uint64 value840 = 10485683442469938049;

        Buffer.buffer memory result840 = Leb128.encodeUnsignedLeb128FromUInt64(value840);

        require(keccak256(result840.buf) == keccak256(expected840), "'10485683442469938049' is not returning '81c7f6fc90b1a8c29101'");    

        bytes memory expected841 = hex"90fc9ce59f8db5be9b01";
        uint64 value841 = 11204063524666424848;

        Buffer.buffer memory result841 = Leb128.encodeUnsignedLeb128FromUInt64(value841);

        require(keccak256(result841.buf) == keccak256(expected841), "'11204063524666424848' is not returning '90fc9ce59f8db5be9b01'");    

        bytes memory expected842 = hex"f486a2afe1f7fd924b";
        uint64 value842 = 5415006522766295924;

        Buffer.buffer memory result842 = Leb128.encodeUnsignedLeb128FromUInt64(value842);

        require(keccak256(result842.buf) == keccak256(expected842), "'5415006522766295924' is not returning 'f486a2afe1f7fd924b'");    

        bytes memory expected843 = hex"fd98bfbce5ffe5a140";
        uint64 value843 = 4630711960513531005;

        Buffer.buffer memory result843 = Leb128.encodeUnsignedLeb128FromUInt64(value843);

        require(keccak256(result843.buf) == keccak256(expected843), "'4630711960513531005' is not returning 'fd98bfbce5ffe5a140'");    

        bytes memory expected844 = hex"deaccbbbcc91d7a137";
        uint64 value844 = 3982128255237019230;

        Buffer.buffer memory result844 = Leb128.encodeUnsignedLeb128FromUInt64(value844);

        require(keccak256(result844.buf) == keccak256(expected844), "'3982128255237019230' is not returning 'deaccbbbcc91d7a137'");    

        bytes memory expected845 = hex"bd80b6cd9198edea5b";
        uint64 value845 = 6617393968943300669;

        Buffer.buffer memory result845 = Leb128.encodeUnsignedLeb128FromUInt64(value845);

        require(keccak256(result845.buf) == keccak256(expected845), "'6617393968943300669' is not returning 'bd80b6cd9198edea5b'");    

        bytes memory expected846 = hex"e4d3f497d688c9f613";
        uint64 value846 = 1435843736633158116;

        Buffer.buffer memory result846 = Leb128.encodeUnsignedLeb128FromUInt64(value846);

        require(keccak256(result846.buf) == keccak256(expected846), "'1435843736633158116' is not returning 'e4d3f497d688c9f613'");    

        bytes memory expected847 = hex"ccb9dfd9b8c2e9f1c401";
        uint64 value847 = 14187365854017477836;

        Buffer.buffer memory result847 = Leb128.encodeUnsignedLeb128FromUInt64(value847);

        require(keccak256(result847.buf) == keccak256(expected847), "'14187365854017477836' is not returning 'ccb9dfd9b8c2e9f1c401'");    

        bytes memory expected848 = hex"e9c296e2cee2f59c79";
        uint64 value848 = 8735249437125091689;

        Buffer.buffer memory result848 = Leb128.encodeUnsignedLeb128FromUInt64(value848);

        require(keccak256(result848.buf) == keccak256(expected848), "'8735249437125091689' is not returning 'e9c296e2cee2f59c79'");    

        bytes memory expected849 = hex"ebbbddcabd82c7be58";
        uint64 value849 = 6376283519002828267;

        Buffer.buffer memory result849 = Leb128.encodeUnsignedLeb128FromUInt64(value849);

        require(keccak256(result849.buf) == keccak256(expected849), "'6376283519002828267' is not returning 'ebbbddcabd82c7be58'");    

        bytes memory expected850 = hex"9fdbacdcacc891e132";
        uint64 value850 = 3657563100074945951;

        Buffer.buffer memory result850 = Leb128.encodeUnsignedLeb128FromUInt64(value850);

        require(keccak256(result850.buf) == keccak256(expected850), "'3657563100074945951' is not returning '9fdbacdcacc891e132'");    

        bytes memory expected851 = hex"a9d4edc2a3a9e7ca3d";
        uint64 value851 = 4437625949942147625;

        Buffer.buffer memory result851 = Leb128.encodeUnsignedLeb128FromUInt64(value851);

        require(keccak256(result851.buf) == keccak256(expected851), "'4437625949942147625' is not returning 'a9d4edc2a3a9e7ca3d'");    

        bytes memory expected852 = hex"a8d6d8e1979c9a961a";
        uint64 value852 = 1885997661622250280;

        Buffer.buffer memory result852 = Leb128.encodeUnsignedLeb128FromUInt64(value852);

        require(keccak256(result852.buf) == keccak256(expected852), "'1885997661622250280' is not returning 'a8d6d8e1979c9a961a'");    

        bytes memory expected853 = hex"9cb09fd294a2b19ae801";
        uint64 value853 = 16732215193639573532;

        Buffer.buffer memory result853 = Leb128.encodeUnsignedLeb128FromUInt64(value853);

        require(keccak256(result853.buf) == keccak256(expected853), "'16732215193639573532' is not returning '9cb09fd294a2b19ae801'");    

        bytes memory expected854 = hex"bdf3f6b79a83ead24e";
        uint64 value854 = 5667120534244932029;

        Buffer.buffer memory result854 = Leb128.encodeUnsignedLeb128FromUInt64(value854);

        require(keccak256(result854.buf) == keccak256(expected854), "'5667120534244932029' is not returning 'bdf3f6b79a83ead24e'");    

        bytes memory expected855 = hex"d4f5fb82de88d58ea401";
        uint64 value855 = 11825700855638588116;

        Buffer.buffer memory result855 = Leb128.encodeUnsignedLeb128FromUInt64(value855);

        require(keccak256(result855.buf) == keccak256(expected855), "'11825700855638588116' is not returning 'd4f5fb82de88d58ea401'");    

        bytes memory expected856 = hex"95fcc4dbe7d1cbea3e";
        uint64 value856 = 4527576189882154517;

        Buffer.buffer memory result856 = Leb128.encodeUnsignedLeb128FromUInt64(value856);

        require(keccak256(result856.buf) == keccak256(expected856), "'4527576189882154517' is not returning '95fcc4dbe7d1cbea3e'");    

        bytes memory expected857 = hex"c79381dfe8c3f9e211";
        uint64 value857 = 1280682687926913479;

        Buffer.buffer memory result857 = Leb128.encodeUnsignedLeb128FromUInt64(value857);

        require(keccak256(result857.buf) == keccak256(expected857), "'1280682687926913479' is not returning 'c79381dfe8c3f9e211'");    

        bytes memory expected858 = hex"b4b88ba3d3cde4958701";
        uint64 value858 = 9740039616846814260;

        Buffer.buffer memory result858 = Leb128.encodeUnsignedLeb128FromUInt64(value858);

        require(keccak256(result858.buf) == keccak256(expected858), "'9740039616846814260' is not returning 'b4b88ba3d3cde4958701'");    

    }
}
