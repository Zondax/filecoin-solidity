// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "./types/MinerTypes.sol";
import "./utils/Misc.sol";
import "./cbor/MinerCbor.sol";

uint64 constant ADDRESS_MAX_LEN = 86;
uint64 constant CODEC = 0x71;

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

    /*uint32 actor_id;

    constructor(uint32 _actor_id) {
        actor_id = _actor_id
    }*/

    /// @notice Income and returned collateral are paid to this address
    /// @notice This address is also allowed to change the worker address for the miner
    /// @return the owner address of a Miner
    function get_owner() public returns (MinerTypes.GetOwnerReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(3275365574, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetOwnerReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @param addr New owner address
    /// @notice Proposes or confirms a change of owner address.
    /// @notice If invoked by the current owner, proposes a new owner address for confirmation. If the proposed address is the current owner address, revokes any existing proposal that proposed address.
    function change_owner_address(bytes memory addr) public {
        bytes memory raw_request = addr.serializeAddress();

        bytes memory raw_response = Misc.call_actor(23, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @param addr The "controlling" addresses are the Owner, the Worker, and all Control Addresses.
    /// @return Whether the provided address is "controlling".
    function is_controlling_address(bytes memory addr) public returns (MinerTypes.IsControllingAddressReturn memory) {
        bytes memory raw_request = addr.serializeAddress();

        bytes memory raw_response = Misc.call_actor(348244887, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.IsControllingAddressReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the miner's sector size.
    /// @dev For more information about sector sizes, please refer to https://spec.filecoin.io/systems/filecoin_mining/sector/#section-systems.filecoin_mining.sector
    function get_sector_size() public returns (MinerTypes.GetSectorSizeReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(3858292296, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetSectorSizeReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @notice This is calculated as actor balance - (vesting funds + pre-commit deposit + initial pledge requirement + fee debt)
    /// @notice Can go negative if the miner is in IP debt.
    /// @return the available balance of this miner.
    function get_available_balance() public returns (MinerTypes.GetAvailableBalanceReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(4026106874, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetAvailableBalanceReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @return the funds vesting in this miner as a list of (vesting_epoch, vesting_amount) tuples.
    function get_vesting_funds() public returns (MinerTypes.GetVestingFundsReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(1726876304, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetVestingFundsReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @notice Proposes or confirms a change of beneficiary address.
    /// @notice A proposal must be submitted by the owner, and takes effect after approval of both the proposed beneficiary and current beneficiary, if applicable, any current beneficiary that has time and quota remaining.
    /// @notice See FIP-0029, https://github.com/filecoin-project/FIPs/blob/master/FIPS/fip-0029.md
    function change_beneficiary(MinerTypes.ChangeBeneficiaryParams memory params) public {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(0x1e, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice This method is for use by other actors (such as those acting as beneficiaries), and to abstract the state representation for clients.
    /// @notice Retrieves the currently active and proposed beneficiary information.
    function get_beneficiary() public returns (MinerTypes.GetBeneficiaryReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(0x1f, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetBeneficiaryReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @notice FIXME
    function change_worker_address(MinerTypes.ChangeWorkerAddressParams memory params) public {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(1010589339, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice FIXME
    function change_peer_id(MinerTypes.ChangePeerIDParams memory params) public {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(1236548004, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice FIXME
    function change_multiaddresses(MinerTypes.ChangeMultiaddrsParams memory params) public {
        bytes memory raw_request = params.serialize();

        bytes memory raw_response = Misc.call_actor(1063480576, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice FIXME
    function repay_debt() public {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(3665352697, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice FIXME
    function confirm_change_worker_address() public {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(2354970453, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        return;
    }

    /// @notice FIXME
    function get_peer_id() public returns (MinerTypes.GetPeerIDReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(2812875329, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetPeerIDReturn memory response;
        response.deserialize(result);

        return response;
    }

    /// @notice FIXME
    function get_multiaddresses() public returns (MinerTypes.GetMultiaddrsReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Misc.call_actor(1332909407, hex"0066", raw_request);

        bytes memory result = Misc.getDataFromActorResponse(raw_response);

        MinerTypes.GetMultiaddrsReturn memory response;
        response.deserialize(result);

        return response;
    }
}
