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

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        VerifRegTypes.GetClaimsReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    function add_verified_client(VerifRegTypes.AddVerifierClientParams memory params) public view {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        return;
    }
}
