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
// THIS CODE WAS SECURITY REVIEWED BY KUDELSKI SECURITY, BUT NOT FORMALLY AUDITED

// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import "solidity-cborutils/contracts/CBOR.sol";
import "@ensdomains/buffer/contracts/Buffer.sol";

import "../utils/CborDecode.sol";
import "../utils/Misc.sol";

import "../types/CommonTypes.sol";

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

    /// @notice Write a CID into a CBOR buffer.
    /// @dev The CBOR major will be 6 (type 'tag') and the tag type value is 42, as per CBOR tag assignments.
    /// @dev https://www.iana.org/assignments/cbor-tags/cbor-tags.xhtml
    /// @param buf buffer containing the actual CBOR serialization process
    /// @param value CID value to serialize as CBOR
    function writeCid(CBOR.CBORBuffer memory buf, bytes memory value) internal pure {
        buf.buf.appendUint8(uint8(((MAJOR_TYPE_TAG << 5) | PAYLOAD_LEN_8_BITS)));
        buf.buf.appendUint8(TAG_TYPE_CID_CODE);
        // See https://ipld.io/specs/codecs/dag-cbor/spec/#links for explanation on 0x00 prefix.
        buf.writeBytes(bytes.concat(hex'00', value));
    }

    function readCid(bytes memory cborData, uint byteIdx) internal pure returns (CommonTypes.Cid memory, uint) {
        uint8 maj;
        uint value;

        (maj, value, byteIdx) = cborData.parseCborHeader(byteIdx);
        require(maj == MAJOR_TYPE_TAG, "expected major type tag when parsing cid");
        require(value == TAG_TYPE_CID_CODE, "expected tag 42 when parsing cid");

        bytes memory raw;
        (raw, byteIdx) = cborData.readBytes(byteIdx);
        require(raw[0] == 0x00, "expected first byte to be 0 when parsing cid");

        // Pop off the first byte, which corresponds to the historical multibase 0x00 byte.
        // https://ipld.io/specs/codecs/dag-cbor/spec/#links
        CommonTypes.Cid memory ret;
        ret.data = new bytes(raw.length - 1);
        for (uint256 i = 1; i < raw.length; i++) {
            ret.data[i-1] = raw[i];
        }

        return (ret, byteIdx);
    }

    /// @notice serialize filecoin address to cbor encoded
    /// @param addr filecoin address to serialize
    /// @return cbor serialized data as bytes
    function serializeAddress(CommonTypes.FilAddress memory addr) internal pure returns (bytes memory) {
        uint256 capacity = Misc.getBytesSize(addr.data);
        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

        buf.writeBytes(addr.data);

        return buf.data();
    }

    /// @notice serialize a BigInt value wrapped in a cbor fixed array.
    /// @param value BigInt to serialize as cbor inside an
    /// @return cbor serialized data as bytes
    function serializeArrayBigInt(CommonTypes.BigInt memory value) internal pure returns (bytes memory) {
        uint256 capacity = 0;
        bytes memory valueBigInt = value.serializeBigInt();

        capacity += Misc.getPrefixSize(1);
        capacity += Misc.getBytesSize(valueBigInt);
        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

        buf.startFixedArray(1);
        buf.writeBytes(value.serializeBigInt());

        return buf.data();
    }

    /// @notice serialize a FilAddress value wrapped in a cbor fixed array.
    /// @param addr FilAddress to serialize as cbor inside an
    /// @return cbor serialized data as bytes
    function serializeArrayFilAddress(CommonTypes.FilAddress memory addr) internal pure returns (bytes memory) {
        uint256 capacity = 0;

        capacity += Misc.getPrefixSize(1);
        capacity += Misc.getBytesSize(addr.data);
        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

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
        require(len == 1, "Wrong numbers of parameters (should find 1)");

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
        uint256 capacity = 0;

        capacity += Misc.getPrefixSize(2);
        capacity += Misc.getPrefixSize(params.type_);
        capacity += Misc.getBytesSize(params.payload);
        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

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

    /// @notice attempt to read a FilActorId value
    /// @param rawResp cbor encoded bytes to parse from
    /// @param byteIdx current position to read on the cbor encoded bytes
    /// @return a FilActorId decoded from input bytes and the byte index after moving past the value
    function readFilActorId(bytes memory rawResp, uint byteIdx) internal pure returns (CommonTypes.FilActorId, uint) {
        uint64 tmp = 0;

        (tmp, byteIdx) = rawResp.readUInt64(byteIdx);
        return (CommonTypes.FilActorId.wrap(tmp), byteIdx);
    }

    /// @notice write FilActorId into a cbor buffer
    /// @dev FilActorId is just wrapping a uint64
    /// @param buf buffer containing the actual cbor serialization process
    /// @param id FilActorId to serialize as cbor
    function writeFilActorId(CBOR.CBORBuffer memory buf, CommonTypes.FilActorId id) internal pure {
        buf.writeUInt64(CommonTypes.FilActorId.unwrap(id));
    }

    /// @notice attempt to read a ChainEpoch value
    /// @param rawResp cbor encoded bytes to parse from
    /// @param byteIdx current position to read on the cbor encoded bytes
    /// @return a ChainEpoch decoded from input bytes and the byte index after moving past the value
    function readChainEpoch(bytes memory rawResp, uint byteIdx) internal pure returns (CommonTypes.ChainEpoch, uint) {
        int64 tmp = 0;

        (tmp, byteIdx) = rawResp.readInt64(byteIdx);
        return (CommonTypes.ChainEpoch.wrap(tmp), byteIdx);
    }

    /// @notice write ChainEpoch into a cbor buffer
    /// @dev ChainEpoch is just wrapping a int64
    /// @param buf buffer containing the actual cbor serialization process
    /// @param id ChainEpoch to serialize as cbor
    function writeChainEpoch(CBOR.CBORBuffer memory buf, CommonTypes.ChainEpoch id) internal pure {
        buf.writeInt64(CommonTypes.ChainEpoch.unwrap(id));
    }

    /// @notice write DealLabel into a cbor buffer
    /// @param buf buffer containing the actual cbor serialization process
    /// @param label DealLabel to serialize as cbor
    function writeDealLabel(CBOR.CBORBuffer memory buf, CommonTypes.DealLabel memory label) internal pure {
        label.isString ? buf.writeString(string(label.data)) : buf.writeBytes(label.data);
    }

    /// @notice deserialize DealLabel cbor to struct when receiving a message
    /// @param rawResp cbor encoded response
    /// @return ret new instance of DealLabel created based on parsed data
    function deserializeDealLabel(bytes memory rawResp) internal pure returns (CommonTypes.DealLabel memory) {
        uint byteIdx = 0;
        CommonTypes.DealLabel memory label;

        (label, byteIdx) = readDealLabel(rawResp, byteIdx);
        return label;
    }

    /// @notice attempt to read a DealLabel value
    /// @param rawResp cbor encoded bytes to parse from
    /// @param byteIdx current position to read on the cbor encoded bytes
    /// @return a DealLabel decoded from input bytes and the byte index after moving past the value
    function readDealLabel(bytes memory rawResp, uint byteIdx) internal pure returns (CommonTypes.DealLabel memory, uint) {
        uint8 maj;
        uint len;

        (maj, len, byteIdx) = CBORDecoder.parseCborHeader(rawResp, byteIdx);
        require(maj == MajByteString || maj == MajTextString, "invalid maj (expected MajByteString or MajTextString)");

        uint max_len = byteIdx + len;
        bytes memory slice = new bytes(len);
        uint slice_index = 0;
        for (uint256 i = byteIdx; i < max_len; i++) {
            slice[slice_index] = rawResp[i];
            slice_index++;
        }

        return (CommonTypes.DealLabel(slice, maj == MajTextString), byteIdx + len);
    }
}
