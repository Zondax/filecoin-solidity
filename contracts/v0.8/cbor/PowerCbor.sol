// SPDX-License-Identifier: Apache-2.0
// DRAFT - NO AUDITED CODE
pragma solidity >=0.4.25 <=0.8.17;

import "solidity-cborutils/contracts/CBOR.sol";

import {CommonTypes} from "../types/CommonTypes.sol";
import {PowerTypes} from "../types/PowerTypes.sol";
import "../utils/CborDecode.sol";
import "../utils/Misc.sol";

/// @title FIXME
/// @author Zondax AG
library CreateMinerCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serialize(PowerTypes.CreateMinerParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        uint multiaddrsLen = params.multiaddrs.length;

        buf.startFixedArray(5);
        buf.writeBytes(params.owner);
        buf.writeBytes(params.worker);
        buf.writeInt64(int64(uint64(params.window_post_proof_type)));
        buf.writeBytes(params.peer);
        buf.startFixedArray(uint64(multiaddrsLen));
        for (uint i = 0; i < multiaddrsLen; i++) {
            buf.writeBytes(params.multiaddrs[i]);
        }

        return buf.data();
    }

    function deserialize(PowerTypes.CreateMinerReturn memory ret, bytes memory rawResp) internal pure {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.id_address, byteIdx) = rawResp.readBytes(byteIdx);
        (ret.robust_address, byteIdx) = rawResp.readBytes(byteIdx);
    }
}

/// @title FIXME
/// @author Zondax AG
library MinerCountCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function deserialize(PowerTypes.MinerCountReturn memory ret, bytes memory rawResp) internal pure {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 1);

        (ret.miner_count, byteIdx) = rawResp.readInt64(byteIdx);
    }
}

/// @title FIXME
/// @author Zondax AG
library MinerConsensusCountCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function deserialize(PowerTypes.MinerConsensusCountReturn memory ret, bytes memory rawResp) internal pure {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 1);

        (ret.miner_consensus_count, byteIdx) = rawResp.readInt64(byteIdx);
    }
}

/// @title FIXME
/// @author Zondax AG
library NetworkRawPowerCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function deserialize(PowerTypes.NetworkRawPowerReturn memory ret, bytes memory rawResp) internal pure {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 1);

        bytes memory tmp;
        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.raw_byte_power = int256(Misc.toUint256(tmp, 0));
    }
}

/// @title FIXME
/// @author Zondax AG
library MinerRawPowerCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serialize(PowerTypes.MinerRawPowerParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.writeUInt64(params.miner);

        return buf.data();
    }

    function deserialize(PowerTypes.MinerRawPowerReturn memory ret, bytes memory rawResp) internal pure {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        bytes memory tmp;
        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.raw_byte_power = int256(Misc.toUint256(tmp, 0));

        (ret.meets_consensus_minimum, byteIdx) = rawResp.readBool(byteIdx);
    }
}
