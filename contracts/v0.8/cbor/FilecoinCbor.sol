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
import "../utils/CborDecode.sol";
import "../cbor/BigIntCbor.sol";

/// @title This library is a set of functions meant to handle CBOR serialization and deserialization for general data types on the filecoin network.
/// @author Zondax AG
library FilecoinCBOR {
    using Buffer for Buffer.buffer;
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for *;
    using BigIntCBOR for *;

    uint8 private constant MAJOR_TYPE_TAG = 6;
    uint8 private constant TAG_TYPE_CID_CODE = 42;
    uint8 private constant PAYLOAD_LEN_8_BITS = 24;

    /// @notice write CID into a cbor buffer
    /// @dev the cbor major will be 6 (type tag) and the tag type is 42, as per filecoin definition
    /// @param buf buffer containing the actual cbor serialization process
    /// @param value cid data to serialize as cbor
    function writeCid(CBOR.CBORBuffer memory buf, bytes memory value) internal pure {
        buf.buf.appendUint8(uint8(((MAJOR_TYPE_TAG << 5) | PAYLOAD_LEN_8_BITS)));
        buf.buf.appendUint8(TAG_TYPE_CID_CODE);
        buf.writeBytes(value);
    }

    /// @notice serialize filecoin address to cbor encoded
    /// @param addr filecoin address to serialize
    /// @return cbor serialized data as bytes
    function serializeAddress(CommonTypes.FilAddress memory addr) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.writeBytes(addr.data);

        return buf.data();
    }

    /// @notice serialize a BigInt value wrapped in a cbor fixed array.
    /// @param value BigInt to serialize as cbor inside an
    /// @return cbor serialized data as bytes
    function serializeArrayBigInt(CommonTypes.BigInt memory value) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.writeBytes(value.serializeBigInt());

        return buf.data();
    }

    /// @notice serialize a FilAddress value wrapped in a cbor fixed array.
    /// @param addr FilAddress to serialize as cbor inside an
    /// @return cbor serialized data as bytes
    function serializeArrayFilAddress(CommonTypes.FilAddress memory addr) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.writeBytes(addr.data);

        return buf.data();
    }

    /// @notice deserialize a FilAddress wrapped on a cbor fixed array coming from a actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of FilAddress created based on parsed data
    function deserializeArrayFilAddress(bytes memory rawResp) internal pure returns (CommonTypes.FilAddress memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        (ret.data, byteIdx) = rawResp.readBytes(byteIdx);

        return ret;
    }

    /// @notice deserialize a BigInt wrapped on a cbor fixed array coming from a actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of BigInt created based on parsed data
    function deserializeArrayBigInt(bytes memory rawResp) internal pure returns (CommonTypes.BigInt memory) {
        uint byteIdx = 0;
        uint len;
        bytes memory tmp;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 1);

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        return tmp.deserializeBigInt();
    }

    /// @notice serialize UniversalReceiverParams struct to cbor in order to pass as arguments to an actor
    /// @param params UniversalReceiverParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeUniversalReceiverParams(CommonTypes.UniversalReceiverParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeUInt64(params.type_);
        buf.writeBytes(params.payload);

        return buf.data();
    }

    /// @notice deserialize UniversalReceiverParams cbor to struct when receiving a message
    /// @param rawResp cbor encoded response
    /// @return ret new instance of UniversalReceiverParams created based on parsed data
    function deserializeUniversalReceiverParams(bytes memory rawResp) internal pure returns (CommonTypes.UniversalReceiverParams memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        require(len == 2, "Wrong numbers of parameters (should find 2)");

        (ret.type_, byteIdx) = rawResp.readUInt32(byteIdx);
        (ret.payload, byteIdx) = rawResp.readBytes(byteIdx);
    }

    function readFilActorId(bytes memory rawResp, uint byteIdx) internal pure returns (CommonTypes.FilActorId, uint) {
        uint64 tmp = 0;

        (tmp, byteIdx) = rawResp.readUInt64(byteIdx);
        return (CommonTypes.FilActorId.wrap(tmp), byteIdx);
    }

    function writeFilActorId(CBOR.CBORBuffer memory buf, CommonTypes.FilActorId id) internal pure {
        buf.writeUInt64(CommonTypes.FilActorId.unwrap(id));
    }
}
