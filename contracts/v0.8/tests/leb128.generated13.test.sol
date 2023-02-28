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
contract Leb128Generated13Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {
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

        bytes memory expected859 = hex"80c5f0aad9eec7f436";
        uint64 value859 = 3956728337499169408;

        Buffer.buffer memory result859 = Leb128.encodeUnsignedLeb128FromUInt64(value859);

        require(keccak256(result859.buf) == keccak256(expected859), "'3956728337499169408' is not returning '80c5f0aad9eec7f436'");

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
    }
}
