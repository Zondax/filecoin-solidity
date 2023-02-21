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

import "../cbor/BigIntCbor.sol";
import "./CommonTypes.sol";

/// @title Filecoin Verified Registry actor types for Solidity.
/// @author Zondax AG
library VerifRegTypes {
    uint64 constant ActorID = 6;
    uint constant GetClaimsMethodNum = 2199871187;
    uint constant AddVerifierClientMethodNum = 3916220144;
    uint constant RemoveExpiredAllocationsMethodNum = 2421068268;
    uint constant ExtendClaimTermsMethodNum = 1752273514;
    uint constant RemoveExpiredClaimsMethodNum = 2873373899;
    uint constant UniversalReceiverMethodNum = 3726118371;

    struct GetClaimsParams {
        uint64 provider;
        uint64[] claim_ids;
    }
    struct GetClaimsReturn {
        CommonTypes.BatchReturn batch_info;
        Claim[] claims;
    }
    struct AddVerifierClientParams {
        bytes addr;
        bytes allowance;
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
        BigInt datacap_recovered;
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
        ClaimTerm[] terms;
    }

    struct AllocationsResponse {
        // Result for each allocation request.
        CommonTypes.BatchReturn allocation_results;
        // Result for each extension request.
        CommonTypes.BatchReturn extension_results;
        // IDs of new allocations created.
        uint64[] new_allocations;
    }

    struct ClaimTerm {
        uint64 provider;
        uint64 claim_id;
        int64 term_max;
    }

    struct Claim {
        // The provider storing the data (from allocation).
        uint64 provider;
        // The client which allocated the DataCap (from allocation).
        uint64 client;
        // Identifier of the data committed (from allocation).
        bytes data;
        // The (padded) size of data (from allocation).
        uint64 size;
        // The min period after term_start which the provider must commit to storing data
        int64 term_min;
        // The max period after term_start for which provider can earn QA-power for the data
        int64 term_max;
        // The epoch at which the (first range of the) piece was committed.
        int64 term_start;
        // ID of the provider's sector in which the data is committed.
        uint64 sector;
    }
}
