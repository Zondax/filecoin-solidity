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

import "../types/MarketTypes.sol";
import "./BigIntCbor.sol";
import "../utils/CborDecode.sol";
import "../utils/Misc.sol";
import "./FilecoinCbor.sol";

/// @title This library is a set of functions meant to handle CBOR parameters serialization and return values deserialization for Market actor exported methods.
/// @author Zondax AG
library MarketCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;
    using BigIntCBOR for CommonTypes.BigInt;
    using BigIntCBOR for bytes;
    using FilecoinCBOR for CBOR.CBORBuffer;

    /// @notice serialize WithdrawBalanceParams struct to cbor in order to pass as arguments to the market actor
    /// @param params WithdrawBalanceParams to serialize as cbor
    /// @return response cbor serialized data as bytes
    function serializeWithdrawBalanceParams(MarketTypes.WithdrawBalanceParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.provider_or_client.data);
        buf.writeBytes(params.tokenAmount.serializeBigInt());

        return buf.data();
    }

    /// @notice deserialize WithdrawBalanceReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of WithdrawBalanceReturn created based on parsed data
    function deserializeWithdrawBalanceReturn(bytes memory rawResp) internal pure returns (MarketTypes.WithdrawBalanceReturn memory ret) {
        bytes memory tmp;
        uint byteIdx = 0;

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.amount_withdrawn = tmp.deserializeBigInt();

        return ret;
    }

    /// @notice deserialize GetBalanceReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetBalanceReturn created based on parsed data
    function deserializeGetBalanceReturn(bytes memory rawResp) internal pure returns (MarketTypes.GetBalanceReturn memory ret) {
        uint byteIdx = 0;
        uint len;
        bytes memory tmp;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.balance = tmp.deserializeBigInt();

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.locked = tmp.deserializeBigInt();

        return ret;
    }

    /// @notice deserialize GetDealDataCommitmentReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetDealDataCommitmentReturn created based on parsed data
    function deserializeGetDealDataCommitmentReturn(bytes memory rawResp) internal pure returns (MarketTypes.GetDealDataCommitmentReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);

        if (len > 0) {
            (ret.data, byteIdx) = rawResp.readBytes(byteIdx);
            (ret.size, byteIdx) = rawResp.readUInt64(byteIdx);
        } else {
            ret.data = new bytes(0);
            ret.size = 0;
        }

        return ret;
    }

    /// @notice deserialize GetDealClientReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetDealClientReturn created based on parsed data
    function deserializeGetDealClientReturn(bytes memory rawResp) internal pure returns (MarketTypes.GetDealClientReturn memory ret) {
        uint byteIdx = 0;

        (ret.client, byteIdx) = rawResp.readUInt64(byteIdx);

        return ret;
    }

    /// @notice deserialize GetDealProviderReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetDealProviderReturn created based on parsed data
    function deserializeGetDealProviderReturn(bytes memory rawResp) internal pure returns (MarketTypes.GetDealProviderReturn memory ret) {
        uint byteIdx = 0;

        (ret.provider, byteIdx) = rawResp.readUInt64(byteIdx);
        return ret;
    }

    /// @notice deserialize GetDealLabelReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetDealLabelReturn created based on parsed data
    function deserializeGetDealLabelReturn(bytes memory rawResp) internal pure returns (MarketTypes.GetDealLabelReturn memory ret) {
        uint byteIdx = 0;

        (ret.label, byteIdx) = rawResp.readString(byteIdx);

        return ret;
    }

    /// @notice deserialize GetDealTermReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetDealTermReturn created based on parsed data
    function deserializeGetDealTermReturn(bytes memory rawResp) internal pure returns (MarketTypes.GetDealTermReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.start, byteIdx) = rawResp.readInt64(byteIdx);
        (ret.end, byteIdx) = rawResp.readInt64(byteIdx);

        return ret;
    }

    /// @notice deserialize GetDealEpochPriceReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetDealEpochPriceReturn created based on parsed data
    function deserializeGetDealEpochPriceReturn(bytes memory rawResp) internal pure returns (MarketTypes.GetDealEpochPriceReturn memory ret) {
        bytes memory tmp;
        uint byteIdx = 0;

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.price_per_epoch = tmp.deserializeBigInt();

        return ret;
    }

    /// @notice deserialize GetDealClientCollateralReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetDealClientCollateralReturn created based on parsed data
    function deserializeGetDealClientCollateralReturn(bytes memory rawResp) internal pure returns (MarketTypes.GetDealClientCollateralReturn memory ret) {
        bytes memory tmp;
        uint byteIdx = 0;

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.collateral = tmp.deserializeBigInt();

        return ret;
    }

    /// @notice deserialize GetDealProviderCollateralReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetDealProviderCollateralReturn created based on parsed data
    function deserializeGetDealProviderCollateralReturn(bytes memory rawResp) internal pure returns (MarketTypes.GetDealProviderCollateralReturn memory ret) {
        bytes memory tmp;
        uint byteIdx = 0;

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.collateral = tmp.deserializeBigInt();

        return ret;
    }

    /// @notice deserialize GetDealVerifiedReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetDealVerifiedReturn created based on parsed data
    function deserializeGetDealVerifiedReturn(bytes memory rawResp) internal pure returns (MarketTypes.GetDealVerifiedReturn memory ret) {
        uint byteIdx = 0;

        (ret.verified, byteIdx) = rawResp.readBool(byteIdx);

        return ret;
    }

    /// @notice deserialize GetDealActivationReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetDealActivationReturn created based on parsed data
    function deserializeGetDealActivationReturn(bytes memory rawResp) internal pure returns (MarketTypes.GetDealActivationReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.activated, byteIdx) = rawResp.readInt64(byteIdx);
        (ret.terminated, byteIdx) = rawResp.readInt64(byteIdx);

        return ret;
    }

    /// @notice serialize PublishStorageDealsParams struct to cbor in order to pass as arguments to the market actor
    /// @param params PublishStorageDealsParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializePublishStorageDealsParams(MarketTypes.PublishStorageDealsParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.startFixedArray(uint64(params.deals.length));

        for (uint64 i = 0; i < params.deals.length; i++) {
            buf.startFixedArray(2);

            buf.startFixedArray(11);

            buf.writeCid(params.deals[i].proposal.piece_cid);
            buf.writeUInt64(params.deals[i].proposal.piece_size);
            buf.writeBool(params.deals[i].proposal.verified_deal);
            buf.writeBytes(params.deals[i].proposal.client.data);
            buf.writeBytes(params.deals[i].proposal.provider.data);
            buf.writeString(params.deals[i].proposal.label);
            buf.writeInt64(params.deals[i].proposal.start_epoch);
            buf.writeInt64(params.deals[i].proposal.end_epoch);
            buf.writeBytes(params.deals[i].proposal.storage_price_per_epoch.serializeBigInt());
            buf.writeBytes(params.deals[i].proposal.provider_collateral.serializeBigInt());
            buf.writeBytes(params.deals[i].proposal.client_collateral.serializeBigInt());

            buf.writeBytes(params.deals[i].client_signature);
        }

        return buf.data();
    }

    /// @notice deserialize PublishStorageDealsReturn struct from cbor encoded bytes coming from a market actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of PublishStorageDealsReturn created based on parsed data
    function deserializePublishStorageDealsReturn(bytes memory rawResp) internal pure returns (MarketTypes.PublishStorageDealsReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.ids = new uint64[](len);

        for (uint i = 0; i < len; i++) {
            (ret.ids[i], byteIdx) = rawResp.readUInt64(byteIdx);
        }

        (ret.valid_deals, byteIdx) = rawResp.readBytes(byteIdx);

        return ret;
    }

    /// @notice serialize deal id (uint64) to cbor in order to pass as arguments to the market actor
    /// @param id deal id to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeDealID(uint64 id) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.writeUInt64(id);

        return buf.data();
    }
}
