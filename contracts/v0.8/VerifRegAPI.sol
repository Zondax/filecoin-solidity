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
// THIS CODE WAS SECURITY REVIEWED BY KUDELSKI SECURITY, BUT NOT FORMALLY AUDITED

// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import "./types/VerifRegTypes.sol";
import "./types/CommonTypes.sol";
import "./cbor/VerifRegCbor.sol";

import "./utils/Actor.sol";
import "./Utils.sol";

/// @title This library is a proxy to a built-in VerifReg actor. Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
library VerifRegAPI {
    using VerifRegCBOR for *;

    /// @notice get a list of claims corresponding to the requested claim ID for specific provider.
    function getClaims(VerifRegTypes.GetClaimsParams memory params) internal view returns (VerifRegTypes.GetClaimsReturn memory) {
        bytes memory raw_request = params.serializeGetClaimsParams();

        bytes memory result = Actor.callByIDReadOnly(VerifRegTypes.ActorID, VerifRegTypes.GetClaimsMethodNum, Misc.CBOR_CODEC, raw_request);

        return result.deserializeGetClaimsReturn();
    }

    /// @notice add a verified Client address to Filecoin Plus program.
    function addVerifiedClient(VerifRegTypes.AddVerifiedClientParams memory params) internal {
        bytes memory raw_request = params.serializeAddVerifiedClientParams();

        bytes memory result = Actor.callByID(VerifRegTypes.ActorID, VerifRegTypes.AddVerifiedClientMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);
        if (result.length != 0) {
            revert Actor.InvalidResponseLength();
        }
    }

    /// @notice remove the expired DataCap allocations and reclaimed those DataCap token back to Client. If the allocation amount is not specified, all expired DataCap allocation will be removed.
    function removeExpiredAllocations(
        VerifRegTypes.RemoveExpiredAllocationsParams memory params
    ) internal returns (VerifRegTypes.RemoveExpiredAllocationsReturn memory) {
        bytes memory raw_request = params.serializeRemoveExpiredAllocationsParams();

        bytes memory result = Actor.callByID(VerifRegTypes.ActorID, VerifRegTypes.RemoveExpiredAllocationsMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result.deserializeRemoveExpiredAllocationsReturn();
    }

    /// @notice extends the  maximum term of some claims up to the largest value they could have been originally allocated. This method can only be called by the claims' client.
    function extendClaimTerms(VerifRegTypes.ExtendClaimTermsParams memory params) internal returns (CommonTypes.BatchReturn memory) {
        bytes memory raw_request = params.serializeExtendClaimTermsParams();

        bytes memory result = Actor.callByID(VerifRegTypes.ActorID, VerifRegTypes.ExtendClaimTermsMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result.deserializeBatchReturn();
    }

    /// @notice remove a claim with its maximum term has elapsed.
    function removeExpiredClaims(VerifRegTypes.RemoveExpiredClaimsParams memory params) internal returns (VerifRegTypes.RemoveExpiredClaimsReturn memory) {
        bytes memory raw_request = params.serializeRemoveExpiredClaimsParams();

        bytes memory result = Actor.callByID(VerifRegTypes.ActorID, VerifRegTypes.RemoveExpiredClaimsMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result.deserializeRemoveExpiredClaimsReturn();
    }
}
