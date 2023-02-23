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
import "../types/VerifRegTypes.sol";
import "../utils/CborDecode.sol";
import "../utils/Misc.sol";
import "./BigIntCbor.sol";

/// @title This library is a set of functions meant to handle CBOR parameters serialization and return values deserialization for VerifReg actor exported methods.
/// @author Zondax AG
library VerifRegCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;
    using BigIntCBOR for BigInt;
    using BigIntCBOR for bytes;

    /// @notice serialize GetClaimsParams struct to cbor in order to pass as arguments to the verified registry actor
    /// @param params GetClaimsParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeGetClaimsParams(VerifRegTypes.GetClaimsParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        uint claimIdsLen = params.claim_ids.length;

        buf.startFixedArray(2);
        buf.writeUInt64(params.provider);
        buf.startFixedArray(uint64(claimIdsLen));
        for (uint i = 0; i < claimIdsLen; i++) {
            buf.writeUInt64(params.claim_ids[i]);
        }

        return buf.data();
    }

    /// @notice deserialize GetClaimsReturn struct from cbor encoded bytes coming from a verified registry actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of GetClaimsReturn created based on parsed data
    function deserializeGetClaimsReturn(bytes memory rawResp) internal pure returns (VerifRegTypes.GetClaimsReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.batch_info.success_count, byteIdx) = rawResp.readUInt32(byteIdx);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.batch_info.fail_codes = new CommonTypes.FailCode[](len);

        for (uint i = 0; i < len; i++) {
            (len, byteIdx) = rawResp.readFixedArray(byteIdx);
            assert(len == 2);

            (ret.batch_info.fail_codes[i].idx, byteIdx) = rawResp.readUInt32(byteIdx);
            (ret.batch_info.fail_codes[i].code, byteIdx) = rawResp.readUInt32(byteIdx);
        }

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.claims = new VerifRegTypes.Claim[](len);

        for (uint i = 0; i < len; i++) {
            (len, byteIdx) = rawResp.readFixedArray(byteIdx);
            assert(len == 8);

            (ret.claims[i].provider, byteIdx) = rawResp.readUInt64(byteIdx);
            (ret.claims[i].client, byteIdx) = rawResp.readUInt64(byteIdx);
            (ret.claims[i].data, byteIdx) = rawResp.readBytes(byteIdx);
            (ret.claims[i].size, byteIdx) = rawResp.readUInt64(byteIdx);
            (ret.claims[i].term_min, byteIdx) = rawResp.readInt64(byteIdx);
            (ret.claims[i].term_max, byteIdx) = rawResp.readInt64(byteIdx);
            (ret.claims[i].term_start, byteIdx) = rawResp.readInt64(byteIdx);
            (ret.claims[i].sector, byteIdx) = rawResp.readUInt64(byteIdx);
        }

        return ret;
    }

    /// @notice serialize AddVerifierClientParams struct to cbor in order to pass as arguments to the verified registry actor
    /// @param params AddVerifierClientParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeAddVerifierClientParams(VerifRegTypes.AddVerifierClientParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.addr);
        buf.writeBytes(params.allowance);

        return buf.data();
    }

    /// @notice serialize RemoveExpiredAllocationsParams struct to cbor in order to pass as arguments to the verified registry actor
    /// @param params RemoveExpiredAllocationsParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeRemoveExpiredAllocationsParams(VerifRegTypes.RemoveExpiredAllocationsParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        uint allocationIdsLen = params.allocation_ids.length;

        buf.startFixedArray(2);
        buf.writeUInt64(params.client);
        buf.startFixedArray(uint64(allocationIdsLen));
        for (uint i = 0; i < allocationIdsLen; i++) {
            buf.writeUInt64(params.allocation_ids[i]);
        }

        return buf.data();
    }

    /// @notice deserialize RemoveExpiredAllocationsReturn struct from cbor encoded bytes coming from a verified registry actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of RemoveExpiredAllocationsReturn created based on parsed data
    function deserializeRemoveExpiredAllocationsReturn(bytes memory rawResp) internal pure returns (VerifRegTypes.RemoveExpiredAllocationsReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 3);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.considered = new uint64[](len);

        for (uint i = 0; i < len; i++) {
            (ret.considered[i], byteIdx) = rawResp.readUInt64(byteIdx);
        }

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.results.success_count, byteIdx) = rawResp.readUInt32(byteIdx);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.results.fail_codes = new CommonTypes.FailCode[](len);

        for (uint i = 0; i < len; i++) {
            (len, byteIdx) = rawResp.readFixedArray(byteIdx);
            assert(len == 2);

            (ret.results.fail_codes[i].idx, byteIdx) = rawResp.readUInt32(byteIdx);
            (ret.results.fail_codes[i].code, byteIdx) = rawResp.readUInt32(byteIdx);
        }

        bytes memory tmp;
        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.datacap_recovered = tmp.deserializeBigInt();

        return ret;
    }

    /// @notice serialize ExtendClaimTermsParams struct to cbor in order to pass as arguments to the verified registry actor
    /// @param params ExtendClaimTermsParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeExtendClaimTermsParams(VerifRegTypes.ExtendClaimTermsParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        uint termsLen = params.terms.length;

        buf.startFixedArray(1);
        buf.startFixedArray(uint64(termsLen));
        for (uint i = 0; i < termsLen; i++) {
            buf.startFixedArray(3);
            buf.writeUInt64(params.terms[i].provider);
            buf.writeUInt64(params.terms[i].claim_id);
            buf.writeInt64(params.terms[i].term_max);
        }

        return buf.data();
    }

    /// @notice deserialize BatchReturn struct from cbor encoded bytes coming from a verified registry actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of BatchReturn created based on parsed data
    function deserializeBatchReturn(bytes memory rawResp) internal pure returns (CommonTypes.BatchReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.success_count, byteIdx) = rawResp.readUInt32(byteIdx);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.fail_codes = new CommonTypes.FailCode[](len);

        for (uint i = 0; i < len; i++) {
            (len, byteIdx) = rawResp.readFixedArray(byteIdx);
            assert(len == 2);

            (ret.fail_codes[i].idx, byteIdx) = rawResp.readUInt32(byteIdx);
            (ret.fail_codes[i].code, byteIdx) = rawResp.readUInt32(byteIdx);
        }

        return ret;
    }

    /// @notice serialize RemoveExpiredClaimsParams struct to cbor in order to pass as arguments to the verified registry actor
    /// @param params RemoveExpiredClaimsParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeRemoveExpiredClaimsParams(VerifRegTypes.RemoveExpiredClaimsParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        uint claimIdsLen = params.claim_ids.length;

        buf.startFixedArray(2);
        buf.writeUInt64(params.provider);
        buf.startFixedArray(uint64(claimIdsLen));
        for (uint i = 0; i < claimIdsLen; i++) {
            buf.writeUInt64(params.claim_ids[i]);
        }

        return buf.data();
    }

    /// @notice deserialize RemoveExpiredClaimsReturn struct from cbor encoded bytes coming from a verified registry actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of RemoveExpiredClaimsReturn created based on parsed data
    function deserializeRemoveExpiredClaimsReturn(bytes memory rawResp) internal pure returns (VerifRegTypes.RemoveExpiredClaimsReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.considered = new uint64[](len);

        for (uint i = 0; i < len; i++) {
            (ret.considered[i], byteIdx) = rawResp.readUInt64(byteIdx);
        }

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.results.success_count, byteIdx) = rawResp.readUInt32(byteIdx);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.results.fail_codes = new CommonTypes.FailCode[](len);

        for (uint i = 0; i < len; i++) {
            (len, byteIdx) = rawResp.readFixedArray(byteIdx);
            assert(len == 2);

            (ret.results.fail_codes[i].idx, byteIdx) = rawResp.readUInt32(byteIdx);
            (ret.results.fail_codes[i].code, byteIdx) = rawResp.readUInt32(byteIdx);
        }

        return ret;
    }
}
