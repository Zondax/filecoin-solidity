// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "./CommonTypes.sol";

/// @title Filecoin Verified Registry actor types for Solidity.
/// @author Zondax AG
library VerifRegTypes {
    struct GetClaimsParams {
        uint64 provider;
        uint64[] claim_ids;
    }
    struct GetClaimsReturn {
        CommonTypes.BatchReturn batch_info;
        CommonTypes.Claim[] claims;
    }
    struct AddVerifierClientParams {
        bytes addr;
        uint256 allowance;
    }
}
