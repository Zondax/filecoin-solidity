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

/// @title This library is a set of functions meant to handle CBOR parameters serialization and return values deserialization for Account actor exported methods.
/// @author Zondax AG
library AccountCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    /// @notice serialize AuthenticateMessageParams struct to cbor in order to pass as arguments to an account actor
    /// @param params AuthenticateMessageParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeAuthenticateMessageParams(AccountTypes.AuthenticateMessageParams memory params) internal pure returns (bytes memory) {
        uint256 capacity = 0;

        capacity += Misc.getPrefixSize(2);
        capacity += Misc.getBytesSize(params.signature);
        capacity += Misc.getBytesSize(params.message);

        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

        buf.startFixedArray(2);
        buf.writeBytes(params.signature);
        buf.writeBytes(params.message);

        return buf.data();
    }

    /// @notice deserialize AuthenticateMessageParams struct from cbor encoded bytes coming from an account actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of AuthenticateMessageParams created based on parsed data
    function deserializeAuthenticateMessageParams(bytes memory rawResp) internal pure returns (AccountTypes.AuthenticateMessageParams memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.signature, byteIdx) = rawResp.readBytes(byteIdx);
        (ret.message, byteIdx) = rawResp.readBytes(byteIdx);

        return ret;
    }
}
