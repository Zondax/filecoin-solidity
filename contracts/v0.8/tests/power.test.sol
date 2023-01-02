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
//
pragma solidity >=0.4.25 <=0.8.17;

import "../types/PowerTypes.sol";
import "../PowerAPI.sol";

/// @author Zondax AG
library PowerApiTest {
    function create_miner(PowerTypes.CreateMinerParams memory params) internal returns (PowerTypes.CreateMinerReturn memory) {
        return PowerAPI.create_miner(params);
    }

    function miner_count() internal returns (PowerTypes.MinerCountReturn memory) {
        return PowerAPI.miner_count();
    }

    function miner_consensus_count() internal returns (PowerTypes.MinerConsensusCountReturn memory) {
        return PowerAPI.miner_consensus_count();
    }

    function network_raw_power() internal returns (PowerTypes.NetworkRawPowerReturn memory) {
        return PowerAPI.network_raw_power();
    }

    function miner_raw_power(PowerTypes.MinerRawPowerParams memory params) internal returns (PowerTypes.MinerRawPowerReturn memory) {
        return PowerAPI.miner_raw_power(params);
    }
}
