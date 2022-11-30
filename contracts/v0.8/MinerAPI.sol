// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "./types/MinerTypes.sol";
import "./utils/Misc.sol";
import "./cbor/MinerCbor.sol";

/// @title This contract is a proxy to a built-in Miner actor. Calling one of its methods will result in a cross-actor call being performed.
/// @notice During miner initialization, a miner actor is created on the chain, and this actor gives the miner its ID f0.... The miner actor is in charge of collecting all the payments sent to the miner.
/// @dev For more info about the miner actor, please refer to https://lotus.filecoin.io/storage-providers/operate/addresses/
/// @author Zondax AG
contract MinerAPI {
    using ChangeBeneficiaryCBOR for MinerTypes.ChangeBeneficiaryParams;
    using GetOwnerCBOR for MinerTypes.GetOwnerReturn;
    using AddressCBOR for bytes;
    using IsControllingAddressCBOR for MinerTypes.IsControllingAddressReturn;
    using GetSectorSizeCBOR for MinerTypes.GetSectorSizeReturn;
    using GetAvailableBalanceCBOR for MinerTypes.GetAvailableBalanceReturn;
    using GetVestingFundsCBOR for MinerTypes.GetVestingFundsReturn;
    using GetBeneficiaryCBOR for MinerTypes.GetBeneficiaryReturn;
    using ChangeWorkerAddressCBOR for MinerTypes.ChangeWorkerAddressParams;
    using ChangePeerIDCBOR for MinerTypes.ChangePeerIDParams;
    using ChangeMultiaddrsCBOR for MinerTypes.ChangeMultiaddrsParams;
    using GetPeerIDCBOR for MinerTypes.GetPeerIDReturn;
    using GetMultiaddrsCBOR for MinerTypes.GetMultiaddrsReturn;

    /// @notice Income and returned collateral are paid to this address
    /// @notice This address is also allowed to change the worker address for the miner
    /// @return the owner address of a Miner
    function get_owner(bytes memory actor_code) public returns (MinerTypes.GetOwnerReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(3275365574, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetOwnerReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @param addr New owner address
    /// @notice Proposes or confirms a change of owner address.
    /// @notice If invoked by the current owner, proposes a new owner address for confirmation. If the proposed address is the current owner address, revokes any existing proposal that proposed address.
    function change_owner_address(bytes memory actor_code, bytes memory addr) public {
        bytes memory raw_request = addr.serializeAddress();

        bytes memory raw_response = Misc.call_actor(23, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @param addr The "controlling" addresses are the Owner, the Worker, and all Control Addresses.
    /// @return Whether the provided address is "controlling".
    function is_controlling_address(
        bytes memory actor_code,
        bytes memory addr
    ) public returns (MinerTypes.IsControllingAddressReturn memory) {
        bytes memory raw_request = addr.serializeAddress();

        bytes memory raw_response = Misc.call_actor(348244887, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.IsControllingAddressReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the miner's sector size.
    /// @dev For more information about sector sizes, please refer to https://spec.filecoin.io/systems/filecoin_mining/sector/#section-systems.filecoin_mining.sector
    function get_sector_size(bytes memory actor_code) public returns (MinerTypes.GetSectorSizeReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(3858292296, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetSectorSizeReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @notice This is calculated as actor balance - (vesting funds + pre-commit deposit + initial pledge requirement + fee debt)
    /// @notice Can go negative if the miner is in IP debt.
    /// @return the available balance of this miner.
    function get_available_balance(bytes memory actor_code) public returns (MinerTypes.GetAvailableBalanceReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(4026106874, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetAvailableBalanceReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the funds vesting in this miner as a list of (vesting_epoch, vesting_amount) tuples.
    function get_vesting_funds(bytes memory actor_code) public returns (MinerTypes.GetVestingFundsReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(1726876304, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetVestingFundsReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @notice Proposes or confirms a change of beneficiary address.
    /// @notice A proposal must be submitted by the owner, and takes effect after approval of both the proposed beneficiary and current beneficiary, if applicable, any current beneficiary that has time and quota remaining.
    /// @notice See FIP-0029, https://github.com/filecoin-project/FIPs/blob/master/FIPS/fip-0029.md
    function change_beneficiary(bytes memory actor_code, MinerTypes.ChangeBeneficiaryParams memory params) public {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(0x1e, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice This method is for use by other actors (such as those acting as beneficiaries), and to abstract the state representation for clients.
    /// @notice Retrieves the currently active and proposed beneficiary information.
    function get_beneficiary(bytes memory actor_code) public returns (MinerTypes.GetBeneficiaryReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(0x1f, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetBeneficiaryReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @notice FIXME
    function change_worker_address(bytes memory actor_code, MinerTypes.ChangeWorkerAddressParams memory params) public {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(3302309124, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice FIXME
    function change_peer_id(bytes memory actor_code, MinerTypes.ChangePeerIDParams memory params) public {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(1236548004, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice FIXME
    function change_multiaddresses(bytes memory actor_code, MinerTypes.ChangeMultiaddrsParams memory params) public {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(1063480576, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice FIXME
    function repay_debt(bytes memory actor_code) public {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(3665352697, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice FIXME
    function confirm_change_worker_address(bytes memory actor_code) public {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(2354970453, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice FIXME
    function get_peer_id(bytes memory actor_code) public returns (MinerTypes.GetPeerIDReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(2812875329, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetPeerIDReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @notice FIXME
    function get_multiaddresses(bytes memory actor_code) public returns (MinerTypes.GetMultiaddrsReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(1332909407, actor_code, raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetMultiaddrsReturn memory response;
        response.deserialize(result);

        return response;
    }
}
