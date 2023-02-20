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

import "../types/VerifRegTypes.sol";
import "../VerifRegAPI.sol";

/// @author Zondax AG
contract VerifRegApiTest {
    function get_claims(VerifRegTypes.GetClaimsParams memory params) public returns (VerifRegTypes.GetClaimsReturn memory) {
        return VerifRegAPI.getClaims(params);
    }

    function add_verified_client(VerifRegTypes.AddVerifierClientParams memory params) public {
        VerifRegAPI.addVerifiedClient(params);
    }

    function remove_expired_allocations(
        VerifRegTypes.RemoveExpiredAllocationsParams memory params
    ) public returns (VerifRegTypes.RemoveExpiredAllocationsReturn memory) {
        return VerifRegAPI.removeExpiredAllocations(params);
    }

    function extend_claim_terms(VerifRegTypes.ExtendClaimTermsParams memory params) public returns (CommonTypes.BatchReturn memory) {
        return VerifRegAPI.extendClaimTerms(params);
    }

    function remove_expired_claims(VerifRegTypes.RemoveExpiredClaimsParams memory params) public returns (VerifRegTypes.RemoveExpiredClaimsReturn memory) {
        return VerifRegAPI.removeExpiredClaims(params);
    }

    function universal_receiver_hook(VerifRegTypes.UniversalReceiverParams memory params) public returns (VerifRegTypes.AllocationsResponse memory) {
        return VerifRegAPI.universalReceiverHook(params);
    }
}
