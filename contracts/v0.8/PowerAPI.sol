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

import "./types/CommonTypes.sol";
import "./types/PowerTypes.sol";
import "./cbor/PowerCbor.sol";
import "./cbor/BytesCbor.sol";
import "./cbor/IntCbor.sol";

import "./utils/Actor.sol";

/// @title This library is a proxy to a built-in Power actor. Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
library PowerAPI {
    using Uint64CBOR for uint64;
    using BytesCBOR for bytes;
    using PowerCBOR for *;

    /// @notice create a new miner for the owner address and worker address.
    /// @param params data required to create the miner
    /// @param value the amount of token the new miner will receive
    function createMiner(PowerTypes.CreateMinerParams memory params, uint256 value) internal returns (PowerTypes.CreateMinerReturn memory) {
        bytes memory raw_request = params.serializeCreateMinerParams();

        bytes memory result = Actor.callByID(PowerTypes.ActorID, PowerTypes.CreateMinerMethodNum, Misc.CBOR_CODEC, raw_request, value, false);

        return result.deserializeCreateMinerReturn();
    }

    /// @notice get the total number of miners created, regardless of whether or not they have any pledged storage.
    function minerCount() internal view returns (uint64) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callByIDReadOnly(PowerTypes.ActorID, PowerTypes.MinerCountMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeUint64();
    }

    /// @notice get the total number of miners that have more than the consensus minimum amount of storage active.
    function minerConsensusCount() internal view returns (int64) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callByIDReadOnly(PowerTypes.ActorID, PowerTypes.MinerConsensusCountMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeInt64();
    }

    /// @notice get the total raw power of the network.
    function networkRawPower() internal view returns (CommonTypes.BigInt memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callByIDReadOnly(PowerTypes.ActorID, PowerTypes.NetworkRawPowerMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeBytesBigInt();
    }

    /// @notice get the raw power claimed by the specified miner, and whether the miner has more than the consensus minimum amount of storage active.
    /// @param minerID the miner id you want to get information from
    function minerRawPower(uint64 minerID) internal view returns (PowerTypes.MinerRawPowerReturn memory) {
        bytes memory raw_request = minerID.serialize();

        bytes memory result = Actor.callByIDReadOnly(PowerTypes.ActorID, PowerTypes.MinerRawPowerMethodNum, Misc.CBOR_CODEC, raw_request);

        return result.deserializeMinerRawPowerReturn();
    }
}
