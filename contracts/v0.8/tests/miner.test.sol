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

import "../MinerAPI.sol";
import "../types/MinerTypes.sol";

/// @notice This file is meant to serve as a deployable contract of the miner actor API, as the library by itself is not.
/// @notice It imports the library and create a callable method for each method in the library
/// @author Zondax AG
contract MinerApiTest {
    function get_owner(CommonTypes.FilActorId target) public returns (MinerTypes.GetOwnerReturn memory) {
        return MinerAPI.getOwner(target);
    }

    function change_owner_address(CommonTypes.FilActorId target, CommonTypes.FilAddress memory addr) public {
        MinerAPI.changeOwnerAddress(target, addr);
    }

    function is_controlling_address(CommonTypes.FilActorId target, CommonTypes.FilAddress memory addr) public returns (bool) {
        return MinerAPI.isControllingAddress(target, addr);
    }

    function get_sector_size(CommonTypes.FilActorId target) public returns (uint64) {
        return MinerAPI.getSectorSize(target);
    }

    function get_available_balance(CommonTypes.FilActorId target) public returns (CommonTypes.BigInt memory) {
        return MinerAPI.getAvailableBalance(target);
    }

    function get_vesting_funds(CommonTypes.FilActorId target) public returns (MinerTypes.GetVestingFundsReturn memory) {
        return MinerAPI.getVestingFunds(target);
    }

    function change_beneficiary(CommonTypes.FilActorId target, MinerTypes.ChangeBeneficiaryParams memory params) public {
        return MinerAPI.changeBeneficiary(target, params);
    }

    function get_beneficiary(CommonTypes.FilActorId target) public returns (MinerTypes.GetBeneficiaryReturn memory) {
        return MinerAPI.getBeneficiary(target);
    }

    function change_worker_address(CommonTypes.FilActorId target, MinerTypes.ChangeWorkerAddressParams memory params) public {
        MinerAPI.changeWorkerAddress(target, params);
    }

    function change_peer_id(CommonTypes.FilActorId target, CommonTypes.FilAddress memory newId) public {
        MinerAPI.changePeerId(target, newId);
    }

    function change_multiaddresses(CommonTypes.FilActorId target, MinerTypes.ChangeMultiaddrsParams memory params) public {
        MinerAPI.changeMultiaddresses(target, params);
    }

    function repay_debt(CommonTypes.FilActorId target) public {
        MinerAPI.repayDebt(target);
    }

    function confirm_change_worker_address(CommonTypes.FilActorId target) public {
        MinerAPI.confirmChangeWorkerAddress(target);
    }

    function get_peer_id(CommonTypes.FilActorId target) public returns (CommonTypes.FilAddress memory) {
        return MinerAPI.getPeerId(target);
    }

    function get_multiaddresses(CommonTypes.FilActorId target) public returns (MinerTypes.GetMultiaddrsReturn memory) {
        return MinerAPI.getMultiaddresses(target);
    }

    function withdraw_balance(CommonTypes.FilActorId target, CommonTypes.BigInt memory amount) public returns (CommonTypes.BigInt memory) {
        return MinerAPI.withdrawBalance(target, amount);
    }
}
