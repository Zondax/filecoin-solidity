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
    struct RemoveExpiredAllocationsParams {
        // Client for which to remove expired allocations.
        uint64 client;
        // Optional list of allocation IDs to attempt to remove.
        // Empty means remove all eligible expired allocations.
        uint64[] allocation_ids;
    }
    struct RemoveExpiredAllocationsReturn {
        // Ids of the allocations that were either specified by the caller or discovered to be expired.
        uint64[] considered;
        // Results for each processed allocation.
        CommonTypes.BatchReturn results;
        // The amount of datacap reclaimed for the client.
        int256 datacap_recovered;
    }
    struct RemoveExpiredClaimsParams {
        // Provider to clean up (need not be the caller)
        uint64 provider;
        // Optional list of claim IDs to attempt to remove.
        // Empty means remove all eligible expired claims.
        uint64[] claim_ids;
    }
    struct RemoveExpiredClaimsReturn {
        // Ids of the claims that were either specified by the caller or discovered to be expired.
        uint64[] considered;
        // Results for each processed claim.
        CommonTypes.BatchReturn results;
    }
    struct ExtendClaimTermsParams {
        CommonTypes.ClaimTerm[] terms;
    }
    struct UniversalReceiverParams {
        /// Asset type
        uint32 type_;
        /// Payload corresponding to asset type
        bytes payload;
    }

    struct AllocationsResponse {
        // Result for each allocation request.
        CommonTypes.BatchReturn allocation_results;
        // Result for each extension request.
        CommonTypes.BatchReturn extension_results;
        // IDs of new allocations created.
        uint64[] new_allocations;
    }
}
