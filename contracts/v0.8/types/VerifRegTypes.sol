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
    CommonTypes.FilActorId constant ActorID = CommonTypes.FilActorId.wrap(6);
    uint constant GetClaimsMethodNum = 2199871187;
    uint constant AddVerifiedClientMethodNum = 3916220144;
    uint constant RemoveExpiredAllocationsMethodNum = 2421068268;
    uint constant ExtendClaimTermsMethodNum = 1752273514;
    uint constant RemoveExpiredClaimsMethodNum = 2873373899;

    /// @param provider the provider address.
    /// @param  claim_ids a list of Claim IDs for specific provider.
    struct GetClaimsParams {
        CommonTypes.FilActorId provider;
        CommonTypes.FilActorId[] claim_ids;
    }

    /// @param  claims list of Claims returned.
    /// @param  batch_info total success and failures of the batch process
    struct GetClaimsReturn {
        CommonTypes.BatchReturn batch_info;
        Claim[] claims;
    }

    /// @param addr the verified client address
    /// @param allowance approved DataCap for this verified client
    struct AddVerifiedClientParams {
        CommonTypes.FilAddress addr;
        CommonTypes.BigInt allowance;
    }

    /// @param client the client address for which to expired allocations.
    /// @param allocation_ids list of allocation IDs to attempt to remove. If empty, will remove all eligible expired allocations.
    struct RemoveExpiredAllocationsParams {
        CommonTypes.FilActorId client;
        CommonTypes.FilActorId[] allocation_ids;
    }

    /// @param considered Allocation IDs are either specified by the caller or discovered to be expired.
    /// @param results results for each processed allocation.
    /// @param datacap_recovered the amount of DataCap token reclaimed for the client.
    struct RemoveExpiredAllocationsReturn {
        CommonTypes.FilActorId[] considered;
        CommonTypes.BatchReturn results;
        CommonTypes.BigInt datacap_recovered;
    }

    /// @param provider the provider address (need not be the caller)
    /// @param claim_ids a list of Claim IDs with expired term. If no claims are specified, all eligible claims will be removed.
    struct RemoveExpiredClaimsParams {
        CommonTypes.FilActorId provider;
        CommonTypes.FilActorId[] claim_ids;
    }

    /// @param considered a list of IDs of the claims that were either specified by the caller or discovered to be expired.
    /// @param results results for each processed claim.
    struct RemoveExpiredClaimsReturn {
        CommonTypes.FilActorId[] considered;
        CommonTypes.BatchReturn results;
    }

    /// @param terms list of claim terms to extend
    struct ExtendClaimTermsParams {
        ClaimTerm[] terms;
    }

    /// @param provider the provider address which storing the data.
    /// @param claim_id claim ID.
    /// @param term_max the max chain epoch to extend.
    struct ClaimTerm {
        CommonTypes.FilActorId provider;
        CommonTypes.FilActorId claim_id;
        CommonTypes.ChainEpoch term_max;
    }

    /// @param provider the provider storing the data.
    /// @param client the client which allocated the DataCap.
    /// @param data identifier for the data committed.
    /// @param size the size of the data.
    /// @param term_min the min period after term started which the provider must commit to storing data.
    /// @param term_max the max period after term started for which the provider can earn QA-power for the data.
    /// @param term_start the epoch at which the piece was committed.
    /// @param sector ID of the provider's sector in which the data is committed.
    struct Claim {
        CommonTypes.FilActorId provider;
        CommonTypes.FilActorId client;
        bytes data;
        uint64 size;
        CommonTypes.ChainEpoch term_min;
        CommonTypes.ChainEpoch term_max;
        CommonTypes.ChainEpoch term_start;
        CommonTypes.FilActorId sector;
    }
}
