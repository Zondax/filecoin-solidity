// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "./types/PowerTypes.sol";
import "./cbor/PowerCbor.sol";

/// @title FIXME
/// @author Zondax AG
contract PowerAPI {
    using CreateMinerCBOR for PowerTypes.CreateMinerParams;
    using CreateMinerCBOR for PowerTypes.CreateMinerReturn;
    using MinerCountCBOR for PowerTypes.MinerCountReturn;
    using MinerConsensusCountCBOR for PowerTypes.MinerConsensusCountReturn;

    function create_miner(PowerTypes.CreateMinerParams memory params) public view returns (PowerTypes.CreateMinerReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME make actual call to the miner actor
        bytes memory raw_response = hex"82460101010101014B4342341254354353453451";

        PowerTypes.CreateMinerReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    function miner_count() public view returns (PowerTypes.MinerCountReturn memory) {
        // FIXME make actual call to the miner actor
        bytes memory raw_response = hex"813A0756B5B2";

        PowerTypes.MinerCountReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    function miner_consensus_count() public view returns (PowerTypes.MinerConsensusCountReturn memory) {
        // FIXME make actual call to the miner actor
        bytes memory raw_response = hex"813A0756B5B2";

        PowerTypes.MinerConsensusCountReturn memory response;
        response.deserialize(raw_response);

        return response;
    }
}
