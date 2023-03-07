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

import "./BigIntCbor.sol";
import "./FilecoinCbor.sol";

import "../types/MinerTypes.sol";
import "../types/CommonTypes.sol";
import "../utils/CborDecode.sol";
import "../utils/Misc.sol";

/// @title This library is a set of functions meant to handle CBOR parameters serialization and return values deserialization for Miner actor exported methods.
/// @author Zondax AG
library MinerCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;
    using BigIntCBOR for *;
    using FilecoinCBOR for *;

    /// @notice serialize ChangeBeneficiaryParams struct to cbor in order to pass as arguments to the miner actor
    /// @param params ChangeBeneficiaryParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeChangeBeneficiaryParams(MinerTypes.ChangeBeneficiaryParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(3);
        buf.writeBytes(params.new_beneficiary.data);
        buf.writeBytes(params.new_quota.serializeBigInt());
        buf.writeChainEpoch(params.new_expiration);

        return buf.data();
    }

    /// @notice deserialize GetOwnerReturn struct from cbor encoded bytes coming from a miner actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetOwnerReturn created based on parsed data
    function deserializeGetOwnerReturn(bytes memory rawResp) internal pure returns (MinerTypes.GetOwnerReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.owner.data, byteIdx) = rawResp.readBytes(byteIdx);

        if (!rawResp.isNullNext(byteIdx)) {
            (ret.proposed.data, byteIdx) = rawResp.readBytes(byteIdx);
        } else {
            ret.proposed.data = new bytes(0);
        }

        return ret;
    }

    /// @notice deserialize GetBeneficiaryReturn struct from cbor encoded bytes coming from a miner actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetBeneficiaryReturn created based on parsed data
    function deserializeGetBeneficiaryReturn(bytes memory rawResp) internal pure returns (MinerTypes.GetBeneficiaryReturn memory ret) {
        bytes memory tmp;
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.active.beneficiary.data, byteIdx) = rawResp.readBytes(byteIdx);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 3);

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        if (tmp.length > 0) {
            ret.active.term.quota = tmp.deserializeBigInt();
        } else {
            ret.active.term.quota = CommonTypes.BigInt(new bytes(0), false);
        }

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        if (tmp.length > 0) {
            ret.active.term.used_quota = tmp.deserializeBigInt();
        } else {
            ret.active.term.used_quota = CommonTypes.BigInt(new bytes(0), false);
        }

        (ret.active.term.expiration, byteIdx) = rawResp.readChainEpoch(byteIdx);

        if (!rawResp.isNullNext(byteIdx)) {
            (len, byteIdx) = rawResp.readFixedArray(byteIdx);
            assert(len == 5);

            (ret.proposed.new_beneficiary.data, byteIdx) = rawResp.readBytes(byteIdx);

            (tmp, byteIdx) = rawResp.readBytes(byteIdx);
            if (tmp.length > 0) {
                ret.proposed.new_quota = tmp.deserializeBigInt();
            } else {
                ret.proposed.new_quota = CommonTypes.BigInt(new bytes(0), false);
            }

            (ret.proposed.new_expiration, byteIdx) = rawResp.readChainEpoch(byteIdx);
            (ret.proposed.approved_by_beneficiary, byteIdx) = rawResp.readBool(byteIdx);
            (ret.proposed.approved_by_nominee, byteIdx) = rawResp.readBool(byteIdx);
        }

        return ret;
    }

    /// @notice deserialize GetVestingFundsReturn struct from cbor encoded bytes coming from a miner actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetVestingFundsReturn created based on parsed data
    function deserializeGetVestingFundsReturn(bytes memory rawResp) internal pure returns (MinerTypes.GetVestingFundsReturn memory ret) {
        CommonTypes.ChainEpoch epoch;
        CommonTypes.BigInt memory amount;
        bytes memory tmp;

        uint byteIdx = 0;
        uint len;
        uint leni;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 1);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.vesting_funds = new MinerTypes.VestingFunds[](len);

        for (uint i = 0; i < len; i++) {
            (leni, byteIdx) = rawResp.readFixedArray(byteIdx);
            assert(leni == 2);

            (epoch, byteIdx) = rawResp.readChainEpoch(byteIdx);
            (tmp, byteIdx) = rawResp.readBytes(byteIdx);

            amount = tmp.deserializeBigInt();
            ret.vesting_funds[i] = MinerTypes.VestingFunds(epoch, amount);
        }

        return ret;
    }

    /// @notice serialize ChangeWorkerAddressParams struct to cbor in order to pass as arguments to the miner actor
    /// @param params ChangeWorkerAddressParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeChangeWorkerAddressParams(MinerTypes.ChangeWorkerAddressParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.new_worker.data);
        buf.startFixedArray(uint64(params.new_control_addresses.length));

        for (uint64 i = 0; i < params.new_control_addresses.length; i++) {
            buf.writeBytes(params.new_control_addresses[i].data);
        }

        return buf.data();
    }

    /// @notice serialize ChangeMultiaddrsParams struct to cbor in order to pass as arguments to the miner actor
    /// @param params ChangeMultiaddrsParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeChangeMultiaddrsParams(MinerTypes.ChangeMultiaddrsParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.startFixedArray(uint64(params.new_multi_addrs.length));

        for (uint64 i = 0; i < params.new_multi_addrs.length; i++) {
            buf.writeBytes(params.new_multi_addrs[i].data);
        }

        return buf.data();
    }

    /// @notice deserialize GetMultiaddrsReturn struct from cbor encoded bytes coming from a miner actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetMultiaddrsReturn created based on parsed data
    function deserializeGetMultiaddrsReturn(bytes memory rawResp) internal pure returns (MinerTypes.GetMultiaddrsReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 1);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.multi_addrs = new CommonTypes.FilAddress[](len);

        for (uint i = 0; i < len; i++) {
            (ret.multi_addrs[i].data, byteIdx) = rawResp.readBytes(byteIdx);
        }

        return ret;
    }
}
