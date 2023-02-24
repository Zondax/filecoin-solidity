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

import "../types/PowerTypes.sol";
import "../types/CommonTypes.sol";
import "../PowerAPI.sol";

/// @notice This file is meant to serve as a deployable contract of the power actor API, as the library by itself is not.
/// @notice It imports the library and create a callable method for each method in the library
/// @author Zondax AG
contract PowerApiTest {
    function create_miner(PowerTypes.CreateMinerParams memory params, uint256 value) public payable returns (PowerTypes.CreateMinerReturn memory) {
        return PowerAPI.createMiner(params, value);
    }

    function miner_count() public returns (uint64) {
        return PowerAPI.minerCount();
    }

    function miner_consensus_count() public returns (int64) {
        return PowerAPI.minerConsensusCount();
    }

    function network_raw_power() public returns (CommonTypes.BigInt memory) {
        return PowerAPI.networkRawPower();
    }

    function miner_raw_power(uint64 minerID) public returns (PowerTypes.MinerRawPowerReturn memory) {
        return PowerAPI.minerRawPower(minerID);
    }
}
