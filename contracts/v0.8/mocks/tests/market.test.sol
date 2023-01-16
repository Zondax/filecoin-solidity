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
pragma solidity >=0.4.25 <=0.8.17;

import {MarketMockAPI} from "../MarketMockAPI.sol";
import {CommonTypes} from "../../types/CommonTypes.sol";
import {MarketTypes} from "../../types/MarketTypes.sol";

contract MarketTestApi {
    address marketApiAddress;

    constructor(address _marketApiAddress) {
        marketApiAddress = _marketApiAddress;
    }

    function test_add_balance() public payable {
        bytes memory provider_or_client = hex"0066";

        MarketMockAPI marketApiInstance = MarketMockAPI(marketApiAddress);
        marketApiInstance.addBalance(provider_or_client);
    }

    function test_get_balance() public view {
        bytes memory addr = hex"0066";

        MarketMockAPI marketApiInstance = MarketMockAPI(marketApiAddress);
        marketApiInstance.getBalance(addr);
    }
}
