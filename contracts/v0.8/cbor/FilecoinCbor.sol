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

import "../external/CBOR.sol";
import "../external/Buffer.sol";
import "../types/CommonTypes.sol";

/// @title This library is a set of functions meant to handle CBOR serialization and deserialization for general data types on the filecoin network.
/// @author Zondax AG
library FilecoinCBOR {
    using Buffer for Buffer.buffer;
    using CBOR for CBOR.CBORBuffer;

    uint8 private constant MAJOR_TYPE_TAG = 6;
    uint8 private constant TAG_TYPE_CID_CODE = 42;
    uint8 private constant PAYLOAD_LEN_8_BITS = 24;

    function writeCid(CBOR.CBORBuffer memory buf, bytes memory value) internal pure {
        buf.buf.appendUint8(uint8(((MAJOR_TYPE_TAG << 5) | PAYLOAD_LEN_8_BITS)));
        buf.buf.appendUint8(TAG_TYPE_CID_CODE);
        buf.writeBytes(value);
    }

    function serializeUniversalReceiverParams(CommonTypes.UniversalReceiverParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeUInt64(params.type_);
        buf.writeBytes(params.payload);

        return buf.data();
    }
}
