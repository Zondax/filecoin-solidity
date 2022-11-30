// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "solidity-cborutils/contracts/CBOR.sol";

import {CommonTypes} from "../types/CommonTypes.sol";
import {MinerTypes} from "../types/MinerTypes.sol";
import "../utils/CborDecode.sol";
import "../utils/Misc.sol";

/// @title FIXME
/// @author Zondax AG
library ChangeBeneficiaryCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serialize(MinerTypes.ChangeBeneficiaryParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(3);
        buf.writeBytes(params.new_beneficiary);
        buf.writeBytes(Misc.toBytes(uint256(params.new_quota)));
        buf.writeUInt64(params.new_expiration);

        return buf.data();
    }
}

library GetOwnerCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function deserialize(MinerTypes.GetOwnerReturn memory ret, bytes memory rawResp) internal pure {
        uint byteIdx = 0;
        uint len;

        (ret.owner, byteIdx) = rawResp.readBytes(byteIdx);
    }
}

library IsControllingAddressCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function deserialize(MinerTypes.IsControllingAddressReturn memory ret, bytes memory rawResp) internal pure {
        bool is_controlling;
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 1);

        (is_controlling, byteIdx) = rawResp.readBool(byteIdx);

        ret.is_controlling = is_controlling;
    }
}

library GetSectorSizeCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function deserialize(MinerTypes.GetSectorSizeReturn memory ret, bytes memory rawResp) internal pure {
        uint64 sector_size;
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 1);

        (sector_size, byteIdx) = rawResp.readUInt64(byteIdx);

        ret.sector_size = sector_size;
    }
}

library GetAvailableBalanceCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function deserialize(MinerTypes.GetAvailableBalanceReturn memory ret, bytes memory rawResp) internal pure {
        uint byteIdx = 0;
        uint len;

        bytes memory tmp;
        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.available_balance = int256(Misc.toUint256(tmp, 0));
    }
}

library AddressCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serializeAddress(bytes memory addr) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.writeBytes(addr);

        return buf.data();
    }

    function deserializeAddress(bytes memory ret) internal pure returns (bytes memory) {
        bytes memory addr;
        uint byteIdx = 0;
        uint len;

        (addr, byteIdx) = ret.readBytes(byteIdx);

        return addr;
    }
}

library GetBeneficiaryCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function deserialize(MinerTypes.GetBeneficiaryReturn memory ret, bytes memory rawResp) internal pure {
        bytes memory tmp;
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.active.beneficiary, byteIdx) = rawResp.readBytes(byteIdx);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 3);

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.active.term.quota = int256(Misc.toUint256(tmp, 0));

        (tmp, byteIdx) = rawResp.readBytes(byteIdx);
        ret.active.term.used_quota = int256(Misc.toUint256(tmp, 0));

        (ret.active.term.expiration, byteIdx) = rawResp.readUInt64(byteIdx);

        if (!rawResp.isNullNext(byteIdx)) {
            (len, byteIdx) = rawResp.readFixedArray(byteIdx);
            assert(len == 5);

            (ret.proposed.new_beneficiary, byteIdx) = rawResp.readBytes(byteIdx);
            (ret.proposed.new_quota, byteIdx) = rawResp.readInt256(byteIdx);
            (ret.proposed.new_expiration, byteIdx) = rawResp.readUInt64(byteIdx);
            (ret.proposed.approved_by_beneficiary, byteIdx) = rawResp.readBool(byteIdx);
            (ret.proposed.approved_by_nominee, byteIdx) = rawResp.readBool(byteIdx);
        }
    }
}

library GetVestingFundsCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function deserialize(MinerTypes.GetVestingFundsReturn memory ret, bytes memory rawResp) internal pure {
        int64 epoch;
        int256 amount;
        bytes memory tmp;

        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 1);

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.vesting_funds = new CommonTypes.VestingFunds[](len);

        for (uint i = 0; i < len; i++) {
            (epoch, byteIdx) = rawResp.readInt64(byteIdx);
            (tmp, byteIdx) = rawResp.readBytes(byteIdx);

            amount = int256(Misc.toUint256(tmp, 0));
            ret.vesting_funds[i] = CommonTypes.VestingFunds(epoch, amount);
        }
    }
}

library ChangeWorkerAddressCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serialize(MinerTypes.ChangeWorkerAddressParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.new_worker);
        buf.startFixedArray(uint64(params.new_control_addresses.length));

        for (uint64 i = 0; i < params.new_control_addresses.length; i++) {
            buf.writeBytes(params.new_control_addresses[i]);
        }

        return buf.data();
    }
}

library ChangePeerIDCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serialize(MinerTypes.ChangePeerIDParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.writeBytes(params.new_id);

        return buf.data();
    }
}

library ChangeMultiaddrsCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serialize(MinerTypes.ChangeMultiaddrsParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(1);
        buf.startFixedArray(uint64(params.new_multi_addrs.length));

        for (uint64 i = 0; i < params.new_multi_addrs.length; i++) {
            buf.writeBytes(params.new_multi_addrs[i]);
        }

        return buf.data();
    }
}

library GetPeerIDCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function deserialize(MinerTypes.GetPeerIDReturn memory ret, bytes memory rawResp) internal pure {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        (ret.peer_id, byteIdx) = rawResp.readBytes(byteIdx);
    }
}

library GetMultiaddrsCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function deserialize(MinerTypes.GetMultiaddrsReturn memory ret, bytes memory rawResp) internal pure {
        int64 epoch;
        int256 amount;

        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        ret.multi_addrs = new bytes[](len);

        for (uint i = 0; i < len; i++) {
            (ret.multi_addrs[i], byteIdx) = rawResp.readBytes(byteIdx);
        }
    }
}
