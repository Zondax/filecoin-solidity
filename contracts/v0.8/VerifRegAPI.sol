// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "./types/VerifRegTypes.sol";
import "./cbor/VerifRegCbor.sol";

uint64 constant ADDRESS_MAX_LEN = 86;
uint64 constant CODEC = 0x71;

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

    function remove_expired_allocations(
        VerifRegTypes.RemoveExpiredAllocationsParams memory params
    ) public view returns (VerifRegTypes.RemoveExpiredAllocationsReturn memory) {
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

        VerifRegTypes.RemoveExpiredAllocationsReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    function extend_claim_terms(VerifRegTypes.ExtendClaimTermsParams memory params) public view returns (CommonTypes.BatchReturn memory) {
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

        CommonTypes.BatchReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    function remove_expired_claims(
        VerifRegTypes.RemoveExpiredClaimsParams memory params
    ) public view returns (VerifRegTypes.RemoveExpiredClaimsReturn memory) {
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

        VerifRegTypes.RemoveExpiredClaimsReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    function universal_receiver_hook(
        VerifRegTypes.UniversalReceiverParams memory params
    ) public view returns (VerifRegTypes.AllocationsResponse memory) {
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

        VerifRegTypes.AllocationsResponse memory response;
        response.deserialize(raw_response);

        return response;
    }
}
