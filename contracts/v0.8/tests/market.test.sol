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

import "../MarketAPI.sol";
import "../types/MarketTypes.sol";

/// @author Zondax AG
contract MarketApiTest {
    function add_balance(bytes memory provider_or_client) public payable {
        MarketAPI.addBalance(provider_or_client);
    }

    function withdraw_balance(MarketTypes.WithdrawBalanceParams memory params) public returns (MarketTypes.WithdrawBalanceReturn memory) {
        return MarketAPI.withdrawBalance(params);
    }

    function get_balance(bytes memory addr) public returns (MarketTypes.GetBalanceReturn memory) {
        return MarketAPI.getBalance(addr);
    }

    function get_deal_data_commitment(
        MarketTypes.GetDealDataCommitmentParams memory params
    ) public returns (MarketTypes.GetDealDataCommitmentReturn memory) {
        return MarketAPI.getDealDataCommitment(params);
    }

    function get_deal_client(MarketTypes.GetDealClientParams memory params) public returns (MarketTypes.GetDealClientReturn memory) {
        return MarketAPI.getDealClient(params);
    }

    function get_deal_provider(MarketTypes.GetDealProviderParams memory params) public returns (MarketTypes.GetDealProviderReturn memory) {
        return MarketAPI.getDealProvider(params);
    }

    function get_deal_label(MarketTypes.GetDealLabelParams memory params) public returns (MarketTypes.GetDealLabelReturn memory) {
        return MarketAPI.getDealLabel(params);
    }

    function get_deal_term(MarketTypes.GetDealTermParams memory params) public returns (MarketTypes.GetDealTermReturn memory) {
        return MarketAPI.getDealTerm(params);
    }

    function get_deal_total_price(
        MarketTypes.GetDealEpochPriceParams memory params
    ) public returns (MarketTypes.GetDealEpochPriceReturn memory) {
        return MarketAPI.getDealTotalPrice(params);
    }

    function get_deal_client_collateral(
        MarketTypes.GetDealClientCollateralParams memory params
    ) public returns (MarketTypes.GetDealClientCollateralReturn memory) {
        return MarketAPI.getDealClientCollateral(params);
    }

    function get_deal_provider_collateral(
        MarketTypes.GetDealProviderCollateralParams memory params
    ) public returns (MarketTypes.GetDealProviderCollateralReturn memory) {
        return MarketAPI.getDealProviderCollateral(params);
    }

    function get_deal_verified(MarketTypes.GetDealVerifiedParams memory params) public returns (MarketTypes.GetDealVerifiedReturn memory) {
        return MarketAPI.getDealVerified(params);
    }

    function get_deal_activation(
        MarketTypes.GetDealActivationParams memory params
    ) public returns (MarketTypes.GetDealActivationReturn memory) {
        return MarketAPI.getDealActivation(params);
    }

    function publish_storage_deals(
        MarketTypes.PublishStorageDealsParams memory params
    ) public returns (MarketTypes.PublishStorageDealsReturn memory) {
        return MarketAPI.publishStorageDeals(params);
    }
}
