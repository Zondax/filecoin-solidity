// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "solidity-cborutils/contracts/CBOR.sol";

import {MarketTypes} from "../types/MarketTypes.sol";
import "../utils/CborDecode.sol";

/// @title FIXME
/// @author Zondax AG
library WithdrawBalanceParamsCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serialize(MarketTypes.WithdrawBalanceParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.provider_or_client);
        buf.writeUInt256(params.tokenAmount);

        return buf.data();
    }

    function deserialize(MarketTypes.WithdrawBalanceReturn memory ret, bytes memory rawResp) internal pure {
        uint256 amount_withdrawn;
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 1);

        (amount_withdrawn, byteIdx) = rawResp.readUInt256(byteIdx);

        ret.amount_withdrawn = amount_withdrawn;
    }
}

library GetBalanceCBOR {
    using CBORDecoder for bytes;

    function deserialize(MarketTypes.GetBalanceReturn memory ret, bytes memory rawResp) internal pure {
        uint256 balance;
        uint256 locked;
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (balance, byteIdx) = rawResp.readUInt256(byteIdx);
        (locked, byteIdx) = rawResp.readUInt256(byteIdx);

        ret.balance = balance;
        ret.locked = locked;
    }
}
