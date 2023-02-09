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

import "../MarketAPI.sol";
import "../types/MarketTypes.sol";

/// @author Zondax AG
contract MarketApiTest {
    function add_balance(bytes memory provider_or_client, uint256 value) public payable {
        MarketAPI.addBalance(provider_or_client, value);
    }

    function withdraw_balance(MarketTypes.WithdrawBalanceParams memory params) public returns (MarketTypes.WithdrawBalanceReturn memory) {
        return MarketAPI.withdrawBalance(params);
    }

    function get_balance(bytes memory addr) public returns (MarketTypes.GetBalanceReturn memory) {
        return MarketAPI.getBalance(addr);
    }

    function get_deal_data_commitment(uint64 dealID) public returns (MarketTypes.GetDealDataCommitmentReturn memory) {
        return MarketAPI.getDealDataCommitment(dealID);
    }

    function get_deal_client(uint64 dealID) public returns (MarketTypes.GetDealClientReturn memory) {
        return MarketAPI.getDealClient(dealID);
    }

    function get_deal_provider(uint64 dealID) public returns (MarketTypes.GetDealProviderReturn memory) {
        return MarketAPI.getDealProvider(dealID);
    }

    function get_deal_label(uint64 dealID) public returns (MarketTypes.GetDealLabelReturn memory) {
        return MarketAPI.getDealLabel(dealID);
    }

    function get_deal_term(uint64 dealID) public returns (MarketTypes.GetDealTermReturn memory) {
        return MarketAPI.getDealTerm(dealID);
    }

    function get_deal_total_price(uint64 dealID) public returns (MarketTypes.GetDealEpochPriceReturn memory) {
        return MarketAPI.getDealTotalPrice(dealID);
    }

    function get_deal_client_collateral(uint64 dealID) public returns (MarketTypes.GetDealClientCollateralReturn memory) {
        return MarketAPI.getDealClientCollateral(dealID);
    }

    function get_deal_provider_collateral(uint64 dealID) public returns (MarketTypes.GetDealProviderCollateralReturn memory) {
        return MarketAPI.getDealProviderCollateral(dealID);
    }

    function get_deal_verified(uint64 dealID) public returns (MarketTypes.GetDealVerifiedReturn memory) {
        return MarketAPI.getDealVerified(dealID);
    }

    function get_deal_activation(uint64 dealID) public returns (MarketTypes.GetDealActivationReturn memory) {
        return MarketAPI.getDealActivation(dealID);
    }

    function publish_storage_deals(MarketTypes.PublishStorageDealsParams memory params) public returns (MarketTypes.PublishStorageDealsReturn memory) {
        return MarketAPI.publishStorageDeals(params);
    }
}
