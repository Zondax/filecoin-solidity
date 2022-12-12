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
pragma solidity >=0.4.25 <=0.8.15;

// TODO: Use the API or mocks to interact with
import {MinerAPI} from "../MinerAPI.sol";
// OR
//import {MinerAPI} from "../mocks/MinerAPI.sol";

import {CommonTypes} from "../types/CommonTypes.sol";
import {MinerTypes} from "../types/MinerTypes.sol";

contract FilecoinMinerMockTest {
    address minerApiAddress;

    constructor(address _minerApiAddress) {
        minerApiAddress = _minerApiAddress;
    }

    // This function is only available on mocks
    /*
    function mock_set_owner_test() public {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        bytes memory target = hex"0011";
        bytes memory addr = "t01113";
        minerApiInstance.mock_set_owner(addr);
    }
    */

    function get_owner_test() public returns (MinerTypes.GetOwnerReturn memory) {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        bytes memory target = hex"0011";
        MinerTypes.GetOwnerReturn memory response = minerApiInstance.get_owner(target);
        return response;
    }

    function is_controlling_address_test() public returns (MinerTypes.IsControllingAddressReturn memory) {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        bytes memory target = hex"0011";
        bytes memory addr = hex"0021";
        MinerTypes.IsControllingAddressReturn memory response = minerApiInstance.is_controlling_address(target, addr);
        return response;
    }

    function get_sector_size_test() public returns (MinerTypes.GetSectorSizeReturn memory) {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        bytes memory target = hex"0011";
        MinerTypes.GetSectorSizeReturn memory response = minerApiInstance.get_sector_size(target);
        return response;
    }

    function get_available_balance_test() public returns (MinerTypes.GetAvailableBalanceReturn memory) {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        bytes memory target = hex"0011";
        MinerTypes.GetAvailableBalanceReturn memory response = minerApiInstance.get_available_balance(target);
        return response;
    }

    function get_vesting_funds_test() public returns (MinerTypes.GetVestingFundsReturn memory) {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        bytes memory target = hex"0011";
        MinerTypes.GetVestingFundsReturn memory response = minerApiInstance.get_vesting_funds(target);

        return response;
    }

    function change_beneficiary_test() public {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        bytes memory target = hex"0011";
        MinerTypes.ChangeBeneficiaryParams memory params;
        minerApiInstance.change_beneficiary(target, params);
    }

    function get_beneficiary_test() public returns (MinerTypes.GetBeneficiaryReturn memory) {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        bytes memory target = hex"0011";
        MinerTypes.GetBeneficiaryReturn memory response = minerApiInstance.get_beneficiary(target);
        return response;
    }

    function change_owner_address_test() public {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        bytes memory target = hex"0011";
        bytes memory addr = hex"0021";
        minerApiInstance.change_owner_address(target, addr);
    }
}
