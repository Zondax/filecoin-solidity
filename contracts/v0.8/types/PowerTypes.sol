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

import "../cbor/BigIntCbor.sol";
import "./CommonTypes.sol";

/// @title Filecoin power actor types for Solidity.
/// @author Zondax AG
library PowerTypes {
    CommonTypes.FilActorId constant ActorID = CommonTypes.FilActorId.wrap(4);
    uint constant CreateMinerMethodNum = 1173380165;
    uint constant MinerCountMethodNum = 1987646258;
    uint constant MinerConsensusCountMethodNum = 196739875;
    uint constant NetworkRawPowerMethodNum = 931722534;
    uint constant MinerRawPowerMethodNum = 3753401894;

    /// @param ownerthe address of the owner.
    /// @param worker the address of the worker.
    /// @param window_post_proof_type the type of RegisteredPoStProof.
    /// @param peer peer ID.
    /// @param multiaddrs the multi-address which is used to control new created miner.
    struct CreateMinerParams {
        CommonTypes.FilAddress owner;
        CommonTypes.FilAddress worker;
        RegisteredPoStProof window_post_proof_type;
        CommonTypes.FilAddress peer;
        CommonTypes.FilAddress[] multiaddrs;
    }

    /// @param id_address the canonical ID-based address for the actor.
    /// @param robust_address a more expensive but re-org-safe address for the newly created actor.
    struct CreateMinerReturn {
        /// Canonical ID-based address for the actor.
        CommonTypes.FilAddress id_address;
        /// Re-org safe address for created actor.
        CommonTypes.FilAddress robust_address;
    }

    /// @param raw_byte_power the row power of the miner.
    /// @param meets_consensus_minimum if the miner power meets the minimum for consensus.
    struct MinerRawPowerReturn {
        CommonTypes.BigInt raw_byte_power;
        bool meets_consensus_minimum;
    }

    /// @notice the type of RegisteredPoStProof.
    enum RegisteredPoStProof {
        StackedDRGWinning2KiBV1,
        StackedDRGWinning8MiBV1,
        StackedDRGWinning512MiBV1,
        StackedDRGWinning32GiBV1,
        StackedDRGWinning64GiBV1,
        StackedDRGWindow2KiBV1,
        StackedDRGWindow8MiBV1,
        StackedDRGWindow512MiBV1,
        StackedDRGWindow32GiBV1,
        StackedDRGWindow64GiBV1,
        Invalid
    }
}
