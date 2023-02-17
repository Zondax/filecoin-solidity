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

import "./types/PowerTypes.sol";
import "./cbor/PowerCbor.sol";
import "./cbor/BytesCbor.sol";
import "./cbor/IntCbor.sol";

import "./utils/Actor.sol";

/// @title FIXME
/// @author Zondax AG
library PowerAPI {
    using Uint64CBOR for uint64;
    using BytesCBOR for bytes;
    using PowerCBOR for *;

    function createMiner(PowerTypes.CreateMinerParams memory params, uint256 value) internal returns (PowerTypes.CreateMinerReturn memory) {
        require(address(this).balance >= value, "not enough balance");

        bytes memory raw_request = params.serializeCreateMinerParams();

        bytes memory raw_response = Actor.call(PowerTypes.CreateMinerMethodNum, PowerTypes.ActorID, raw_request, Misc.CBOR_CODEC, value, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeCreateMinerReturn();
    }

    function minerCount() internal returns (uint64) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Actor.call(PowerTypes.MinerCountMethodNum, PowerTypes.ActorID, raw_request, Misc.NONE_CODEC, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeUint64();
    }

    function minerConsensusCount() internal returns (int64) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Actor.call(PowerTypes.MinerConsensusCountMethodNum, PowerTypes.ActorID, raw_request, Misc.NONE_CODEC, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeInt64();
    }

    function networkRawPower() internal returns (BigInt memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Actor.call(PowerTypes.NetworkRawPowerMethodNum, PowerTypes.ActorID, raw_request, Misc.NONE_CODEC, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeBytesBigInt();
    }

    function minerRawPower(uint64 minerID) internal returns (PowerTypes.MinerRawPowerReturn memory) {
        bytes memory raw_request = minerID.serialize();

        bytes memory raw_response = Actor.call(PowerTypes.MinerRawPowerMethodNum, PowerTypes.ActorID, raw_request, Misc.CBOR_CODEC, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeMinerRawPowerReturn();
    }
}
