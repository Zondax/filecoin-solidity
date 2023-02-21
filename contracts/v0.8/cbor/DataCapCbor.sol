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

import {CommonTypes} from "../types/CommonTypes.sol";
import {DataCapTypes} from "../types/DataCapTypes.sol";
import "../utils/CborDecode.sol";
import "../utils/Misc.sol";
import "./BigIntCbor.sol";

/// @title This library is a set of functions meant to handle CBOR parameters serialization and return values deserialization for DataCap actor exported methods.
/// @author Zondax AG
library DataCapCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;
    using BigIntCBOR for BigInt;
    using BigIntCBOR for bytes;

    function serializeGetAllowanceParams(DataCapTypes.GetAllowanceParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.owner);
        buf.writeBytes(params.operator);

        return buf.data();
    }

    function serializeTransferParams(DataCapTypes.TransferParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(3);
        buf.writeBytes(params.to);
        buf.writeBytes(params.amount.serializeBigInt());
        buf.writeBytes(params.operator_data);

        return buf.data();
    }

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

    function serializeTransferFromParams(DataCapTypes.TransferFromParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(4);
        buf.writeBytes(params.from);
        buf.writeBytes(params.to);
        buf.writeBytes(params.amount.serializeBigInt());
        buf.writeBytes(params.operator_data);

        return buf.data();
    }

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

    function serializeIncreaseAllowanceParams(DataCapTypes.IncreaseAllowanceParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.operator);
        buf.writeBytes(params.increase.serializeBigInt());

        return buf.data();
    }

    function serializeDecreaseAllowanceParams(DataCapTypes.DecreaseAllowanceParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.operator);
        buf.writeBytes(params.decrease.serializeBigInt());

        return buf.data();
    }

    function serializeRevokeAllowanceParams(DataCapTypes.RevokeAllowanceParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.writeBytes(params.operator);

        return buf.data();
    }

    function serializeBurnParams(DataCapTypes.BurnParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.writeBytes(params.amount.serializeBigInt());

        return buf.data();
    }

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

    function serializeBurnFromParams(DataCapTypes.BurnFromParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.owner);
        buf.writeBytes(params.amount.serializeBigInt());

        return buf.data();
    }

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
