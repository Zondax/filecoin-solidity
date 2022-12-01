// SPDX-License-Identifier: Apache-2.0
// DRAFT - NO AUDITED CODE
pragma solidity >=0.4.25 <=0.8.15;

import "./types/MarketTypes.sol";
import "./cbor/MarketCbor.sol";
import "./types/CommonTypes.sol";
import "./utils/Misc.sol";
import "./utils/Actor.sol";

/// @title This contract is a proxy to the singleton Storage Market actor (address: f05). Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
contract MarketAPI {
    using AddressCBOR for bytes;
    using WithdrawBalanceCBOR for MarketTypes.WithdrawBalanceParams;
    using WithdrawBalanceCBOR for MarketTypes.WithdrawBalanceReturn;
    using GetBalanceCBOR for MarketTypes.GetBalanceReturn;
    using GetDealDataCommitmentCBOR for MarketTypes.GetDealDataCommitmentParams;
    using GetDealDataCommitmentCBOR for MarketTypes.GetDealDataCommitmentReturn;
    using GetDealClientCBOR for MarketTypes.GetDealClientParams;
    using GetDealClientCBOR for MarketTypes.GetDealClientReturn;
    using GetDealProviderCBOR for MarketTypes.GetDealProviderParams;
    using GetDealProviderCBOR for MarketTypes.GetDealProviderReturn;
    using GetDealLabelCBOR for MarketTypes.GetDealLabelParams;
    using GetDealLabelCBOR for MarketTypes.GetDealLabelReturn;
    using GetDealTermCBOR for MarketTypes.GetDealTermParams;
    using GetDealTermCBOR for MarketTypes.GetDealTermReturn;
    using GetDealEpochPriceCBOR for MarketTypes.GetDealEpochPriceParams;
    using GetDealEpochPriceCBOR for MarketTypes.GetDealEpochPriceReturn;
    using GetDealClientCollateralCBOR for MarketTypes.GetDealClientCollateralParams;
    using GetDealClientCollateralCBOR for MarketTypes.GetDealClientCollateralReturn;
    using GetDealProviderCollateralCBOR for MarketTypes.GetDealProviderCollateralParams;
    using GetDealProviderCollateralCBOR for MarketTypes.GetDealProviderCollateralReturn;
    using GetDealVerifiedCBOR for MarketTypes.GetDealVerifiedParams;
    using GetDealVerifiedCBOR for MarketTypes.GetDealVerifiedReturn;
    using GetDealActivationCBOR for MarketTypes.GetDealActivationParams;
    using GetDealActivationCBOR for MarketTypes.GetDealActivationReturn;
    using PublishStorageDealsCBOR for MarketTypes.PublishStorageDealsParams;
    using PublishStorageDealsCBOR for MarketTypes.PublishStorageDealsReturn;

    /// @notice Deposits the received value into the balance held in escrow.
    function add_balance(bytes memory provider_or_client) public {
        bytes memory raw_request = provider_or_client.serializeAddress();

        bytes memory raw_response = Actor.call(MarketTypes.AddBalanceMethodNum, MarketTypes.ActorCode, raw_request);

        Actor.readRespData(raw_response);

        return;
    }

    /// @notice Attempt to withdraw the specified amount from the balance held in escrow.
    /// @notice If less than the specified amount is available, yields the entire available balance.
    function withdraw_balance(MarketTypes.WithdrawBalanceParams memory params) public returns (MarketTypes.WithdrawBalanceReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.WithdrawBalanceMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.WithdrawBalanceReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the escrow balance and locked amount for an address.
    function get_balance(bytes memory addr) public returns (MarketTypes.GetBalanceReturn memory) {
        bytes memory raw_request = addr.serializeAddress();

        bytes memory raw_response = Actor.call(MarketTypes.GetBalanceMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.GetBalanceReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the data commitment and size of a deal proposal.
    /// @notice This will be available after the deal is published (whether or not is is activated) and up until some undefined period after it is terminated.
    function get_deal_data_commitment(
        MarketTypes.GetDealDataCommitmentParams memory params
    ) public returns (MarketTypes.GetDealDataCommitmentReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.GetDealDataCommitmentMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.GetDealDataCommitmentReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the client of a deal proposal.
    function get_deal_client(MarketTypes.GetDealClientParams memory params) public returns (MarketTypes.GetDealClientReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.GetDealClientMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.GetDealClientReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the provider of a deal proposal.
    function get_deal_provider(MarketTypes.GetDealProviderParams memory params) public returns (MarketTypes.GetDealProviderReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.GetDealProviderMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.GetDealProviderReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the label of a deal proposal.
    function get_deal_label(MarketTypes.GetDealLabelParams memory params) public returns (MarketTypes.GetDealLabelReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.GetDealLabelMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.GetDealLabelReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the start epoch and duration (in epochs) of a deal proposal.
    function get_deal_term(MarketTypes.GetDealTermParams memory params) public returns (MarketTypes.GetDealTermReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.GetDealTermMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.GetDealTermReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the per-epoch price of a deal proposal.
    function get_deal_total_price(
        MarketTypes.GetDealEpochPriceParams memory params
    ) public returns (MarketTypes.GetDealEpochPriceReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.GetDealEpochPriceMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.GetDealEpochPriceReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the client collateral requirement for a deal proposal.
    function get_deal_client_collateral(
        MarketTypes.GetDealClientCollateralParams memory params
    ) public returns (MarketTypes.GetDealClientCollateralReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.GetDealClientCollateralMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.GetDealClientCollateralReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the provider collateral requirement for a deal proposal.
    function get_deal_provider_collateral(
        MarketTypes.GetDealProviderCollateralParams memory params
    ) public returns (MarketTypes.GetDealProviderCollateralReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.GetDealProviderCollateralMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.GetDealProviderCollateralReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the verified flag for a deal proposal.
    /// @notice Note that the source of truth for verified allocations and claims is the verified registry actor.
    function get_deal_verified(MarketTypes.GetDealVerifiedParams memory params) public returns (MarketTypes.GetDealVerifiedReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.GetDealVerifiedMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.GetDealVerifiedReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @notice Fetches activation state for a deal.
    /// @notice This will be available from when the proposal is published until an undefined period after the deal finishes (either normally or by termination).
    /// @return USR_NOT_FOUND if the deal doesn't exist (yet), or EX_DEAL_EXPIRED if the deal has been removed from state.
    function get_deal_activation(
        MarketTypes.GetDealActivationParams memory params
    ) public returns (MarketTypes.GetDealActivationReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.GetDealActivationMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.GetDealActivationReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @notice Publish a new set of storage deals (not yet included in a sector).
    function publish_storage_deals(
        MarketTypes.PublishStorageDealsParams memory params
    ) public returns (MarketTypes.PublishStorageDealsReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Actor.call(MarketTypes.PublishStorageDealsMethodNum, MarketTypes.ActorCode, raw_request);

        bytes memory result = Actor.readRespData(raw_response);

        MarketTypes.PublishStorageDealsReturn memory response;
        response.deserialize(result);

        return response;
    }
}
