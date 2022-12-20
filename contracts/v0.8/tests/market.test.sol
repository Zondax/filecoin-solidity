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
import {MarketAPI} from "../MarketAPI.sol";
// OR
//import {MarketAPI} from "../mocks/MarketAPI.sol";

import {CommonTypes} from "../types/CommonTypes.sol";
import {MarketTypes} from "../types/MarketTypes.sol";

contract FilecoinMarketMockTest {
    address marketApiAddress;

    constructor(address _marketApiAddress) {
        marketApiAddress = _marketApiAddress;
    }

    function market_withdraw_balance_test() public returns (MarketTypes.WithdrawBalanceReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        bytes memory addr = hex"0011";
        MarketTypes.WithdrawBalanceParams memory params = MarketTypes.WithdrawBalanceParams(addr, 1);

        MarketTypes.WithdrawBalanceReturn memory response = marketApiInstance.withdraw_balance(params);
        return response;
    }

    function market_add_balance_test() public {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        bytes memory provider_or_client = hex"0011";

        marketApiInstance.add_balance(provider_or_client);
    }

    function get_balance_test() public returns (MarketTypes.GetBalanceReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        bytes memory addr = hex"0011";

        MarketTypes.GetBalanceReturn memory response = marketApiInstance.get_balance(addr);
        return response;
    }

    function get_deal_data_commitment_test() public returns (MarketTypes.GetDealDataCommitmentReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealDataCommitmentParams memory params = MarketTypes.GetDealDataCommitmentParams(75);

        MarketTypes.GetDealDataCommitmentReturn memory response = marketApiInstance.get_deal_data_commitment(params);
        return response;
    }

    function get_deal_client_test() public returns (MarketTypes.GetDealClientReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealClientParams memory params = MarketTypes.GetDealClientParams(74);

        MarketTypes.GetDealClientReturn memory response = marketApiInstance.get_deal_client(params);
        return response;
    }

    function get_deal_provider_test() public returns (MarketTypes.GetDealProviderReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealProviderParams memory params = MarketTypes.GetDealProviderParams(80);

        MarketTypes.GetDealProviderReturn memory response = marketApiInstance.get_deal_provider(params);
        return response;
    }

    function get_deal_label_test() public returns (MarketTypes.GetDealLabelReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealLabelParams memory params = MarketTypes.GetDealLabelParams(73);

        MarketTypes.GetDealLabelReturn memory response = marketApiInstance.get_deal_label(params);
        return response;
    }

    function get_deal_term_test() public returns (MarketTypes.GetDealTermReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealTermParams memory params = MarketTypes.GetDealTermParams(72);

        MarketTypes.GetDealTermReturn memory response = marketApiInstance.get_deal_term(params);
        return response;
    }

    function get_deal_total_price_test() public returns (MarketTypes.GetDealEpochPriceReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealEpochPriceParams memory params = MarketTypes.GetDealEpochPriceParams(67);

        MarketTypes.GetDealEpochPriceReturn memory response = marketApiInstance.get_deal_total_price(params);
        return response;
    }

    function get_deal_client_collateral_test() public returns (MarketTypes.GetDealClientCollateralReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealClientCollateralParams memory params = MarketTypes.GetDealClientCollateralParams(68);

        MarketTypes.GetDealClientCollateralReturn memory response = marketApiInstance.get_deal_client_collateral(params);
        return response;
    }

    function get_deal_provider_collateral_test() public returns (MarketTypes.GetDealProviderCollateralReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealProviderCollateralParams memory params = MarketTypes.GetDealProviderCollateralParams(69);

        MarketTypes.GetDealProviderCollateralReturn memory response = marketApiInstance.get_deal_provider_collateral(params);
        return response;
    }

    function get_deal_verified_test() public returns (MarketTypes.GetDealVerifiedReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealVerifiedParams memory params = MarketTypes.GetDealVerifiedParams(70);

        MarketTypes.GetDealVerifiedReturn memory response = marketApiInstance.get_deal_verified(params);
        return response;
    }

    function get_deal_activation_test() public returns (MarketTypes.GetDealActivationReturn memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealActivationParams memory params = MarketTypes.GetDealActivationParams(71);

        MarketTypes.GetDealActivationReturn memory response = marketApiInstance.get_deal_activation(params);
        return response;
    }
}
