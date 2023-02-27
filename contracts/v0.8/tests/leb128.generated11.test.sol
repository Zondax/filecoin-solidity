
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
contract Leb128Generated11Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {

        bytes memory expected860 = hex"e9e3fbc98fb4ecd8f001";
        uint64 value860 = 17343838944915026409;

        Buffer.buffer memory result860 = Leb128.encodeUnsignedLeb128FromUInt64(value860);

        require(keccak256(result860.buf) == keccak256(expected860), "'17343838944915026409' is not returning 'e9e3fbc98fb4ecd8f001'");    

        bytes memory expected861 = hex"9ab8b1f899ad8ecae701";
        uint64 value861 = 16687025645117266970;

        Buffer.buffer memory result861 = Leb128.encodeUnsignedLeb128FromUInt64(value861);

        require(keccak256(result861.buf) == keccak256(expected861), "'16687025645117266970' is not returning '9ab8b1f899ad8ecae701'");    

        bytes memory expected862 = hex"8ade8bf6b3a799bdd901";
        uint64 value862 = 15670949158519500554;

        Buffer.buffer memory result862 = Leb128.encodeUnsignedLeb128FromUInt64(value862);

        require(keccak256(result862.buf) == keccak256(expected862), "'15670949158519500554' is not returning '8ade8bf6b3a799bdd901'");    

        bytes memory expected863 = hex"a397bd9e8080cec1e401";
        uint64 value863 = 16466066235311737763;

        Buffer.buffer memory result863 = Leb128.encodeUnsignedLeb128FromUInt64(value863);

        require(keccak256(result863.buf) == keccak256(expected863), "'16466066235311737763' is not returning 'a397bd9e8080cec1e401'");    

        bytes memory expected864 = hex"f4bec8d0e0a78eb8d601";
        uint64 value864 = 15451913260127887220;

        Buffer.buffer memory result864 = Leb128.encodeUnsignedLeb128FromUInt64(value864);

        require(keccak256(result864.buf) == keccak256(expected864), "'15451913260127887220' is not returning 'f4bec8d0e0a78eb8d601'");    

        bytes memory expected865 = hex"8581e5a187a4d6e18001";
        uint64 value865 = 9278357653237088389;

        Buffer.buffer memory result865 = Leb128.encodeUnsignedLeb128FromUInt64(value865);

        require(keccak256(result865.buf) == keccak256(expected865), "'9278357653237088389' is not returning '8581e5a187a4d6e18001'");    

        bytes memory expected866 = hex"94adc58eeac092f70e";
        uint64 value866 = 1075878753333237396;

        Buffer.buffer memory result866 = Leb128.encodeUnsignedLeb128FromUInt64(value866);

        require(keccak256(result866.buf) == keccak256(expected866), "'1075878753333237396' is not returning '94adc58eeac092f70e'");    

        bytes memory expected867 = hex"baafea93f5e0b3b931";
        uint64 value867 = 3563137885558970298;

        Buffer.buffer memory result867 = Leb128.encodeUnsignedLeb128FromUInt64(value867);

        require(keccak256(result867.buf) == keccak256(expected867), "'3563137885558970298' is not returning 'baafea93f5e0b3b931'");    

        bytes memory expected868 = hex"a0a4af8cbfa7a2817b";
        uint64 value868 = 8863797907167105568;

        Buffer.buffer memory result868 = Leb128.encodeUnsignedLeb128FromUInt64(value868);

        require(keccak256(result868.buf) == keccak256(expected868), "'8863797907167105568' is not returning 'a0a4af8cbfa7a2817b'");    

        bytes memory expected869 = hex"93ef8483e3a88a990a";
        uint64 value869 = 734695070650939283;

        Buffer.buffer memory result869 = Leb128.encodeUnsignedLeb128FromUInt64(value869);

        require(keccak256(result869.buf) == keccak256(expected869), "'734695070650939283' is not returning '93ef8483e3a88a990a'");    

        bytes memory expected870 = hex"d7c589a8eff6bd866f";
        uint64 value870 = 8002043003097211607;

        Buffer.buffer memory result870 = Leb128.encodeUnsignedLeb128FromUInt64(value870);

        require(keccak256(result870.buf) == keccak256(expected870), "'8002043003097211607' is not returning 'd7c589a8eff6bd866f'");    

        bytes memory expected871 = hex"81d5c1ca88b79b8848";
        uint64 value871 = 5192771009703340673;

        Buffer.buffer memory result871 = Leb128.encodeUnsignedLeb128FromUInt64(value871);

        require(keccak256(result871.buf) == keccak256(expected871), "'5192771009703340673' is not returning '81d5c1ca88b79b8848'");    

        bytes memory expected872 = hex"ce97c1af80b7eaf2b601";
        uint64 value872 = 13179126492408335310;

        Buffer.buffer memory result872 = Leb128.encodeUnsignedLeb128FromUInt64(value872);

        require(keccak256(result872.buf) == keccak256(expected872), "'13179126492408335310' is not returning 'ce97c1af80b7eaf2b601'");    

        bytes memory expected873 = hex"f7b0fef2a08e99f2f601";
        uint64 value873 = 17790454869050497143;

        Buffer.buffer memory result873 = Leb128.encodeUnsignedLeb128FromUInt64(value873);

        require(keccak256(result873.buf) == keccak256(expected873), "'17790454869050497143' is not returning 'f7b0fef2a08e99f2f601'");    

        bytes memory expected874 = hex"aac8bfc09ae4bfda69";
        uint64 value874 = 7616993389808968746;

        Buffer.buffer memory result874 = Leb128.encodeUnsignedLeb128FromUInt64(value874);

        require(keccak256(result874.buf) == keccak256(expected874), "'7616993389808968746' is not returning 'aac8bfc09ae4bfda69'");    

        bytes memory expected875 = hex"8cf78dacadf1d7bbe201";
        uint64 value875 = 16318616824692571020;

        Buffer.buffer memory result875 = Leb128.encodeUnsignedLeb128FromUInt64(value875);

        require(keccak256(result875.buf) == keccak256(expected875), "'16318616824692571020' is not returning '8cf78dacadf1d7bbe201'");    

        bytes memory expected876 = hex"92a1ae81c4efb7d379";
        uint64 value876 = 8765939449468784786;

        Buffer.buffer memory result876 = Leb128.encodeUnsignedLeb128FromUInt64(value876);

        require(keccak256(result876.buf) == keccak256(expected876), "'8765939449468784786' is not returning '92a1ae81c4efb7d379'");    

        bytes memory expected877 = hex"a9c4fbc697bdd88501";
        uint64 value877 = 75261474164892201;

        Buffer.buffer memory result877 = Leb128.encodeUnsignedLeb128FromUInt64(value877);

        require(keccak256(result877.buf) == keccak256(expected877), "'75261474164892201' is not returning 'a9c4fbc697bdd88501'");    

        bytes memory expected878 = hex"ee91ae86a2f4c0be2b";
        uint64 value878 = 3133664910589528302;

        Buffer.buffer memory result878 = Leb128.encodeUnsignedLeb128FromUInt64(value878);

        require(keccak256(result878.buf) == keccak256(expected878), "'3133664910589528302' is not returning 'ee91ae86a2f4c0be2b'");    

        bytes memory expected879 = hex"bcdc9ab483cad4c1d101";
        uint64 value879 = 15097000880341691964;

        Buffer.buffer memory result879 = Leb128.encodeUnsignedLeb128FromUInt64(value879);

        require(keccak256(result879.buf) == keccak256(expected879), "'15097000880341691964' is not returning 'bcdc9ab483cad4c1d101'");    

        bytes memory expected880 = hex"e1e4a3a2dfc9f0f929";
        uint64 value880 = 3022973414962426465;

        Buffer.buffer memory result880 = Leb128.encodeUnsignedLeb128FromUInt64(value880);

        require(keccak256(result880.buf) == keccak256(expected880), "'3022973414962426465' is not returning 'e1e4a3a2dfc9f0f929'");    

        bytes memory expected881 = hex"aacfbcb19785a1ec4d";
        uint64 value881 = 5609378649501280170;

        Buffer.buffer memory result881 = Leb128.encodeUnsignedLeb128FromUInt64(value881);

        require(keccak256(result881.buf) == keccak256(expected881), "'5609378649501280170' is not returning 'aacfbcb19785a1ec4d'");    

        bytes memory expected882 = hex"a2f4e6e9d1f6f3df0d";
        uint64 value882 = 990738819831151138;

        Buffer.buffer memory result882 = Leb128.encodeUnsignedLeb128FromUInt64(value882);

        require(keccak256(result882.buf) == keccak256(expected882), "'990738819831151138' is not returning 'a2f4e6e9d1f6f3df0d'");    

        bytes memory expected883 = hex"dbb6c7e2abadbbafab01";
        uint64 value883 = 12348568270978276187;

        Buffer.buffer memory result883 = Leb128.encodeUnsignedLeb128FromUInt64(value883);

        require(keccak256(result883.buf) == keccak256(expected883), "'12348568270978276187' is not returning 'dbb6c7e2abadbbafab01'");    

        bytes memory expected884 = hex"f09adf97a682f0c7ea01";
        uint64 value884 = 16901939111747112304;

        Buffer.buffer memory result884 = Leb128.encodeUnsignedLeb128FromUInt64(value884);

        require(keccak256(result884.buf) == keccak256(expected884), "'16901939111747112304' is not returning 'f09adf97a682f0c7ea01'");    

        bytes memory expected885 = hex"9993be8ef3efed828801";
        uint64 value885 = 9801441920966166937;

        Buffer.buffer memory result885 = Leb128.encodeUnsignedLeb128FromUInt64(value885);

        require(keccak256(result885.buf) == keccak256(expected885), "'9801441920966166937' is not returning '9993be8ef3efed828801'");    

        bytes memory expected886 = hex"f2dcf6e4efe1abce8b01";
        uint64 value886 = 10060108146541440626;

        Buffer.buffer memory result886 = Leb128.encodeUnsignedLeb128FromUInt64(value886);

        require(keccak256(result886.buf) == keccak256(expected886), "'10060108146541440626' is not returning 'f2dcf6e4efe1abce8b01'");    

        bytes memory expected887 = hex"bf9b94bb97c3c0859d01";
        uint64 value887 = 11316140797099052479;

        Buffer.buffer memory result887 = Leb128.encodeUnsignedLeb128FromUInt64(value887);

        require(keccak256(result887.buf) == keccak256(expected887), "'11316140797099052479' is not returning 'bf9b94bb97c3c0859d01'");    

        bytes memory expected888 = hex"fcddb790b8e0849411";
        uint64 value888 = 1236259003500982012;

        Buffer.buffer memory result888 = Leb128.encodeUnsignedLeb128FromUInt64(value888);

        require(keccak256(result888.buf) == keccak256(expected888), "'1236259003500982012' is not returning 'fcddb790b8e0849411'");    

        bytes memory expected889 = hex"b6eed992c0d6e7bce901";
        uint64 value889 = 16823652378989721398;

        Buffer.buffer memory result889 = Leb128.encodeUnsignedLeb128FromUInt64(value889);

        require(keccak256(result889.buf) == keccak256(expected889), "'16823652378989721398' is not returning 'b6eed992c0d6e7bce901'");    

        bytes memory expected890 = hex"c3dfcaef9cdce9c1d701";
        uint64 value890 = 15529439428856688579;

        Buffer.buffer memory result890 = Leb128.encodeUnsignedLeb128FromUInt64(value890);

        require(keccak256(result890.buf) == keccak256(expected890), "'15529439428856688579' is not returning 'c3dfcaef9cdce9c1d701'");    

        bytes memory expected891 = hex"f9a3d4a3a7c1b1928e01";
        uint64 value891 = 10242529200753152505;

        Buffer.buffer memory result891 = Leb128.encodeUnsignedLeb128FromUInt64(value891);

        require(keccak256(result891.buf) == keccak256(expected891), "'10242529200753152505' is not returning 'f9a3d4a3a7c1b1928e01'");    

        bytes memory expected892 = hex"dafbffbd8990cbe548";
        uint64 value892 = 5245335121816452570;

        Buffer.buffer memory result892 = Leb128.encodeUnsignedLeb128FromUInt64(value892);

        require(keccak256(result892.buf) == keccak256(expected892), "'5245335121816452570' is not returning 'dafbffbd8990cbe548'");    

        bytes memory expected893 = hex"8baca2dfb8bacf9026";
        uint64 value893 = 2747545226467382795;

        Buffer.buffer memory result893 = Leb128.encodeUnsignedLeb128FromUInt64(value893);

        require(keccak256(result893.buf) == keccak256(expected893), "'2747545226467382795' is not returning '8baca2dfb8bacf9026'");    

        bytes memory expected894 = hex"f3ddeff3ac8485f0bc01";
        uint64 value894 = 13609900213639311091;

        Buffer.buffer memory result894 = Leb128.encodeUnsignedLeb128FromUInt64(value894);

        require(keccak256(result894.buf) == keccak256(expected894), "'13609900213639311091' is not returning 'f3ddeff3ac8485f0bc01'");    

        bytes memory expected895 = hex"99979af8a2b2ca811a";
        uint64 value895 = 1874387577747180441;

        Buffer.buffer memory result895 = Leb128.encodeUnsignedLeb128FromUInt64(value895);

        require(keccak256(result895.buf) == keccak256(expected895), "'1874387577747180441' is not returning '99979af8a2b2ca811a'");    

        bytes memory expected896 = hex"a38ca3d6f7ebaec88e01";
        uint64 value896 = 10272916768788366883;

        Buffer.buffer memory result896 = Leb128.encodeUnsignedLeb128FromUInt64(value896);

        require(keccak256(result896.buf) == keccak256(expected896), "'10272916768788366883' is not returning 'a38ca3d6f7ebaec88e01'");    

        bytes memory expected897 = hex"ec83ddc7bbcfadbb0f";
        uint64 value897 = 1114278600321221100;

        Buffer.buffer memory result897 = Leb128.encodeUnsignedLeb128FromUInt64(value897);

        require(keccak256(result897.buf) == keccak256(expected897), "'1114278600321221100' is not returning 'ec83ddc7bbcfadbb0f'");    

        bytes memory expected898 = hex"b8838fbdefb0fcac8901";
        uint64 value898 = 9897207218105991608;

        Buffer.buffer memory result898 = Leb128.encodeUnsignedLeb128FromUInt64(value898);

        require(keccak256(result898.buf) == keccak256(expected898), "'9897207218105991608' is not returning 'b8838fbdefb0fcac8901'");    

        bytes memory expected899 = hex"ffcbd6e2d4ed8be37a";
        uint64 value899 = 8846810664494540287;

        Buffer.buffer memory result899 = Leb128.encodeUnsignedLeb128FromUInt64(value899);

        require(keccak256(result899.buf) == keccak256(expected899), "'8846810664494540287' is not returning 'ffcbd6e2d4ed8be37a'");    

        bytes memory expected900 = hex"df8b88f3afd0a4ca9201";
        uint64 value900 = 10562228117401896415;

        Buffer.buffer memory result900 = Leb128.encodeUnsignedLeb128FromUInt64(value900);

        require(keccak256(result900.buf) == keccak256(expected900), "'10562228117401896415' is not returning 'df8b88f3afd0a4ca9201'");    

        bytes memory expected901 = hex"cbbbf2a0b3edf7ba77";
        uint64 value901 = 8608031914317356491;

        Buffer.buffer memory result901 = Leb128.encodeUnsignedLeb128FromUInt64(value901);

        require(keccak256(result901.buf) == keccak256(expected901), "'8608031914317356491' is not returning 'cbbbf2a0b3edf7ba77'");    

        bytes memory expected902 = hex"a0f6acaf8ad988f219";
        uint64 value902 = 1865654390810688288;

        Buffer.buffer memory result902 = Leb128.encodeUnsignedLeb128FromUInt64(value902);

        require(keccak256(result902.buf) == keccak256(expected902), "'1865654390810688288' is not returning 'a0f6acaf8ad988f219'");    

        bytes memory expected903 = hex"80fde3c6b7cbbaeca701";
        uint64 value903 = 12094674477893877376;

        Buffer.buffer memory result903 = Leb128.encodeUnsignedLeb128FromUInt64(value903);

        require(keccak256(result903.buf) == keccak256(expected903), "'12094674477893877376' is not returning '80fde3c6b7cbbaeca701'");    

        bytes memory expected904 = hex"c6bfe6ee99d8e3e376";
        uint64 value904 = 8558966579069034438;

        Buffer.buffer memory result904 = Leb128.encodeUnsignedLeb128FromUInt64(value904);

        require(keccak256(result904.buf) == keccak256(expected904), "'8558966579069034438' is not returning 'c6bfe6ee99d8e3e376'");    

        bytes memory expected905 = hex"8d8bf484c5cfb79b48";
        uint64 value905 = 5203591044982965645;

        Buffer.buffer memory result905 = Leb128.encodeUnsignedLeb128FromUInt64(value905);

        require(keccak256(result905.buf) == keccak256(expected905), "'5203591044982965645' is not returning '8d8bf484c5cfb79b48'");    

        bytes memory expected906 = hex"9e82cd8495cea6f29b01";
        uint64 value906 = 11233273182042669342;

        Buffer.buffer memory result906 = Leb128.encodeUnsignedLeb128FromUInt64(value906);

        require(keccak256(result906.buf) == keccak256(expected906), "'11233273182042669342' is not returning '9e82cd8495cea6f29b01'");    

        bytes memory expected907 = hex"91eebae9d0f592a4de01";
        uint64 value907 = 16017135281365759761;

        Buffer.buffer memory result907 = Leb128.encodeUnsignedLeb128FromUInt64(value907);

        require(keccak256(result907.buf) == keccak256(expected907), "'16017135281365759761' is not returning '91eebae9d0f592a4de01'");    

        bytes memory expected908 = hex"d1efcaf3f9f5b8b160";
        uint64 value908 = 6945363918775826385;

        Buffer.buffer memory result908 = Leb128.encodeUnsignedLeb128FromUInt64(value908);

        require(keccak256(result908.buf) == keccak256(expected908), "'6945363918775826385' is not returning 'd1efcaf3f9f5b8b160'");    

        bytes memory expected909 = hex"8cf09ee3a5b8e9f253";
        uint64 value909 = 6045420329007298572;

        Buffer.buffer memory result909 = Leb128.encodeUnsignedLeb128FromUInt64(value909);

        require(keccak256(result909.buf) == keccak256(expected909), "'6045420329007298572' is not returning '8cf09ee3a5b8e9f253'");    

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

    }
}
