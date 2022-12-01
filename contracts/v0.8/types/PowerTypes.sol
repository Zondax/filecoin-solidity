// SPDX-License-Identifier: Apache-2.0
// DRAFT - NO AUDITED CODE
pragma solidity >=0.4.25 <=0.8.17;

import "./CommonTypes.sol";

/// @title Filecoin power actor types for Solidity.
/// @author Zondax AG
library PowerTypes {
    bytes constant ActorCode = hex"0005";
    uint constant CreateMinerMethodNum = 1173380165;
    uint constant MinerCountMethodNum = 1987646258;
    uint constant MinerConsensusCountMethodNum = 196739875;
    uint constant NetworkRawPowerMethodNum = 931722534;
    uint constant MinerRawPowerMethodNum = 3753401894;

    struct CreateMinerParams {
        bytes owner;
        bytes worker;
        CommonTypes.RegisteredPoStProof window_post_proof_type;
        bytes peer;
        bytes[] multiaddrs;
    }
    struct CreateMinerReturn {
        /// Canonical ID-based address for the actor.
        bytes id_address;
        /// Re-org safe address for created actor.
        bytes robust_address;
    }
    struct MinerCountReturn {
        int64 miner_count;
    }
    struct MinerConsensusCountReturn {
        int64 miner_consensus_count;
    }
    struct NetworkRawPowerReturn {
        int256 raw_byte_power;
    }
    struct MinerRawPowerParams {
        uint64 miner;
    }
    struct MinerRawPowerReturn {
        int256 raw_byte_power;
        bool meets_consensus_minimum;
    }
}
