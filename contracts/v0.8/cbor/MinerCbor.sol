// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "solidity-cborutils/contracts/CBOR.sol";
import {MinerTypes} from "../types/MinerTypes.sol";

/// @title FIXME
/// @author Zondax AG
library ChangeBeneficiaryParamsCBOR {
    using CBOR for CBOR.CBORBuffer;

    function serialize(MinerTypes.ChangeBeneficiaryParams memory params) internal pure returns (bytes memory){
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startArray();
        buf.writeBytes(params.new_beneficiary);
        buf.writeInt256(params.new_quota);
        buf.writeUInt64(params.new_expiration);
        buf.endSequence();

        return buf.data();
    }
}
