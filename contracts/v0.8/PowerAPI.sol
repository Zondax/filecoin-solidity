// SPDX-License-Identifier: Apache-2.0
// DRAFT - NO AUDITED CODE
pragma solidity >=0.4.25 <=0.8.17;

import "./types/PowerTypes.sol";
import "./cbor/PowerCbor.sol";

import "./utils/Actor.sol";

/// @title FIXME
/// @author Zondax AG
contract PowerAPI {
    using CreateMinerCBOR for PowerTypes.CreateMinerParams;
    using CreateMinerCBOR for PowerTypes.CreateMinerReturn;
    using MinerCountCBOR for PowerTypes.MinerCountReturn;
    using MinerConsensusCountCBOR for PowerTypes.MinerConsensusCountReturn;
    using NetworkRawPowerCBOR for PowerTypes.NetworkRawPowerReturn;
    using MinerRawPowerCBOR for PowerTypes.MinerRawPowerParams;
    using MinerRawPowerCBOR for PowerTypes.MinerRawPowerReturn;

    function create_miner(PowerTypes.CreateMinerParams memory params) public returns (PowerTypes.CreateMinerReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(PowerTypes.CreateMinerMethodNum, PowerTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        PowerTypes.CreateMinerReturn memory response;
        response.deserialize(result);

        return response;
    }

    function miner_count() public returns (PowerTypes.MinerCountReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Actor.call(PowerTypes.MinerCountMethodNum, PowerTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        PowerTypes.MinerCountReturn memory response;
        response.deserialize(result);

        return response;
    }

    function miner_consensus_count() public returns (PowerTypes.MinerConsensusCountReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Actor.call(PowerTypes.MinerConsensusCountMethodNum, PowerTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        PowerTypes.MinerConsensusCountReturn memory response;
        response.deserialize(result);

        return response;
    }

    function network_raw_power() public returns (PowerTypes.NetworkRawPowerReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Actor.call(PowerTypes.NetworkRawPowerMethodNum, PowerTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        PowerTypes.NetworkRawPowerReturn memory response;
        response.deserialize(result);

        return response;
    }

    function miner_raw_power(PowerTypes.MinerRawPowerParams memory params) public returns (PowerTypes.MinerRawPowerReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(PowerTypes.MinerRawPowerMethodNum, PowerTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        PowerTypes.MinerRawPowerReturn memory response;
        response.deserialize(result);

        return response;
    }
}
