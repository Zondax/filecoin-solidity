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

import "./types/MarketTypes.sol";
import "./cbor/MarketCbor.sol";
import "./cbor/BytesCbor.sol";
import "./types/CommonTypes.sol";
import "./utils/Misc.sol";
import "./utils/Actor.sol";

/// @title This library is a proxy to the singleton Storage Market actor (address: f05). Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
library MarketAPI {
    using BytesCBOR for bytes;
    using MarketCBOR for *;

    /// @notice Deposits the received value into the balance held in escrow.
    function addBalance(bytes memory provider_or_client, uint256 value) internal {
        require(address(this).balance >= value, "not enough balance");

        bytes memory raw_request = provider_or_client.serializeAddress();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.AddBalanceMethodNum, Misc.CBOR_CODEC, raw_request, value, false);

        bytes memory result = Actor.readRespData(raw_response);
        require(result.length == 0, "unexpected response received");
    }

    /// @notice Attempt to withdraw the specified amount from the balance held in escrow.
    /// @notice If less than the specified amount is available, yields the entire available balance.
    function withdrawBalance(MarketTypes.WithdrawBalanceParams memory params) internal returns (MarketTypes.WithdrawBalanceReturn memory) {
        bytes memory raw_request = params.serializeWithdrawBalanceParams();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.WithdrawBalanceMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeWithdrawBalanceReturn();
    }

    /// @notice Return the escrow balance and locked amount for an address.
    /// @return the escrow balance and locked amount for an address.
    function getBalance(bytes memory addr) internal returns (MarketTypes.GetBalanceReturn memory) {
        bytes memory raw_request = addr.serializeAddress();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.GetBalanceMethodNum, Misc.CBOR_CODEC, raw_request, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetBalanceReturn();
    }

    /// @notice This will be available after the deal is published (whether or not is is activated) and up until some undefined period after it is terminated.
    /// @return the data commitment and size of a deal proposal.
    function getDealDataCommitment(uint64 dealID) internal returns (MarketTypes.GetDealDataCommitmentReturn memory) {
        bytes memory raw_request = dealID.serializeDealID();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.GetDealDataCommitmentMethodNum, Misc.CBOR_CODEC, raw_request, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetDealDataCommitmentReturn();
    }

    /// @notice get the client of the deal proposal.
    /// @return the client of a deal proposal.
    function getDealClient(uint64 dealID) internal returns (MarketTypes.GetDealClientReturn memory) {
        bytes memory raw_request = dealID.serializeDealID();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.GetDealClientMethodNum, Misc.CBOR_CODEC, raw_request, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetDealClientReturn();
    }

    /// @notice get the provider of a deal proposal.
    /// @return the provider of a deal proposal.
    function getDealProvider(uint64 dealID) internal returns (MarketTypes.GetDealProviderReturn memory) {
        bytes memory raw_request = dealID.serializeDealID();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.GetDealProviderMethodNum, Misc.CBOR_CODEC, raw_request, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetDealProviderReturn();
    }

    /// @notice Get the label of a deal proposal.
    /// @return the label of a deal proposal.
    function getDealLabel(uint64 dealID) internal returns (MarketTypes.GetDealLabelReturn memory) {
        bytes memory raw_request = dealID.serializeDealID();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.GetDealLabelMethodNum, Misc.CBOR_CODEC, raw_request, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetDealLabelReturn();
    }

    /// @notice Get the start epoch and duration(in epochs) of a deal proposal.
    /// @return the start epoch and duration (in epochs) of a deal proposal.
    function getDealTerm(uint64 dealID) internal returns (MarketTypes.GetDealTermReturn memory) {
        bytes memory raw_request = dealID.serializeDealID();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.GetDealTermMethodNum, Misc.CBOR_CODEC, raw_request, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetDealTermReturn();
    }

    /// @notice get the total price that will be paid from the client to the provider for this deal.
    /// @return the per-epoch price of a deal proposal.
    function getDealTotalPrice(uint64 dealID) internal returns (MarketTypes.GetDealEpochPriceReturn memory) {
        bytes memory raw_request = dealID.serializeDealID();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.GetDealEpochPriceMethodNum, Misc.CBOR_CODEC, raw_request, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetDealEpochPriceReturn();
    }

    /// @notice get the client collateral requirement for a deal proposal.
    /// @return the client collateral requirement for a deal proposal.
    function getDealClientCollateral(uint64 dealID) internal returns (MarketTypes.GetDealClientCollateralReturn memory) {
        bytes memory raw_request = dealID.serializeDealID();

        bytes memory raw_response = Actor.callByAddress(
            MarketTypes.ActorID,
            MarketTypes.GetDealClientCollateralMethodNum,
            Misc.CBOR_CODEC,
            raw_request,
            0,
            true
        );

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetDealClientCollateralReturn();
    }

    /// @notice get the provide collateral requirement for a deal proposal.
    /// @return the provider collateral requirement for a deal proposal.
    function getDealProviderCollateral(uint64 dealID) internal returns (MarketTypes.GetDealProviderCollateralReturn memory) {
        bytes memory raw_request = dealID.serializeDealID();

        bytes memory raw_response = Actor.callByAddress(
            MarketTypes.ActorID,
            MarketTypes.GetDealProviderCollateralMethodNum,
            Misc.CBOR_CODEC,
            raw_request,
            0,
            true
        );

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetDealProviderCollateralReturn();
    }

    /// @notice get the verified flag for a deal proposal.
    /// @notice Note that the source of truth for verified allocations and claims is the verified registry actor.
    /// @return the verified flag for a deal proposal.
    function getDealVerified(uint64 dealID) internal returns (MarketTypes.GetDealVerifiedReturn memory) {
        bytes memory raw_request = dealID.serializeDealID();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.GetDealVerifiedMethodNum, Misc.CBOR_CODEC, raw_request, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetDealVerifiedReturn();
    }

    /// @notice Fetches activation state for a deal.
    /// @notice This will be available from when the proposal is published until an undefined period after the deal finishes (either normally or by termination).
    /// @return USR_NOT_FOUND if the deal doesn't exist (yet), or EX_DEAL_EXPIRED if the deal has been removed from state.
    function getDealActivation(uint64 dealID) internal returns (MarketTypes.GetDealActivationReturn memory) {
        bytes memory raw_request = dealID.serializeDealID();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.GetDealActivationMethodNum, Misc.CBOR_CODEC, raw_request, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeGetDealActivationReturn();
    }

    /// @notice Publish a new set of storage deals (not yet included in a sector).
    function publishStorageDeals(MarketTypes.PublishStorageDealsParams memory params) internal returns (MarketTypes.PublishStorageDealsReturn memory) {
        bytes memory raw_request = params.serializePublishStorageDealsParams();

        bytes memory raw_response = Actor.callByAddress(MarketTypes.ActorID, MarketTypes.PublishStorageDealsMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializePublishStorageDealsReturn();
    }
}
