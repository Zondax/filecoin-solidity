
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
contract Leb128Generated14Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {

        bytes memory expected910 = hex"dccb83cfb097edbc4c";
        uint64 value910 = 5510634334482130396;

        Buffer.buffer memory result910 = Leb128.encodeUnsignedLeb128FromUInt64(value910);

        require(keccak256(result910.buf) == keccak256(expected910), "'5510634334482130396' is not returning 'dccb83cfb097edbc4c'");

        bytes memory expected911 = hex"c0f291e4ea8fc0b6f201";
        uint64 value911 = 17468619073700264256;

        Buffer.buffer memory result911 = Leb128.encodeUnsignedLeb128FromUInt64(value911);

        require(keccak256(result911.buf) == keccak256(expected911), "'17468619073700264256' is not returning 'c0f291e4ea8fc0b6f201'");

        bytes memory expected912 = hex"99b3bbb5a4f8899efd01";
        uint64 value912 = 18247503505561409945;

        Buffer.buffer memory result912 = Leb128.encodeUnsignedLeb128FromUInt64(value912);

        require(keccak256(result912.buf) == keccak256(expected912), "'18247503505561409945' is not returning '99b3bbb5a4f8899efd01'");

        bytes memory expected913 = hex"f4b8b5b4a1f3d0cc1b";
        uint64 value913 = 1988695039543172212;

        Buffer.buffer memory result913 = Leb128.encodeUnsignedLeb128FromUInt64(value913);

        require(keccak256(result913.buf) == keccak256(expected913), "'1988695039543172212' is not returning 'f4b8b5b4a1f3d0cc1b'");

        bytes memory expected914 = hex"909ceacb8edbe7aabe01";
        uint64 value914 = 13715042894693961232;

        Buffer.buffer memory result914 = Leb128.encodeUnsignedLeb128FromUInt64(value914);

        require(keccak256(result914.buf) == keccak256(expected914), "'13715042894693961232' is not returning '909ceacb8edbe7aabe01'");

        bytes memory expected915 = hex"a29ca3c2cef9b5821c";
        uint64 value915 = 2018975808039210530;

        Buffer.buffer memory result915 = Leb128.encodeUnsignedLeb128FromUInt64(value915);

        require(keccak256(result915.buf) == keccak256(expected915), "'2018975808039210530' is not returning 'a29ca3c2cef9b5821c'");

        bytes memory expected916 = hex"91b7bffb81c1c3e3d401";
        uint64 value916 = 15332238884456094609;

        Buffer.buffer memory result916 = Leb128.encodeUnsignedLeb128FromUInt64(value916);

        require(keccak256(result916.buf) == keccak256(expected916), "'15332238884456094609' is not returning '91b7bffb81c1c3e3d401'");

        bytes memory expected917 = hex"f69a8de5f2dda69a6a";
        uint64 value917 = 7652912018846076278;

        Buffer.buffer memory result917 = Leb128.encodeUnsignedLeb128FromUInt64(value917);

        require(keccak256(result917.buf) == keccak256(expected917), "'7652912018846076278' is not returning 'f69a8de5f2dda69a6a'");

        bytes memory expected918 = hex"b2e2ea85b4a5eae9da01";
        uint64 value918 = 15768132723588903218;

        Buffer.buffer memory result918 = Leb128.encodeUnsignedLeb128FromUInt64(value918);

        require(keccak256(result918.buf) == keccak256(expected918), "'15768132723588903218' is not returning 'b2e2ea85b4a5eae9da01'");

        bytes memory expected919 = hex"d18799de8a8fa090f101";
        uint64 value919 = 17375028618161701841;

        Buffer.buffer memory result919 = Leb128.encodeUnsignedLeb128FromUInt64(value919);

        require(keccak256(result919.buf) == keccak256(expected919), "'17375028618161701841' is not returning 'd18799de8a8fa090f101'");

        bytes memory expected920 = hex"f3affec0fdb7a8a88c01";
        uint64 value920 = 10110759008783538163;

        Buffer.buffer memory result920 = Leb128.encodeUnsignedLeb128FromUInt64(value920);

        require(keccak256(result920.buf) == keccak256(expected920), "'10110759008783538163' is not returning 'f3affec0fdb7a8a88c01'");

        bytes memory expected921 = hex"82808b9f9caca3b22f";
        uint64 value921 = 3415009868491440130;

        Buffer.buffer memory result921 = Leb128.encodeUnsignedLeb128FromUInt64(value921);

        require(keccak256(result921.buf) == keccak256(expected921), "'3415009868491440130' is not returning '82808b9f9caca3b22f'");

        bytes memory expected922 = hex"acb8aeb4c2a8a2fad701";
        uint64 value922 = 15561213538269371436;

        Buffer.buffer memory result922 = Leb128.encodeUnsignedLeb128FromUInt64(value922);

        require(keccak256(result922.buf) == keccak256(expected922), "'15561213538269371436' is not returning 'acb8aeb4c2a8a2fad701'");

        bytes memory expected923 = hex"a59ff9a68fc5c5c5d401";
        uint64 value923 = 15315359322966216613;

        Buffer.buffer memory result923 = Leb128.encodeUnsignedLeb128FromUInt64(value923);

        require(keccak256(result923.buf) == keccak256(expected923), "'15315359322966216613' is not returning 'a59ff9a68fc5c5c5d401'");

        bytes memory expected924 = hex"8fc895b2be949e8f22";
        uint64 value924 = 2458535091929179151;

        Buffer.buffer memory result924 = Leb128.encodeUnsignedLeb128FromUInt64(value924);

        require(keccak256(result924.buf) == keccak256(expected924), "'2458535091929179151' is not returning '8fc895b2be949e8f22'");

        bytes memory expected925 = hex"eb9da081b197c6f2f001";
        uint64 value925 = 17358307530478456555;

        Buffer.buffer memory result925 = Leb128.encodeUnsignedLeb128FromUInt64(value925);

        require(keccak256(result925.buf) == keccak256(expected925), "'17358307530478456555' is not returning 'eb9da081b197c6f2f001'");

        bytes memory expected926 = hex"fef9bcd2ecedfd9766";
        uint64 value926 = 7363375970986704126;

        Buffer.buffer memory result926 = Leb128.encodeUnsignedLeb128FromUInt64(value926);

        require(keccak256(result926.buf) == keccak256(expected926), "'7363375970986704126' is not returning 'fef9bcd2ecedfd9766'");

        bytes memory expected927 = hex"88cecbbbd4ccf3c4cc01";
        uint64 value927 = 14738538189932390152;

        Buffer.buffer memory result927 = Leb128.encodeUnsignedLeb128FromUInt64(value927);

        require(keccak256(result927.buf) == keccak256(expected927), "'14738538189932390152' is not returning '88cecbbbd4ccf3c4cc01'");

        bytes memory expected928 = hex"aca4adb986c5b0b3c801";
        uint64 value928 = 14440442733995446828;

        Buffer.buffer memory result928 = Leb128.encodeUnsignedLeb128FromUInt64(value928);

        require(keccak256(result928.buf) == keccak256(expected928), "'14440442733995446828' is not returning 'aca4adb986c5b0b3c801'");

        bytes memory expected929 = hex"c4e5f292dfeb8eab13";
        uint64 value929 = 1393366409401905860;

        Buffer.buffer memory result929 = Leb128.encodeUnsignedLeb128FromUInt64(value929);

        require(keccak256(result929.buf) == keccak256(expected929), "'1393366409401905860' is not returning 'c4e5f292dfeb8eab13'");

        bytes memory expected930 = hex"d780ffb2c798a5af1a";
        uint64 value930 = 1900119664317415511;

        Buffer.buffer memory result930 = Leb128.encodeUnsignedLeb128FromUInt64(value930);

        require(keccak256(result930.buf) == keccak256(expected930), "'1900119664317415511' is not returning 'd780ffb2c798a5af1a'");

        bytes memory expected931 = hex"d6fbc49eb4faece7c301";
        uint64 value931 = 14109693877532310998;

        Buffer.buffer memory result931 = Leb128.encodeUnsignedLeb128FromUInt64(value931);

        require(keccak256(result931.buf) == keccak256(expected931), "'14109693877532310998' is not returning 'd6fbc49eb4faece7c301'");

        bytes memory expected932 = hex"82bcdde99b91e4fccc01";
        uint64 value932 = 14769995374197693954;

        Buffer.buffer memory result932 = Leb128.encodeUnsignedLeb128FromUInt64(value932);

        require(keccak256(result932.buf) == keccak256(expected932), "'14769995374197693954' is not returning '82bcdde99b91e4fccc01'");

        bytes memory expected933 = hex"b0a7e3f7d2e9d6b145";
        uint64 value933 = 4999940398370050992;

        Buffer.buffer memory result933 = Leb128.encodeUnsignedLeb128FromUInt64(value933);

        require(keccak256(result933.buf) == keccak256(expected933), "'4999940398370050992' is not returning 'b0a7e3f7d2e9d6b145'");

        bytes memory expected934 = hex"e49cb8fe88859b8646";
        uint64 value934 = 5047528203842621028;

        Buffer.buffer memory result934 = Leb128.encodeUnsignedLeb128FromUInt64(value934);

        require(keccak256(result934.buf) == keccak256(expected934), "'5047528203842621028' is not returning 'e49cb8fe88859b8646'");

        bytes memory expected935 = hex"a185a8fcaa98d1f067";
        uint64 value935 = 7485339658625876641;

        Buffer.buffer memory result935 = Leb128.encodeUnsignedLeb128FromUInt64(value935);

        require(keccak256(result935.buf) == keccak256(expected935), "'7485339658625876641' is not returning 'a185a8fcaa98d1f067'");

        bytes memory expected936 = hex"85a6f18fa5a0d1e09e01";
        uint64 value936 = 11439500404765512453;

        Buffer.buffer memory result936 = Leb128.encodeUnsignedLeb128FromUInt64(value936);

        require(keccak256(result936.buf) == keccak256(expected936), "'11439500404765512453' is not returning '85a6f18fa5a0d1e09e01'");

        bytes memory expected937 = hex"aeac8288c1e7f98070";
        uint64 value937 = 8070986252393944622;

        Buffer.buffer memory result937 = Leb128.encodeUnsignedLeb128FromUInt64(value937);

        require(keccak256(result937.buf) == keccak256(expected937), "'8070986252393944622' is not returning 'aeac8288c1e7f98070'");

        bytes memory expected938 = hex"a2afa0f6899ee3c90e";
        uint64 value938 = 1050338103191410594;

        Buffer.buffer memory result938 = Leb128.encodeUnsignedLeb128FromUInt64(value938);

        require(keccak256(result938.buf) == keccak256(expected938), "'1050338103191410594' is not returning 'a2afa0f6899ee3c90e'");

        bytes memory expected939 = hex"9acfce97d6b3b6f2ad01";
        uint64 value939 = 12530379333244790682;

        Buffer.buffer memory result939 = Leb128.encodeUnsignedLeb128FromUInt64(value939);

        require(keccak256(result939.buf) == keccak256(expected939), "'12530379333244790682' is not returning '9acfce97d6b3b6f2ad01'");

        bytes memory expected940 = hex"eda0ca89cabcc9e813";
        uint64 value940 = 1427964220740374637;

        Buffer.buffer memory result940 = Leb128.encodeUnsignedLeb128FromUInt64(value940);

        require(keccak256(result940.buf) == keccak256(expected940), "'1427964220740374637' is not returning 'eda0ca89cabcc9e813'");

        bytes memory expected941 = hex"82b1c7b6d1ebefb454";
        uint64 value941 = 6082603178276280450;

        Buffer.buffer memory result941 = Leb128.encodeUnsignedLeb128FromUInt64(value941);

        require(keccak256(result941.buf) == keccak256(expected941), "'6082603178276280450' is not returning '82b1c7b6d1ebefb454'");

        bytes memory expected942 = hex"85ebdf98f1bdff9e48";
        uint64 value942 = 5205595947569509765;

        Buffer.buffer memory result942 = Leb128.encodeUnsignedLeb128FromUInt64(value942);

        require(keccak256(result942.buf) == keccak256(expected942), "'5205595947569509765' is not returning '85ebdf98f1bdff9e48'");

        bytes memory expected943 = hex"90ebddf3dcf0cc9679";
        uint64 value943 = 8731691902328862096;

        Buffer.buffer memory result943 = Leb128.encodeUnsignedLeb128FromUInt64(value943);

        require(keccak256(result943.buf) == keccak256(expected943), "'8731691902328862096' is not returning '90ebddf3dcf0cc9679'");

        bytes memory expected944 = hex"8de58cfb85fc9a8834";
        uint64 value944 = 3751617101016806029;

        Buffer.buffer memory result944 = Leb128.encodeUnsignedLeb128FromUInt64(value944);

        require(keccak256(result944.buf) == keccak256(expected944), "'3751617101016806029' is not returning '8de58cfb85fc9a8834'");

        bytes memory expected945 = hex"b0e6c8dfc989c6b8c601";
        uint64 value945 = 14299237009190957872;

        Buffer.buffer memory result945 = Leb128.encodeUnsignedLeb128FromUInt64(value945);

        require(keccak256(result945.buf) == keccak256(expected945), "'14299237009190957872' is not returning 'b0e6c8dfc989c6b8c601'");

        bytes memory expected946 = hex"b589c9e8d598c2b9c001";
        uint64 value946 = 13867437321366946997;

        Buffer.buffer memory result946 = Leb128.encodeUnsignedLeb128FromUInt64(value946);

        require(keccak256(result946.buf) == keccak256(expected946), "'13867437321366946997' is not returning 'b589c9e8d598c2b9c001'");

        bytes memory expected947 = hex"8dd9de9cf7fcc2cea001";
        uint64 value947 = 11573419706116713613;

        Buffer.buffer memory result947 = Leb128.encodeUnsignedLeb128FromUInt64(value947);

        require(keccak256(result947.buf) == keccak256(expected947), "'11573419706116713613' is not returning '8dd9de9cf7fcc2cea001'");

        bytes memory expected948 = hex"9acbaed4d3e781b41e";
        uint64 value948 = 2191009178272376218;

        Buffer.buffer memory result948 = Leb128.encodeUnsignedLeb128FromUInt64(value948);

        require(keccak256(result948.buf) == keccak256(expected948), "'2191009178272376218' is not returning '9acbaed4d3e781b41e'");

        bytes memory expected949 = hex"ca94c7d6ff9c86db9401";
        uint64 value949 = 10715779747999238730;

        Buffer.buffer memory result949 = Leb128.encodeUnsignedLeb128FromUInt64(value949);

        require(keccak256(result949.buf) == keccak256(expected949), "'10715779747999238730' is not returning 'ca94c7d6ff9c86db9401'");

        bytes memory expected950 = hex"a193f2bfc3b5a2a69101";
        uint64 value950 = 10469894606496237985;

        Buffer.buffer memory result950 = Leb128.encodeUnsignedLeb128FromUInt64(value950);

        require(keccak256(result950.buf) == keccak256(expected950), "'10469894606496237985' is not returning 'a193f2bfc3b5a2a69101'");

        bytes memory expected951 = hex"ccdfeeaeaaa196c1c401";
        uint64 value951 = 14159978080673443788;

        Buffer.buffer memory result951 = Leb128.encodeUnsignedLeb128FromUInt64(value951);

        require(keccak256(result951.buf) == keccak256(expected951), "'14159978080673443788' is not returning 'ccdfeeaeaaa196c1c401'");

        bytes memory expected952 = hex"de89b8deca9dd4c8bc01";
        uint64 value952 = 13587730528178406622;

        Buffer.buffer memory result952 = Leb128.encodeUnsignedLeb128FromUInt64(value952);

        require(keccak256(result952.buf) == keccak256(expected952), "'13587730528178406622' is not returning 'de89b8deca9dd4c8bc01'");

        bytes memory expected953 = hex"dcb3d98298efe49c9c01";
        uint64 value953 = 11257190893642734044;

        Buffer.buffer memory result953 = Leb128.encodeUnsignedLeb128FromUInt64(value953);

        require(keccak256(result953.buf) == keccak256(expected953), "'11257190893642734044' is not returning 'dcb3d98298efe49c9c01'");

        bytes memory expected954 = hex"9df9d3be828df5d228";
        uint64 value954 = 2928980676484332701;

        Buffer.buffer memory result954 = Leb128.encodeUnsignedLeb128FromUInt64(value954);

        require(keccak256(result954.buf) == keccak256(expected954), "'2928980676484332701' is not returning '9df9d3be828df5d228'");

        bytes memory expected955 = hex"9b8a87df86daf5e8e401";
        uint64 value955 = 16488195901431596315;

        Buffer.buffer memory result955 = Leb128.encodeUnsignedLeb128FromUInt64(value955);

        require(keccak256(result955.buf) == keccak256(expected955), "'16488195901431596315' is not returning '9b8a87df86daf5e8e401'");

        bytes memory expected956 = hex"d2eeedb795d5d1af3b";
        uint64 value956 = 4278215864147998546;

        Buffer.buffer memory result956 = Leb128.encodeUnsignedLeb128FromUInt64(value956);

        require(keccak256(result956.buf) == keccak256(expected956), "'4278215864147998546' is not returning 'd2eeedb795d5d1af3b'");

        bytes memory expected957 = hex"ecf6df81c0b3c0ff3b";
        uint64 value957 = 4323175936829160300;

        Buffer.buffer memory result957 = Leb128.encodeUnsignedLeb128FromUInt64(value957);

        require(keccak256(result957.buf) == keccak256(expected957), "'4323175936829160300' is not returning 'ecf6df81c0b3c0ff3b'");

        bytes memory expected958 = hex"87f1f2af8cd7f9bbb501";
        uint64 value958 = 13076173724363569287;

        Buffer.buffer memory result958 = Leb128.encodeUnsignedLeb128FromUInt64(value958);

        require(keccak256(result958.buf) == keccak256(expected958), "'13076173724363569287' is not returning '87f1f2af8cd7f9bbb501'");

        bytes memory expected959 = hex"fedf8ab0c5d9cefc78";
        uint64 value959 = 8717063203043061758;

        Buffer.buffer memory result959 = Leb128.encodeUnsignedLeb128FromUInt64(value959);

        require(keccak256(result959.buf) == keccak256(expected959), "'8717063203043061758' is not returning 'fedf8ab0c5d9cefc78'");

        bytes memory expected960 = hex"db84cdb88a9891a847";
        uint64 value960 = 5138682769057202779;

        Buffer.buffer memory result960 = Leb128.encodeUnsignedLeb128FromUInt64(value960);

        require(keccak256(result960.buf) == keccak256(expected960), "'5138682769057202779' is not returning 'db84cdb88a9891a847'");

        bytes memory expected961 = hex"fc84a0b391d0b898b901";
        uint64 value961 = 13344414739953353340;

        Buffer.buffer memory result961 = Leb128.encodeUnsignedLeb128FromUInt64(value961);

        require(keccak256(result961.buf) == keccak256(expected961), "'13344414739953353340' is not returning 'fc84a0b391d0b898b901'");

        bytes memory expected962 = hex"bcfea2aec2d18bdc9901";
        uint64 value962 = 11076654462981947196;

        Buffer.buffer memory result962 = Leb128.encodeUnsignedLeb128FromUInt64(value962);

        require(keccak256(result962.buf) == keccak256(expected962), "'11076654462981947196' is not returning 'bcfea2aec2d18bdc9901'");

        bytes memory expected963 = hex"dfa4e98cfdcb8fb475";
        uint64 value963 = 8460080481274843743;

        Buffer.buffer memory result963 = Leb128.encodeUnsignedLeb128FromUInt64(value963);

        require(keccak256(result963.buf) == keccak256(expected963), "'8460080481274843743' is not returning 'dfa4e98cfdcb8fb475'");

        bytes memory expected964 = hex"b7bbf7e49abbc5f6bd01";
        uint64 value964 = 13685618867296918967;

        Buffer.buffer memory result964 = Leb128.encodeUnsignedLeb128FromUInt64(value964);

        require(keccak256(result964.buf) == keccak256(expected964), "'13685618867296918967' is not returning 'b7bbf7e49abbc5f6bd01'");

        bytes memory expected965 = hex"d3bc9da8cce696e16f";
        uint64 value965 = 8053099365893889619;

        Buffer.buffer memory result965 = Leb128.encodeUnsignedLeb128FromUInt64(value965);

        require(keccak256(result965.buf) == keccak256(expected965), "'8053099365893889619' is not returning 'd3bc9da8cce696e16f'");

        bytes memory expected966 = hex"c7f990daf8c5db959201";
        uint64 value966 = 10532633304015060167;

        Buffer.buffer memory result966 = Leb128.encodeUnsignedLeb128FromUInt64(value966);

        require(keccak256(result966.buf) == keccak256(expected966), "'10532633304015060167' is not returning 'c7f990daf8c5db959201'");

        bytes memory expected967 = hex"c4a0afb4b887f79a9a01";
        uint64 value967 = 11112029803825057860;

        Buffer.buffer memory result967 = Leb128.encodeUnsignedLeb128FromUInt64(value967);

        require(keccak256(result967.buf) == keccak256(expected967), "'11112029803825057860' is not returning 'c4a0afb4b887f79a9a01'");

        bytes memory expected968 = hex"faa6f4bccdc7dffd6f";
        uint64 value968 = 8069181957144908666;

        Buffer.buffer memory result968 = Leb128.encodeUnsignedLeb128FromUInt64(value968);

        require(keccak256(result968.buf) == keccak256(expected968), "'8069181957144908666' is not returning 'faa6f4bccdc7dffd6f'");

        bytes memory expected969 = hex"f193a2b9da9defee71";
        uint64 value969 = 8204921825036634609;

        Buffer.buffer memory result969 = Leb128.encodeUnsignedLeb128FromUInt64(value969);

        require(keccak256(result969.buf) == keccak256(expected969), "'8204921825036634609' is not returning 'f193a2b9da9defee71'");

        bytes memory expected970 = hex"d4f9f1aef9a4c8ad33";
        uint64 value970 = 3700587972716690644;

        Buffer.buffer memory result970 = Leb128.encodeUnsignedLeb128FromUInt64(value970);

        require(keccak256(result970.buf) == keccak256(expected970), "'3700587972716690644' is not returning 'd4f9f1aef9a4c8ad33'");

        bytes memory expected971 = hex"f3bd85f5bf81e4d68301";
        uint64 value971 = 9488398371130531571;

        Buffer.buffer memory result971 = Leb128.encodeUnsignedLeb128FromUInt64(value971);

        require(keccak256(result971.buf) == keccak256(expected971), "'9488398371130531571' is not returning 'f3bd85f5bf81e4d68301'");

        bytes memory expected972 = hex"beb5adbdf2ebf2c113";
        uint64 value972 = 1406191118217599678;

        Buffer.buffer memory result972 = Leb128.encodeUnsignedLeb128FromUInt64(value972);

        require(keccak256(result972.buf) == keccak256(expected972), "'1406191118217599678' is not returning 'beb5adbdf2ebf2c113'");

        bytes memory expected973 = hex"84e9f8bfe688e994c901";
        uint64 value973 = 14495297497968030852;

        Buffer.buffer memory result973 = Leb128.encodeUnsignedLeb128FromUInt64(value973);

        require(keccak256(result973.buf) == keccak256(expected973), "'14495297497968030852' is not returning '84e9f8bfe688e994c901'");

        bytes memory expected974 = hex"adf191ee948e84b069";
        uint64 value974 = 7593087050568726701;

        Buffer.buffer memory result974 = Leb128.encodeUnsignedLeb128FromUInt64(value974);

        require(keccak256(result974.buf) == keccak256(expected974), "'7593087050568726701' is not returning 'adf191ee948e84b069'");

        bytes memory expected975 = hex"a396c28dcebc8fecbd01";
        uint64 value975 = 13679751921386162979;

        Buffer.buffer memory result975 = Leb128.encodeUnsignedLeb128FromUInt64(value975);

        require(keccak256(result975.buf) == keccak256(expected975), "'13679751921386162979' is not returning 'a396c28dcebc8fecbd01'");

        bytes memory expected976 = hex"bbf3edaca2edcab572";
        uint64 value976 = 8244731277729298875;

        Buffer.buffer memory result976 = Leb128.encodeUnsignedLeb128FromUInt64(value976);

        require(keccak256(result976.buf) == keccak256(expected976), "'8244731277729298875' is not returning 'bbf3edaca2edcab572'");

        bytes memory expected977 = hex"d4eafca3d998ead63d";
        uint64 value977 = 4444393973837935956;

        Buffer.buffer memory result977 = Leb128.encodeUnsignedLeb128FromUInt64(value977);

        require(keccak256(result977.buf) == keccak256(expected977), "'4444393973837935956' is not returning 'd4eafca3d998ead63d'");

        bytes memory expected978 = hex"c887bfdab59be38e38";
        uint64 value978 = 4043542914206254024;

        Buffer.buffer memory result978 = Leb128.encodeUnsignedLeb128FromUInt64(value978);

        require(keccak256(result978.buf) == keccak256(expected978), "'4043542914206254024' is not returning 'c887bfdab59be38e38'");

    }
}
