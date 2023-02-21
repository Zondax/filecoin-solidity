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

import "./types/VerifRegTypes.sol";
import "./types/CommonTypes.sol";
import "./cbor/VerifRegCbor.sol";

import "./utils/Actor.sol";
import "./Utils.sol";

/// @title This library is a proxy to a built-in VerifReg actor. Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
library VerifRegAPI {
    using VerifRegCBOR for *;

    function getClaims(VerifRegTypes.GetClaimsParams memory params) internal returns (VerifRegTypes.GetClaimsReturn memory) {
        bytes memory raw_request = params.serializeGetClaimsParams();

        bytes memory raw_response = Actor.callByID(VerifRegTypes.ActorID, VerifRegTypes.GetClaimsMethodNum, Misc.CBOR_CODEC, raw_request, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetClaimsReturn();
    }

    function addVerifiedClient(VerifRegTypes.AddVerifierClientParams memory params) internal {
        bytes memory raw_request = params.serializeAddVerifierClientParams();

        bytes memory raw_response = Actor.callByID(VerifRegTypes.ActorID, VerifRegTypes.AddVerifierClientMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        bytes memory result = Actor.readRespData(raw_response);
        require(result.length == 0, "unexpected response received");
    }

    function removeExpiredAllocations(
        VerifRegTypes.RemoveExpiredAllocationsParams memory params
    ) internal returns (VerifRegTypes.RemoveExpiredAllocationsReturn memory) {
        bytes memory raw_request = params.serializeRemoveExpiredAllocationsParams();

        bytes memory raw_response = Actor.callByID(
            VerifRegTypes.ActorID,
            VerifRegTypes.RemoveExpiredAllocationsMethodNum,
            Misc.CBOR_CODEC,
            raw_request,
            0,
            false
        );

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeRemoveExpiredAllocationsReturn();
    }

    function extendClaimTerms(VerifRegTypes.ExtendClaimTermsParams memory params) internal returns (CommonTypes.BatchReturn memory) {
        bytes memory raw_request = params.serializeExtendClaimTermsParams();

        bytes memory raw_response = Actor.callByID(VerifRegTypes.ActorID, VerifRegTypes.ExtendClaimTermsMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeBatchReturn();
    }

    function removeExpiredClaims(VerifRegTypes.RemoveExpiredClaimsParams memory params) internal returns (VerifRegTypes.RemoveExpiredClaimsReturn memory) {
        bytes memory raw_request = params.serializeRemoveExpiredClaimsParams();

        bytes memory raw_response = Actor.callByID(VerifRegTypes.ActorID, VerifRegTypes.RemoveExpiredClaimsMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeRemoveExpiredClaimsReturn();
    }

    function universalReceiverHook(CommonTypes.UniversalReceiverParams memory params) internal returns (VerifRegTypes.AllocationsResponse memory) {
        bytes memory result = Utils.universalReceiverHook(VerifRegTypes.ActorID, params);

        return result.deserializeAllocationsResponse();
    }
}
