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

import "../types/CommonTypes.sol";
import "../types/DataCapTypes.sol";
import "../utils/CborDecode.sol";
import "../utils/Misc.sol";
import "./BigIntCbor.sol";

/// @title This library is a set of functions meant to handle CBOR parameters serialization and return values deserialization for DataCap actor exported methods.
/// @author Zondax AG
library DataCapCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;
    using BigIntCBOR for CommonTypes.BigInt;
    using BigIntCBOR for bytes;

    /// @notice serialize GetAllowanceParams struct to cbor in order to pass as arguments to the datacap actor
    /// @param params GetAllowanceParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeGetAllowanceParams(DataCapTypes.GetAllowanceParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.owner);
        buf.writeBytes(params.operator);

        return buf.data();
    }

    /// @notice serialize TransferParams struct to cbor in order to pass as arguments to the datacap actor
    /// @param params TransferParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeTransferParams(DataCapTypes.TransferParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(3);
        buf.writeBytes(params.to);
        buf.writeBytes(params.amount.serializeBigInt());
        buf.writeBytes(params.operator_data);

        return buf.data();
    }

    /// @notice deserialize TransferReturn struct from cbor encoded bytes coming from a datacap actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of TransferReturn created based on parsed data
    function deserializeTransferReturn(bytes memory rawResp) internal pure returns (DataCapTypes.TransferReturn memory ret) {
        uint byteIdx = 0;
        uint len;
        bytes memory tmp;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 3);

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.from_balance = tmp.deserializeBigInt();

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.to_balance = tmp.deserializeBigInt();

        (ret.recipient_data, byteIdx) = rawResp.readBytes(byteIdx);

        return ret;
    }

    /// @notice serialize TransferFromParams struct to cbor in order to pass as arguments to the datacap actor
    /// @param params TransferFromParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeTransferFromParams(DataCapTypes.TransferFromParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(4);
        buf.writeBytes(params.from);
        buf.writeBytes(params.to);
        buf.writeBytes(params.amount.serializeBigInt());
        buf.writeBytes(params.operator_data);

        return buf.data();
    }

    /// @notice deserialize TransferFromReturn struct from cbor encoded bytes coming from a datacap actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of TransferFromReturn created based on parsed data
    function deserializeTransferFromReturn(bytes memory rawResp) internal pure returns (DataCapTypes.TransferFromReturn memory ret) {
        uint byteIdx = 0;
        uint len;
        bytes memory tmp;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 4);

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.from_balance = tmp.deserializeBigInt();

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.to_balance = tmp.deserializeBigInt();

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.allowance = tmp.deserializeBigInt();

        (ret.recipient_data, byteIdx) = rawResp.readBytes(byteIdx);

        return ret;
    }

    /// @notice serialize IncreaseAllowanceParams struct to cbor in order to pass as arguments to the datacap actor
    /// @param params IncreaseAllowanceParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeIncreaseAllowanceParams(DataCapTypes.IncreaseAllowanceParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.operator);
        buf.writeBytes(params.increase.serializeBigInt());

        return buf.data();
    }

    /// @notice serialize DecreaseAllowanceParams struct to cbor in order to pass as arguments to the datacap actor
    /// @param params DecreaseAllowanceParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeDecreaseAllowanceParams(DataCapTypes.DecreaseAllowanceParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.operator);
        buf.writeBytes(params.decrease.serializeBigInt());

        return buf.data();
    }

    /// @notice serialize RevokeAllowanceParams struct to cbor in order to pass as arguments to the datacap actor
    /// @param params RevokeAllowanceParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeRevokeAllowanceParams(DataCapTypes.RevokeAllowanceParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.writeBytes(params.operator);

        return buf.data();
    }

    /// @notice serialize BurnParams struct to cbor in order to pass as arguments to the datacap actor
    /// @param params BurnParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeBurnParams(DataCapTypes.BurnParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.writeBytes(params.amount.serializeBigInt());

        return buf.data();
    }

    /// @notice deserialize BurnReturn struct from cbor encoded bytes coming from a datacap actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of BurnReturn created based on parsed data
    function deserializeBurnReturn(bytes memory rawResp) internal pure returns (DataCapTypes.BurnReturn memory ret) {
        uint byteIdx = 0;
        uint len;
        bytes memory tmp;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 1);

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.balance = tmp.deserializeBigInt();

        return ret;
    }

    /// @notice serialize BurnFromParams struct to cbor in order to pass as arguments to the datacap actor
    /// @param params BurnFromParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeBurnFromParams(DataCapTypes.BurnFromParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.owner);
        buf.writeBytes(params.amount.serializeBigInt());

        return buf.data();
    }

    /// @notice deserialize BurnFromReturn struct from cbor encoded bytes coming from a datacap actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of BurnFromReturn created based on parsed data
    function deserializeBurnFromReturn(bytes memory rawResp) internal pure returns (DataCapTypes.BurnFromReturn memory ret) {
        uint byteIdx = 0;
        uint len;
        bytes memory tmp;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.balance = tmp.deserializeBigInt();

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.allowance = tmp.deserializeBigInt();

        return ret;
    }
}
