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

import "../MinerAPI.sol";
import "../types/MinerTypes.sol";

/// @author Zondax AG
contract MinerApiTest {
    function get_owner(bytes memory target) public returns (MinerTypes.GetOwnerReturn memory) {
        return MinerAPI.getOwner(target);
    }

    function change_owner_address(bytes memory target, bytes memory addr) public {
        MinerAPI.changeOwnerAddress(target, addr);
    }

    function is_controlling_address(bytes memory target, bytes memory addr) public returns (MinerTypes.IsControllingAddressReturn memory) {
        return MinerAPI.isControllingAddress(target, addr);
    }

    function get_sector_size(bytes memory target) public returns (MinerTypes.GetSectorSizeReturn memory) {
        return MinerAPI.getSectorSize(target);
    }

    function get_available_balance(bytes memory target) public returns (MinerTypes.GetAvailableBalanceReturn memory) {
        return MinerAPI.getAvailableBalance(target);
    }

    function get_vesting_funds(bytes memory target) public returns (MinerTypes.GetVestingFundsReturn memory) {
        return MinerAPI.getVestingFunds(target);
    }

    function change_beneficiary(bytes memory target, MinerTypes.ChangeBeneficiaryParams memory params) public {
        return MinerAPI.changeBeneficiary(target, params);
    }

    function get_beneficiary(bytes memory target) public returns (MinerTypes.GetBeneficiaryReturn memory) {
        return MinerAPI.getBeneficiary(target);
    }

    function change_worker_address(bytes memory target, MinerTypes.ChangeWorkerAddressParams memory params) public {
        MinerAPI.changeWorkerAddress(target, params);
    }

    function change_peer_id(bytes memory target, MinerTypes.ChangePeerIDParams memory params) public {
        MinerAPI.changePeerId(target, params);
    }

    function change_multiaddresses(bytes memory target, MinerTypes.ChangeMultiaddrsParams memory params) public {
        MinerAPI.changeMultiaddresses(target, params);
    }

    function repay_debt(bytes memory target) public {
        MinerAPI.repayDebt(target);
    }

    function confirm_change_worker_address(bytes memory target) public {
        MinerAPI.confirmChangeWorkerAddress(target);
    }

    function get_peer_id(bytes memory target) public returns (MinerTypes.GetPeerIDReturn memory) {
        return MinerAPI.getPeerId(target);
    }

    function get_multiaddresses(bytes memory target) public returns (MinerTypes.GetMultiaddrsReturn memory) {
        return MinerAPI.getMultiaddresses(target);
    }

    function withdraw_balance(
        bytes memory target,
        MinerTypes.WithdrawBalanceParams memory params
    ) public returns (MinerTypes.WithdrawBalanceReturn memory) {
        return MinerAPI.withdrawBalance(target, params);
    }
}
