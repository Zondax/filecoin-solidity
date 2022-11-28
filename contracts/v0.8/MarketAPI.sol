// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.15;

import "./types/MarketTypes.sol";
import "./cbor/MarketCbor.sol";

uint64 constant ADDRESS_MAX_LEN = 86;
uint64 constant CODEC = 0x71;

/// @title This contract is a proxy to the singleton Storage Market actor (address: f05). Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
contract MarketAPI {
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

    /// @notice Deposits the received value into the balance held in escrow.
    function add_balance(bytes memory provider_or_client) public {
        // FIXME: find the method num
        uint64 method_num = 0x00;

        assembly {
            let kek := mload(add(provider_or_client, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(provider_or_client))
            // actual params
            mstore(add(input, 0x80), kek)
            // actual address
            mstore(add(input, 0xa0), hex"0066")

            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0120, 0x00, 0x00)) {
                revert(0, 0)
            }
        }

        return;
    }

    /// @notice Attempt to withdraw the specified amount from the balance held in escrow.
    /// @notice If less than the specified amount is available, yields the entire available balance.
    function withdraw_balance(MarketTypes.WithdrawBalanceParams memory params) public returns (MarketTypes.WithdrawBalanceReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        MarketTypes.WithdrawBalanceReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the escrow balance and locked amount for an address.
    function get_balance(bytes memory addr) public view returns (MarketTypes.GetBalanceReturn memory) {
        // FIXME: find the method num
        uint64 method_num = 0x00;

        bytes memory raw_response = new bytes(0x20);

        assembly {
            let kek := mload(add(addr, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(addr))
            // actual params
            mstore(add(input, 0x80), kek)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x20)) {
                revert(0, 0)
            }
        }

        MarketTypes.GetBalanceReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the data commitment and size of a deal proposal.
    /// @notice This will be available after the deal is published (whether or not is is activated) and up until some undefined period after it is terminated.
    function get_deal_data_commitment(
        MarketTypes.GetDealDataCommitmentParams memory params
    ) public view returns (MarketTypes.GetDealDataCommitmentReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        MarketTypes.GetDealDataCommitmentReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the client of a deal proposal.
    function get_deal_client(MarketTypes.GetDealClientParams memory params) public view returns (MarketTypes.GetDealClientReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        MarketTypes.GetDealClientReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the provider of a deal proposal.
    function get_deal_provider(
        MarketTypes.GetDealProviderParams memory params
    ) public view returns (MarketTypes.GetDealProviderReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        MarketTypes.GetDealProviderReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the label of a deal proposal.
    function get_deal_label(MarketTypes.GetDealLabelParams memory params) public view returns (MarketTypes.GetDealLabelReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        MarketTypes.GetDealLabelReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the start epoch and duration (in epochs) of a deal proposal.
    function get_deal_term(MarketTypes.GetDealTermParams memory params) public view returns (MarketTypes.GetDealTermReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        MarketTypes.GetDealTermReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the per-epoch price of a deal proposal.
    function get_deal_total_price(
        MarketTypes.GetDealEpochPriceParams memory params
    ) public view returns (MarketTypes.GetDealEpochPriceReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        MarketTypes.GetDealEpochPriceReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the client collateral requirement for a deal proposal.
    function get_deal_client_collateral(
        MarketTypes.GetDealClientCollateralParams memory params
    ) public view returns (MarketTypes.GetDealClientCollateralReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        MarketTypes.GetDealClientCollateralReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the provider collateral requirement for a deal proposal.
    function get_deal_provider_collateral(
        MarketTypes.GetDealProviderCollateralParams memory params
    ) public view returns (MarketTypes.GetDealProviderCollateralReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        MarketTypes.GetDealProviderCollateralReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the verified flag for a deal proposal.
    /// @notice Note that the source of truth for verified allocations and claims is the verified registry actor.
    function get_deal_verified(
        MarketTypes.GetDealVerifiedParams memory params
    ) public view returns (MarketTypes.GetDealVerifiedReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        MarketTypes.GetDealVerifiedReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @notice Fetches activation state for a deal.
    /// @notice This will be available from when the proposal is published until an undefined period after the deal finishes (either normally or by termination).
    /// @return USR_NOT_FOUND if the deal doesn't exist (yet), or EX_DEAL_EXPIRED if the deal has been removed from state.
    function get_deal_activation(
        MarketTypes.GetDealActivationParams memory params
    ) public view returns (MarketTypes.GetDealActivationReturn memory) {
        bytes memory raw_request = params.serialize();

        // FIXME: find the method num
        uint64 method_num = 0x00;

        // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        assembly {
            let request := mload(add(raw_request, 0x20))
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), mload(raw_request))
            // actual params
            mstore(add(input, 0x80), request)
            // actual address
            mstore(add(input, 0xa0), hex"0066")
            // no params
            // staticcall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(staticcall(100000000, 0x0e, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        MarketTypes.GetDealActivationReturn memory response;
        response.deserialize(raw_response);

        return response;
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
