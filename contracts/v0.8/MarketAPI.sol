// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.15;

import "./types/MarketTypes.sol";
import "./cbor/MarketCbor.sol";

/// @title This contract is a proxy to the singleton Storage Market actor (address: f05). Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
contract MarketAPI {
    using WithdrawBalanceCBOR for MarketTypes.WithdrawBalanceParams;
    using WithdrawBalanceCBOR for MarketTypes.WithdrawBalanceReturn;
    using GetBalanceCBOR for MarketTypes.GetBalanceReturn;

    /// @notice Deposits the received value into the balance held in escrow.
    function add_balance(bytes memory provider_or_client) public {}

    /// @notice Attempt to withdraw the specified amount from the balance held in escrow.
    /// @notice If less than the specified amount is available, yields the entire available balance.
    function withdraw_balance(MarketTypes.WithdrawBalanceParams memory params) public returns (MarketTypes.WithdrawBalanceReturn memory) {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = hex"811A00989AD8";

        MarketTypes.WithdrawBalanceReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the escrow balance and locked amount for an address.
    function get_balance(bytes memory addr) public view returns (MarketTypes.GetBalanceReturn memory) {
        // FIXME replace this with the real actor call
        bytes memory raw_response = hex"821A0012D6871A0074CBB1";

        MarketTypes.GetBalanceReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the data commitment and size of a deal proposal.
    /// @notice This will be available after the deal is published (whether or not is is activated) and up until some undefined period after it is terminated.
    function get_deal_data_commitment(
        MarketTypes.GetDealDataCommitmentParams memory params
    ) public view returns (MarketTypes.GetDealDataCommitmentReturn memory) {
        return MarketTypes.GetDealDataCommitmentReturn(bytes("0x111111"), 1);
    }

    /// @return the client of a deal proposal.
    function get_deal_client(MarketTypes.GetDealClientParams memory params) public view returns (MarketTypes.GetDealClientReturn memory) {
        return MarketTypes.GetDealClientReturn(hex"111111");
    }

    /// @return the provider of a deal proposal.
    function get_deal_provider(
        MarketTypes.GetDealProviderParams memory params
    ) public view returns (MarketTypes.GetDealProviderReturn memory) {
        return MarketTypes.GetDealProviderReturn(hex"111111");
    }

    /// @return the label of a deal proposal.
    function get_deal_label(MarketTypes.GetDealLabelParams memory params) public view returns (MarketTypes.GetDealLabelReturn memory) {
        return MarketTypes.GetDealLabelReturn("test");
    }

    /// @return the start epoch and duration (in epochs) of a deal proposal.
    function get_deal_term(MarketTypes.GetDealTermParams memory params) public view returns (MarketTypes.GetDealTermReturn memory) {
        return MarketTypes.GetDealTermReturn(1, 1);
    }

    /// @return the per-epoch price of a deal proposal.
    function get_deal_total_price(
        MarketTypes.GetDealEpochPriceParams memory params
    ) public view returns (MarketTypes.GetDealEpochPriceReturn memory) {
        return MarketTypes.GetDealEpochPriceReturn(1);
    }

    /// @return the client collateral requirement for a deal proposal.
    function get_deal_client_collateral(
        MarketTypes.GetDealClientCollateralParams memory params
    ) public view returns (MarketTypes.GetDealClientCollateralReturn memory) {
        return MarketTypes.GetDealClientCollateralReturn(1);
    }

    /// @return the provider collateral requirement for a deal proposal.
    function get_deal_provider_collateral(
        MarketTypes.GetDealProviderCollateralParams memory params
    ) public view returns (MarketTypes.GetDealProviderCollateralReturn memory) {
        return MarketTypes.GetDealProviderCollateralReturn(1);
    }

    /// @return the verified flag for a deal proposal.
    /// @notice Note that the source of truth for verified allocations and claims is the verified registry actor.
    function get_deal_verified(
        MarketTypes.GetDealVerifiedParams memory params
    ) public view returns (MarketTypes.GetDealVerifiedReturn memory) {
        return MarketTypes.GetDealVerifiedReturn(false);
    }

    /// @notice Fetches activation state for a deal.
    /// @notice This will be available from when the proposal is published until an undefined period after the deal finishes (either normally or by termination).
    /// @return USR_NOT_FOUND if the deal doesn't exist (yet), or EX_DEAL_EXPIRED if the deal has been removed from state.
    function get_deal_activation(
        MarketTypes.GetDealActivationParams memory params
    ) public view returns (MarketTypes.GetDealActivationReturn memory) {
        return MarketTypes.GetDealActivationReturn(1, 0);
    }

    /// @notice Publish a new set of storage deals (not yet included in a sector).
    function publish_storage_deals(bytes memory raw_auth_params, address callee) public {
        // calls standard filecoin receiver on message authentication api method number
        (bool success, ) = callee.call(
            abi.encodeWithSignature("handle_filecoin_method(uint64,uint64,bytes)", 0, 2643134072, raw_auth_params)
        );
        require(success, "client contract failed to authorize deal publish");
    }
}
