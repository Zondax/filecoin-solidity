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
contract Leb128Generated11Test {
    using Buffer for Buffer.buffer;

    function unsiged_integer_leb128_encoding_generated() public pure {
        bytes memory expected700 = hex"d4e092dd0f";
        uint64 value700 = 4221874260;

        Buffer.buffer memory result700 = Leb128.encodeUnsignedLeb128FromUInt64(value700);

        require(keccak256(result700.buf) == keccak256(expected700), "'4221874260' is not returning 'd4e092dd0f'");

        bytes memory expected701 = hex"c4a9d5db0e";
        uint64 value701 = 3950335172;

        Buffer.buffer memory result701 = Leb128.encodeUnsignedLeb128FromUInt64(value701);

        require(keccak256(result701.buf) == keccak256(expected701), "'3950335172' is not returning 'c4a9d5db0e'");

        bytes memory expected702 = hex"a8aefcac07";
        uint64 value702 = 1973360424;

        Buffer.buffer memory result702 = Leb128.encodeUnsignedLeb128FromUInt64(value702);

        require(keccak256(result702.buf) == keccak256(expected702), "'1973360424' is not returning 'a8aefcac07'");

        bytes memory expected703 = hex"b6dcab9f0e";
        uint64 value703 = 3823824438;

        Buffer.buffer memory result703 = Leb128.encodeUnsignedLeb128FromUInt64(value703);

        require(keccak256(result703.buf) == keccak256(expected703), "'3823824438' is not returning 'b6dcab9f0e'");

        bytes memory expected704 = hex"91efb5d107";
        uint64 value704 = 2049800081;

        Buffer.buffer memory result704 = Leb128.encodeUnsignedLeb128FromUInt64(value704);

        require(keccak256(result704.buf) == keccak256(expected704), "'2049800081' is not returning '91efb5d107'");

        bytes memory expected705 = hex"c4c7a7d10d";
        uint64 value705 = 3660178372;

        Buffer.buffer memory result705 = Leb128.encodeUnsignedLeb128FromUInt64(value705);

        require(keccak256(result705.buf) == keccak256(expected705), "'3660178372' is not returning 'c4c7a7d10d'");

        bytes memory expected706 = hex"a4d6a6f402";
        uint64 value706 = 780774180;

        Buffer.buffer memory result706 = Leb128.encodeUnsignedLeb128FromUInt64(value706);

        require(keccak256(result706.buf) == keccak256(expected706), "'780774180' is not returning 'a4d6a6f402'");

        bytes memory expected707 = hex"d282e8fe09";
        uint64 value707 = 2681864530;

        Buffer.buffer memory result707 = Leb128.encodeUnsignedLeb128FromUInt64(value707);

        require(keccak256(result707.buf) == keccak256(expected707), "'2681864530' is not returning 'd282e8fe09'");

        bytes memory expected708 = hex"b4f0e6d805";
        uint64 value708 = 1528412212;

        Buffer.buffer memory result708 = Leb128.encodeUnsignedLeb128FromUInt64(value708);

        require(keccak256(result708.buf) == keccak256(expected708), "'1528412212' is not returning 'b4f0e6d805'");

        bytes memory expected709 = hex"9ece92ed08";
        uint64 value709 = 2376378142;

        Buffer.buffer memory result709 = Leb128.encodeUnsignedLeb128FromUInt64(value709);

        require(keccak256(result709.buf) == keccak256(expected709), "'2376378142' is not returning '9ece92ed08'");

        bytes memory expected710 = hex"f3bbd3fb03";
        uint64 value710 = 1064623603;

        Buffer.buffer memory result710 = Leb128.encodeUnsignedLeb128FromUInt64(value710);

        require(keccak256(result710.buf) == keccak256(expected710), "'1064623603' is not returning 'f3bbd3fb03'");

        bytes memory expected711 = hex"ada1db850c";
        uint64 value711 = 3233206445;

        Buffer.buffer memory result711 = Leb128.encodeUnsignedLeb128FromUInt64(value711);

        require(keccak256(result711.buf) == keccak256(expected711), "'3233206445' is not returning 'ada1db850c'");

        bytes memory expected712 = hex"f1dba9d70d";
        uint64 value712 = 3672796657;

        Buffer.buffer memory result712 = Leb128.encodeUnsignedLeb128FromUInt64(value712);

        require(keccak256(result712.buf) == keccak256(expected712), "'3672796657' is not returning 'f1dba9d70d'");

        bytes memory expected713 = hex"d2e5b9f402";
        uint64 value713 = 781087442;

        Buffer.buffer memory result713 = Leb128.encodeUnsignedLeb128FromUInt64(value713);

        require(keccak256(result713.buf) == keccak256(expected713), "'781087442' is not returning 'd2e5b9f402'");

        bytes memory expected714 = hex"e3fdd7ae08";
        uint64 value714 = 2245394147;

        Buffer.buffer memory result714 = Leb128.encodeUnsignedLeb128FromUInt64(value714);

        require(keccak256(result714.buf) == keccak256(expected714), "'2245394147' is not returning 'e3fdd7ae08'");

        bytes memory expected715 = hex"9995bba50e";
        uint64 value715 = 3836660377;

        Buffer.buffer memory result715 = Leb128.encodeUnsignedLeb128FromUInt64(value715);

        require(keccak256(result715.buf) == keccak256(expected715), "'3836660377' is not returning '9995bba50e'");

        bytes memory expected716 = hex"88d2bae208";
        uint64 value716 = 2353965320;

        Buffer.buffer memory result716 = Leb128.encodeUnsignedLeb128FromUInt64(value716);

        require(keccak256(result716.buf) == keccak256(expected716), "'2353965320' is not returning '88d2bae208'");

        bytes memory expected717 = hex"d0e393f50f";
        uint64 value717 = 4272222672;

        Buffer.buffer memory result717 = Leb128.encodeUnsignedLeb128FromUInt64(value717);

        require(keccak256(result717.buf) == keccak256(expected717), "'4272222672' is not returning 'd0e393f50f'");

        bytes memory expected718 = hex"83fbc9a80f";
        uint64 value718 = 4111629699;

        Buffer.buffer memory result718 = Leb128.encodeUnsignedLeb128FromUInt64(value718);

        require(keccak256(result718.buf) == keccak256(expected718), "'4111629699' is not returning '83fbc9a80f'");

        bytes memory expected719 = hex"80adb4b303";
        uint64 value719 = 913118848;

        Buffer.buffer memory result719 = Leb128.encodeUnsignedLeb128FromUInt64(value719);

        require(keccak256(result719.buf) == keccak256(expected719), "'913118848' is not returning '80adb4b303'");

        bytes memory expected720 = hex"dbdbbb58";
        uint64 value720 = 185527771;

        Buffer.buffer memory result720 = Leb128.encodeUnsignedLeb128FromUInt64(value720);

        require(keccak256(result720.buf) == keccak256(expected720), "'185527771' is not returning 'dbdbbb58'");

        bytes memory expected721 = hex"dfb5e38f0f";
        uint64 value721 = 4059618015;

        Buffer.buffer memory result721 = Leb128.encodeUnsignedLeb128FromUInt64(value721);

        require(keccak256(result721.buf) == keccak256(expected721), "'4059618015' is not returning 'dfb5e38f0f'");

        bytes memory expected722 = hex"a6b7f7f802";
        uint64 value722 = 790485926;

        Buffer.buffer memory result722 = Leb128.encodeUnsignedLeb128FromUInt64(value722);

        require(keccak256(result722.buf) == keccak256(expected722), "'790485926' is not returning 'a6b7f7f802'");

        bytes memory expected723 = hex"f8c2a3bc0e";
        uint64 value723 = 3884507512;

        Buffer.buffer memory result723 = Leb128.encodeUnsignedLeb128FromUInt64(value723);

        require(keccak256(result723.buf) == keccak256(expected723), "'3884507512' is not returning 'f8c2a3bc0e'");

        bytes memory expected724 = hex"e0d6f8f00e";
        uint64 value724 = 3994954592;

        Buffer.buffer memory result724 = Leb128.encodeUnsignedLeb128FromUInt64(value724);

        require(keccak256(result724.buf) == keccak256(expected724), "'3994954592' is not returning 'e0d6f8f00e'");

        bytes memory expected725 = hex"e9c6f89d01";
        uint64 value725 = 331228009;

        Buffer.buffer memory result725 = Leb128.encodeUnsignedLeb128FromUInt64(value725);

        require(keccak256(result725.buf) == keccak256(expected725), "'331228009' is not returning 'e9c6f89d01'");

        bytes memory expected726 = hex"9d82f8dc06";
        uint64 value726 = 1805517085;

        Buffer.buffer memory result726 = Leb128.encodeUnsignedLeb128FromUInt64(value726);

        require(keccak256(result726.buf) == keccak256(expected726), "'1805517085' is not returning '9d82f8dc06'");

        bytes memory expected727 = hex"c5d0dc06";
        uint64 value727 = 14100549;

        Buffer.buffer memory result727 = Leb128.encodeUnsignedLeb128FromUInt64(value727);

        require(keccak256(result727.buf) == keccak256(expected727), "'14100549' is not returning 'c5d0dc06'");

        bytes memory expected728 = hex"f285b7b70f";
        uint64 value728 = 4142777074;

        Buffer.buffer memory result728 = Leb128.encodeUnsignedLeb128FromUInt64(value728);

        require(keccak256(result728.buf) == keccak256(expected728), "'4142777074' is not returning 'f285b7b70f'");

        bytes memory expected729 = hex"bad7bd8e0e";
        uint64 value729 = 3788467130;

        Buffer.buffer memory result729 = Leb128.encodeUnsignedLeb128FromUInt64(value729);

        require(keccak256(result729.buf) == keccak256(expected729), "'3788467130' is not returning 'bad7bd8e0e'");

        bytes memory expected730 = hex"9bf4a1e90a";
        uint64 value730 = 2905111067;

        Buffer.buffer memory result730 = Leb128.encodeUnsignedLeb128FromUInt64(value730);

        require(keccak256(result730.buf) == keccak256(expected730), "'2905111067' is not returning '9bf4a1e90a'");

        bytes memory expected731 = hex"deeca6da05";
        uint64 value731 = 1531557470;

        Buffer.buffer memory result731 = Leb128.encodeUnsignedLeb128FromUInt64(value731);

        require(keccak256(result731.buf) == keccak256(expected731), "'1531557470' is not returning 'deeca6da05'");

        bytes memory expected732 = hex"ffc0e38003";
        uint64 value732 = 806936703;

        Buffer.buffer memory result732 = Leb128.encodeUnsignedLeb128FromUInt64(value732);

        require(keccak256(result732.buf) == keccak256(expected732), "'806936703' is not returning 'ffc0e38003'");

        bytes memory expected733 = hex"ad9f828003";
        uint64 value733 = 805343149;

        Buffer.buffer memory result733 = Leb128.encodeUnsignedLeb128FromUInt64(value733);

        require(keccak256(result733.buf) == keccak256(expected733), "'805343149' is not returning 'ad9f828003'");

        bytes memory expected734 = hex"e7e6fcb703";
        uint64 value734 = 922694503;

        Buffer.buffer memory result734 = Leb128.encodeUnsignedLeb128FromUInt64(value734);

        require(keccak256(result734.buf) == keccak256(expected734), "'922694503' is not returning 'e7e6fcb703'");

        bytes memory expected735 = hex"bcde9af70d";
        uint64 value735 = 3739660092;

        Buffer.buffer memory result735 = Leb128.encodeUnsignedLeb128FromUInt64(value735);

        require(keccak256(result735.buf) == keccak256(expected735), "'3739660092' is not returning 'bcde9af70d'");

        bytes memory expected736 = hex"cfd79d8b0b";
        uint64 value736 = 2976345039;

        Buffer.buffer memory result736 = Leb128.encodeUnsignedLeb128FromUInt64(value736);

        require(keccak256(result736.buf) == keccak256(expected736), "'2976345039' is not returning 'cfd79d8b0b'");

        bytes memory expected737 = hex"bcb582a404";
        uint64 value737 = 1149278908;

        Buffer.buffer memory result737 = Leb128.encodeUnsignedLeb128FromUInt64(value737);

        require(keccak256(result737.buf) == keccak256(expected737), "'1149278908' is not returning 'bcb582a404'");

        bytes memory expected738 = hex"a5838df808";
        uint64 value738 = 2399355301;

        Buffer.buffer memory result738 = Leb128.encodeUnsignedLeb128FromUInt64(value738);

        require(keccak256(result738.buf) == keccak256(expected738), "'2399355301' is not returning 'a5838df808'");

        bytes memory expected739 = hex"97c9e48d09";
        uint64 value739 = 2444829847;

        Buffer.buffer memory result739 = Leb128.encodeUnsignedLeb128FromUInt64(value739);

        require(keccak256(result739.buf) == keccak256(expected739), "'2444829847' is not returning '97c9e48d09'");

        bytes memory expected740 = hex"8ba6f58f0b";
        uint64 value740 = 2986169099;

        Buffer.buffer memory result740 = Leb128.encodeUnsignedLeb128FromUInt64(value740);

        require(keccak256(result740.buf) == keccak256(expected740), "'2986169099' is not returning '8ba6f58f0b'");

        bytes memory expected741 = hex"dec2defe0a";
        uint64 value741 = 2950144350;

        Buffer.buffer memory result741 = Leb128.encodeUnsignedLeb128FromUInt64(value741);

        require(keccak256(result741.buf) == keccak256(expected741), "'2950144350' is not returning 'dec2defe0a'");

        bytes memory expected742 = hex"badfb8cb0e";
        uint64 value742 = 3916312506;

        Buffer.buffer memory result742 = Leb128.encodeUnsignedLeb128FromUInt64(value742);

        require(keccak256(result742.buf) == keccak256(expected742), "'3916312506' is not returning 'badfb8cb0e'");

        bytes memory expected743 = hex"8cd4a69303";
        uint64 value743 = 845785612;

        Buffer.buffer memory result743 = Leb128.encodeUnsignedLeb128FromUInt64(value743);

        require(keccak256(result743.buf) == keccak256(expected743), "'845785612' is not returning '8cd4a69303'");

        bytes memory expected744 = hex"d7ccee8d01";
        uint64 value744 = 297510487;

        Buffer.buffer memory result744 = Leb128.encodeUnsignedLeb128FromUInt64(value744);

        require(keccak256(result744.buf) == keccak256(expected744), "'297510487' is not returning 'd7ccee8d01'");

        bytes memory expected745 = hex"8af0cda70e";
        uint64 value745 = 3841161226;

        Buffer.buffer memory result745 = Leb128.encodeUnsignedLeb128FromUInt64(value745);

        require(keccak256(result745.buf) == keccak256(expected745), "'3841161226' is not returning '8af0cda70e'");

        bytes memory expected746 = hex"c9baf920";
        uint64 value746 = 69098825;

        Buffer.buffer memory result746 = Leb128.encodeUnsignedLeb128FromUInt64(value746);

        require(keccak256(result746.buf) == keccak256(expected746), "'69098825' is not returning 'c9baf920'");

        bytes memory expected747 = hex"cabdaba30b";
        uint64 value747 = 3026902730;

        Buffer.buffer memory result747 = Leb128.encodeUnsignedLeb128FromUInt64(value747);

        require(keccak256(result747.buf) == keccak256(expected747), "'3026902730' is not returning 'cabdaba30b'");

        bytes memory expected748 = hex"c3f6f4b405";
        uint64 value748 = 1453144899;

        Buffer.buffer memory result748 = Leb128.encodeUnsignedLeb128FromUInt64(value748);

        require(keccak256(result748.buf) == keccak256(expected748), "'1453144899' is not returning 'c3f6f4b405'");

        bytes memory expected749 = hex"80c8eba909";
        uint64 value749 = 2503664640;

        Buffer.buffer memory result749 = Leb128.encodeUnsignedLeb128FromUInt64(value749);

        require(keccak256(result749.buf) == keccak256(expected749), "'2503664640' is not returning '80c8eba909'");

        bytes memory expected750 = hex"adfe98d304";
        uint64 value750 = 1248214829;

        Buffer.buffer memory result750 = Leb128.encodeUnsignedLeb128FromUInt64(value750);

        require(keccak256(result750.buf) == keccak256(expected750), "'1248214829' is not returning 'adfe98d304'");

        bytes memory expected751 = hex"e9b2c9af05";
        uint64 value751 = 1441945961;

        Buffer.buffer memory result751 = Leb128.encodeUnsignedLeb128FromUInt64(value751);

        require(keccak256(result751.buf) == keccak256(expected751), "'1441945961' is not returning 'e9b2c9af05'");

        bytes memory expected752 = hex"e2feeefd02";
        uint64 value752 = 800833378;

        Buffer.buffer memory result752 = Leb128.encodeUnsignedLeb128FromUInt64(value752);

        require(keccak256(result752.buf) == keccak256(expected752), "'800833378' is not returning 'e2feeefd02'");

        bytes memory expected753 = hex"e7f7e7f403";
        uint64 value753 = 1050278887;

        Buffer.buffer memory result753 = Leb128.encodeUnsignedLeb128FromUInt64(value753);

        require(keccak256(result753.buf) == keccak256(expected753), "'1050278887' is not returning 'e7f7e7f403'");

        bytes memory expected754 = hex"d798a2830f";
        uint64 value754 = 4033383511;

        Buffer.buffer memory result754 = Leb128.encodeUnsignedLeb128FromUInt64(value754);

        require(keccak256(result754.buf) == keccak256(expected754), "'4033383511' is not returning 'd798a2830f'");

        bytes memory expected755 = hex"a8abeef50f";
        uint64 value755 = 4273706408;

        Buffer.buffer memory result755 = Leb128.encodeUnsignedLeb128FromUInt64(value755);

        require(keccak256(result755.buf) == keccak256(expected755), "'4273706408' is not returning 'a8abeef50f'");

        bytes memory expected756 = hex"92c2d2c708";
        uint64 value756 = 2297733394;

        Buffer.buffer memory result756 = Leb128.encodeUnsignedLeb128FromUInt64(value756);

        require(keccak256(result756.buf) == keccak256(expected756), "'2297733394' is not returning '92c2d2c708'");

        bytes memory expected757 = hex"90b9ded80a";
        uint64 value757 = 2870451344;

        Buffer.buffer memory result757 = Leb128.encodeUnsignedLeb128FromUInt64(value757);

        require(keccak256(result757.buf) == keccak256(expected757), "'2870451344' is not returning '90b9ded80a'");

        bytes memory expected758 = hex"a4adfe850f";
        uint64 value758 = 4039087780;

        Buffer.buffer memory result758 = Leb128.encodeUnsignedLeb128FromUInt64(value758);

        require(keccak256(result758.buf) == keccak256(expected758), "'4039087780' is not returning 'a4adfe850f'");

        bytes memory expected759 = hex"a0d5c9ca02";
        uint64 value759 = 693267104;

        Buffer.buffer memory result759 = Leb128.encodeUnsignedLeb128FromUInt64(value759);

        require(keccak256(result759.buf) == keccak256(expected759), "'693267104' is not returning 'a0d5c9ca02'");

        bytes memory expected760 = hex"b1d4b08102";
        uint64 value760 = 539765297;

        Buffer.buffer memory result760 = Leb128.encodeUnsignedLeb128FromUInt64(value760);

        require(keccak256(result760.buf) == keccak256(expected760), "'539765297' is not returning 'b1d4b08102'");

        bytes memory expected761 = hex"b9ac838a0f";
        uint64 value761 = 4047558201;

        Buffer.buffer memory result761 = Leb128.encodeUnsignedLeb128FromUInt64(value761);

        require(keccak256(result761.buf) == keccak256(expected761), "'4047558201' is not returning 'b9ac838a0f'");

        bytes memory expected762 = hex"9dbef2f60a";
        uint64 value762 = 2933694237;

        Buffer.buffer memory result762 = Leb128.encodeUnsignedLeb128FromUInt64(value762);

        require(keccak256(result762.buf) == keccak256(expected762), "'2933694237' is not returning '9dbef2f60a'");

        bytes memory expected763 = hex"f9b3d6cc0e";
        uint64 value763 = 3918895609;

        Buffer.buffer memory result763 = Leb128.encodeUnsignedLeb128FromUInt64(value763);

        require(keccak256(result763.buf) == keccak256(expected763), "'3918895609' is not returning 'f9b3d6cc0e'");

        bytes memory expected764 = hex"ec96f0ea0f";
        uint64 value764 = 4250667884;

        Buffer.buffer memory result764 = Leb128.encodeUnsignedLeb128FromUInt64(value764);

        require(keccak256(result764.buf) == keccak256(expected764), "'4250667884' is not returning 'ec96f0ea0f'");

        bytes memory expected765 = hex"f8f58eb209";
        uint64 value765 = 2521021176;

        Buffer.buffer memory result765 = Leb128.encodeUnsignedLeb128FromUInt64(value765);

        require(keccak256(result765.buf) == keccak256(expected765), "'2521021176' is not returning 'f8f58eb209'");

        bytes memory expected766 = hex"abc390fc0d";
        uint64 value766 = 3749978539;

        Buffer.buffer memory result766 = Leb128.encodeUnsignedLeb128FromUInt64(value766);

        require(keccak256(result766.buf) == keccak256(expected766), "'3749978539' is not returning 'abc390fc0d'");

        bytes memory expected767 = hex"a691e0ee0f";
        uint64 value767 = 4258793638;

        Buffer.buffer memory result767 = Leb128.encodeUnsignedLeb128FromUInt64(value767);

        require(keccak256(result767.buf) == keccak256(expected767), "'4258793638' is not returning 'a691e0ee0f'");

        bytes memory expected768 = hex"d8c4ecdcd886dff9e401";
        uint64 value768 = 16497666429405569624;

        Buffer.buffer memory result768 = Leb128.encodeUnsignedLeb128FromUInt64(value768);

        require(keccak256(result768.buf) == keccak256(expected768), "'16497666429405569624' is not returning 'd8c4ecdcd886dff9e401'");
    }
}
