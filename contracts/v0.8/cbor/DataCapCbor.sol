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
        uint256 capacity = 0;

        capacity += Misc.getPrefixSize(2);
        capacity += Misc.getBytesSize(params.owner.data);
        capacity += Misc.getBytesSize(params.operator.data);

        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

        buf.startFixedArray(2);
        buf.writeBytes(params.owner.data);
        buf.writeBytes(params.operator.data);

        return buf.data();
    }

    /// @notice serialize TransferParams struct to cbor in order to pass as arguments to the datacap actor
    /// @param params TransferParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeTransferParams(DataCapTypes.TransferParams memory params) internal pure returns (bytes memory) {
        uint256 capacity = 0;
        bytes memory amount = params.amount.serializeBigInt();

        capacity += Misc.getPrefixSize(3);
        capacity += Misc.getBytesSize(params.to.data);
        capacity += Misc.getBytesSize(amount);
        capacity += Misc.getBytesSize(params.operator_data);

        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

        buf.startFixedArray(3);
        buf.writeBytes(params.to.data);
        buf.writeBytes(amount);
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
        uint256 capacity = 0;
        bytes memory amount = params.amount.serializeBigInt();

        capacity += Misc.getPrefixSize(4);
        capacity += Misc.getBytesSize(params.from.data);
        capacity += Misc.getBytesSize(params.to.data);
        capacity += Misc.getBytesSize(amount);
        capacity += Misc.getBytesSize(params.operator_data);

        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

        buf.startFixedArray(4);
        buf.writeBytes(params.from.data);
        buf.writeBytes(params.to.data);
        buf.writeBytes(amount);
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
        uint256 capacity = 0;
        bytes memory increase = params.increase.serializeBigInt();

        capacity += Misc.getPrefixSize(2);
        capacity += Misc.getBytesSize(params.operator.data);
        capacity += Misc.getBytesSize(increase);

        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

        buf.startFixedArray(2);
        buf.writeBytes(params.operator.data);
        buf.writeBytes(increase);

        return buf.data();
    }

    /// @notice serialize DecreaseAllowanceParams struct to cbor in order to pass as arguments to the datacap actor
    /// @param params DecreaseAllowanceParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeDecreaseAllowanceParams(DataCapTypes.DecreaseAllowanceParams memory params) internal pure returns (bytes memory) {
        uint256 capacity = 0;
        bytes memory decrease = params.decrease.serializeBigInt();

        capacity += Misc.getPrefixSize(2);
        capacity += Misc.getBytesSize(params.operator.data);
        capacity += Misc.getBytesSize(decrease);

        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

        buf.startFixedArray(2);
        buf.writeBytes(params.operator.data);
        buf.writeBytes(decrease);

        return buf.data();
    }

    /// @notice serialize BurnFromParams struct to cbor in order to pass as arguments to the datacap actor
    /// @param params BurnFromParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeBurnFromParams(DataCapTypes.BurnFromParams memory params) internal pure returns (bytes memory) {
        uint256 capacity = 0;
        bytes memory amount = params.amount.serializeBigInt();

        capacity += Misc.getPrefixSize(2);
        capacity += Misc.getBytesSize(params.owner.data);
        capacity += Misc.getBytesSize(amount);
        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

        buf.startFixedArray(2);
        buf.writeBytes(params.owner.data);
        buf.writeBytes(amount);

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
