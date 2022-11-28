// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "solidity-cborutils/contracts/CBOR.sol";

import {CommonTypes} from "../types/CommonTypes.sol";
import {VerifRegTypes} from "../types/VerifRegTypes.sol";
import "../utils/CborDecode.sol";

/// @title FIXME
/// @author Zondax AG
library GetClaimsCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serialize(VerifRegTypes.GetClaimsParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
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

    function deserialize(VerifRegTypes.GetClaimsReturn memory ret, bytes memory rawResp) internal pure {
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
        ret.claims = new CommonTypes.Claim[](len);

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
    }
}

library AddVerifierClientCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serialize(VerifRegTypes.AddVerifierClientParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.addr);
        buf.writeUInt256(params.allowance);

        return buf.data();
    }
}
