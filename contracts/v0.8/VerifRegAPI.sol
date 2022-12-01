// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "./types/VerifRegTypes.sol";
import "./cbor/VerifRegCbor.sol";

/// @title FIXME
/// @author Zondax AG
contract VerifRegAPI {
    using GetClaimsCBOR for VerifRegTypes.GetClaimsParams;
    using GetClaimsCBOR for VerifRegTypes.GetClaimsReturn;
    using AddVerifierClientCBOR for VerifRegTypes.AddVerifierClientParams;
    using RemoveExpiredAllocationsCBOR for VerifRegTypes.RemoveExpiredAllocationsParams;
    using RemoveExpiredAllocationsCBOR for VerifRegTypes.RemoveExpiredAllocationsReturn;
    using ExtendClaimTermsCBOR for VerifRegTypes.ExtendClaimTermsParams;
    using ExtendClaimTermsCBOR for CommonTypes.BatchReturn;
    using RemoveExpiredClaimsCBOR for VerifRegTypes.RemoveExpiredClaimsParams;
    using RemoveExpiredClaimsCBOR for VerifRegTypes.RemoveExpiredClaimsReturn;
    using UniversalReceiverHookCBOR for VerifRegTypes.UniversalReceiverParams;
    using UniversalReceiverHookCBOR for VerifRegTypes.AllocationsResponse;

    function get_claims(VerifRegTypes.GetClaimsParams memory params) public returns (VerifRegTypes.GetClaimsReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(2199871187, hex"0005", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        VerifRegTypes.GetClaimsReturn memory response;
        response.deserialize(result);

        return response;
    }

    function add_verified_client(VerifRegTypes.AddVerifierClientParams memory params) public {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(3916220144, hex"0005", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    function remove_expired_allocations(
        VerifRegTypes.RemoveExpiredAllocationsParams memory params
    ) public returns (VerifRegTypes.RemoveExpiredAllocationsReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(2873373899, hex"0005", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        VerifRegTypes.RemoveExpiredAllocationsReturn memory response;
        response.deserialize(result);

        return response;
    }

    function extend_claim_terms(VerifRegTypes.ExtendClaimTermsParams memory params) public returns (CommonTypes.BatchReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(1752273514, hex"0005", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        CommonTypes.BatchReturn memory response;
        response.deserialize(result);

        return response;
    }

    function remove_expired_claims(
        VerifRegTypes.RemoveExpiredClaimsParams memory params
    ) public returns (VerifRegTypes.RemoveExpiredClaimsReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(2873373899, hex"0005", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        VerifRegTypes.RemoveExpiredClaimsReturn memory response;
        response.deserialize(result);

        return response;
    }

    function universal_receiver_hook(
        VerifRegTypes.UniversalReceiverParams memory params
    ) public returns (VerifRegTypes.AllocationsResponse memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(3726118371, hex"0005", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        VerifRegTypes.AllocationsResponse memory response;
        response.deserialize(result);

        return response;
    }
}
