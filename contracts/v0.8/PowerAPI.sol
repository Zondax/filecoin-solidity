// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "./types/PowerTypes.sol";
import "./cbor/PowerCbor.sol";

uint64 constant ADDRESS_MAX_LEN = 86;
uint64 constant CODEC = 0x71;

/// @title FIXME
/// @author Zondax AG
contract PowerAPI {
    using CreateMinerCBOR for PowerTypes.CreateMinerParams;
    using CreateMinerCBOR for PowerTypes.CreateMinerReturn;
    using MinerCountCBOR for PowerTypes.MinerCountReturn;
    using MinerConsensusCountCBOR for PowerTypes.MinerConsensusCountReturn;

    function create_miner(PowerTypes.CreateMinerParams memory params) public view returns (PowerTypes.CreateMinerReturn memory) {
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

        PowerTypes.CreateMinerReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    function miner_count() public view returns (PowerTypes.MinerCountReturn memory) {
        // TODO: find the method num
        uint64 method_num = 0x00;

        bytes memory raw_response = new bytes(0x20);

        assembly {
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), 0x00)
            // actual address
            mstore(add(input, 0x80), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x20)) {
                revert(0, 0)
            }
        }

        PowerTypes.MinerCountReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    function miner_consensus_count() public view returns (PowerTypes.MinerConsensusCountReturn memory) {
        // TODO: find the method num
        uint64 method_num = 0x00;

        bytes memory raw_response = new bytes(0x20);

        assembly {
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), 0x00)
            // actual address
            mstore(add(input, 0x80), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x20)) {
                revert(0, 0)
            }
        }

        PowerTypes.MinerConsensusCountReturn memory response;
        response.deserialize(raw_response);

        return response;
    }
}
