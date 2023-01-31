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

import "../types/MultisigTypes.sol";
import "../utils/CborDecode.sol";
import "../utils/Misc.sol";
import "./BigIntCbor.sol";

/// @title FIXME
/// @author Zondax AG
library MultisigCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;
    using BigIntCBOR for BigInt;

    function serializeProposeParams(MultisigTypes.ProposeParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(4);
        buf.writeBytes(params.to);
        buf.writeBytes(params.value.serializeBigInt());
        buf.writeUInt64(params.method);
        buf.writeBytes(params.params);

        return buf.data();
    }

    function deserializeProposeReturn(bytes memory rawResp) internal pure returns (MultisigTypes.ProposeReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 4);

        (ret.txn_id, byteIdx) = rawResp.readInt64(byteIdx);
        (ret.applied, byteIdx) = rawResp.readBool(byteIdx);
        (ret.code, byteIdx) = rawResp.readUInt32(byteIdx);
        (ret.ret, byteIdx) = rawResp.readBytes(byteIdx);

        return ret;
    }

    function serializeTxnIDParams(MultisigTypes.TxnIDParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeInt64(params.id);
        buf.writeBytes(params.proposal_hash);

        return buf.data();
    }

    function deserializeApproveReturn(bytes memory rawResp) internal pure returns (MultisigTypes.ApproveReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 3);

        (ret.applied, byteIdx) = rawResp.readBool(byteIdx);
        (ret.code, byteIdx) = rawResp.readUInt32(byteIdx);
        (ret.ret, byteIdx) = rawResp.readBytes(byteIdx);

        return ret;
    }

    function serializeAddSignerParams(MultisigTypes.AddSignerParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.signer);
        buf.writeBool(params.increase);

        return buf.data();
    }

    function serializeRemoveSignerParams(MultisigTypes.RemoveSignerParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.signer);
        buf.writeBool(params.decrease);

        return buf.data();
    }

    function serializeSwapSignerParams(MultisigTypes.SwapSignerParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.from);
        buf.writeBytes(params.to);

        return buf.data();
    }

    function serializeChangeNumApprovalsThresholdParams(
        MultisigTypes.ChangeNumApprovalsThresholdParams memory params
    ) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.writeUInt64(params.new_threshold);

        return buf.data();
    }

    function serializeLockBalanceParams(MultisigTypes.LockBalanceParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(3);
        buf.writeInt64(params.start_epoch);
        buf.writeInt64(params.unlock_duration);
        buf.writeBytes(params.amount.serializeBigInt());

        return buf.data();
    }
}
