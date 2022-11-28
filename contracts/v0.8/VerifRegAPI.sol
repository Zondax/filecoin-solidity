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

    function get_claims(VerifRegTypes.GetClaimsParams memory params) public view returns (VerifRegTypes.GetClaimsReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME make actual call to the actor
        bytes memory raw_response = hex"828200838201018203038202028288010245010101010101020304058801024501010101010102030405";

        VerifRegTypes.GetClaimsReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    function add_verified_client(VerifRegTypes.AddVerifierClientParams memory params) public view {
        bytes memory raw_request = params.serialize();

        // FIXME make actual call to the actor
    }
}
