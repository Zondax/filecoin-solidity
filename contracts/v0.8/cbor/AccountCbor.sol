/*******************************************************************************
 *   (c) 2022 Zondax AG
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

import "solidity-cborutils/contracts/CBOR.sol";

import "../types/AccountTypes.sol";
import "../utils/CborDecode.sol";
import "../utils/Misc.sol";

/// @title FIXME
/// @author Zondax AG
library AccountCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serializeAuthenticateMessageParams(AccountTypes.AuthenticateMessageParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.signature);
        buf.writeBytes(params.message);

        return buf.data();
    }

    function deserializeAuthenticateMessageParams(bytes memory rawResp) internal pure returns (AccountTypes.AuthenticateMessageParams memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.signature, byteIdx) = rawResp.readBytes(byteIdx);
        (ret.message, byteIdx) = rawResp.readBytes(byteIdx);

        return ret;
    }

    function serializeUniversalReceiverParams(AccountTypes.UniversalReceiverParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeUInt64(params.type_);
        buf.writeBytes(params.payload);

        return buf.data();
    }
}
