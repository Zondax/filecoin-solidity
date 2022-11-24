// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "solidity-cborutils/contracts/CBOR.sol";

import {MarketTypes} from "../types/MarketTypes.sol";

/// @title FIXME
/// @author Zondax AG
library WithdrawBalanceParamsCBOR {
    using CBOR for CBOR.CBORBuffer;

    function serialize(MarketTypes.WithdrawBalanceParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.provider_or_client);
        buf.writeUInt256(params.tokenAmount);

        return buf.data();
    }
}
