// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.17;

import "./types/MinerTypes.sol";
import "./cbor/MinerCbor.sol";

/// @title This contract is a proxy to a built-in Miner actor. Calling one of its methods will result in a cross-actor call being performed
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

    /// @notice Income and returned collateral are paid to this address
    /// @notice This address is also allowed to change the worker address for the miner
    /// @return the owner address of a Miner
    function get_owner() public view returns (MinerTypes.GetOwnerReturn memory) {
        // FIXME make actual call to the miner actor
        bytes memory raw_response = hex"81480111010213123122";

        MinerTypes.GetOwnerReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @param addr New owner address
    /// @notice Proposes or confirms a change of owner address.
    /// @notice If invoked by the current owner, proposes a new owner address for confirmation. If the proposed address is the current owner address, revokes any existing proposal that proposed address.
    function change_owner_address(bytes memory addr) public {
        bytes memory raw_request = addr.serializeAddress();

        // FIXME make actual call to the miner actor
    }

    /// @param addr The "controlling" addresses are the Owner, the Worker, and all Control Addresses.
    /// @return Whether the provided address is "controlling".
    function is_controlling_address(bytes memory addr) public pure returns (MinerTypes.IsControllingAddressReturn memory) {
        bytes memory raw_request = addr.serializeAddress();

        // FIXME make actual call to the miner actor
        bytes memory raw_response = hex"81F5";

        MinerTypes.IsControllingAddressReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the miner's sector size.
    function get_sector_size() public view returns (MinerTypes.GetSectorSizeReturn memory) {
        // FIXME make actual call to the miner actor
        bytes memory raw_response = hex"811A0756B5B3";

        MinerTypes.GetSectorSizeReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @notice This is calculated as actor balance - (vesting funds + pre-commit deposit + initial pledge requirement + fee debt)
    /// @notice Can go negative if the miner is in IP debt.
    /// @return the available balance of this miner.
    function get_available_balance() public pure returns (MinerTypes.GetAvailableBalanceReturn memory) {
        // FIXME make actual call to the miner actor
        bytes memory raw_response = hex"813B00006FFF85376C48";

        MinerTypes.GetAvailableBalanceReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @return the funds vesting in this miner as a list of (vesting_epoch, vesting_amount) tuples.
    function get_vesting_funds() public pure returns (MinerTypes.GetVestingFundsReturn memory) {
        // FIXME make actual call to the miner actor
        bytes
            memory raw_response = hex"8482386E3B00000002DDDEF9F78239302C3B000000017A3B005A82392FE93B0000001CAAB746CD823902FC3B00000014E84E461C";

        MinerTypes.GetVestingFundsReturn memory response;
        response.deserialize(raw_response);

        return response;
    }

    /// @notice Proposes or confirms a change of beneficiary address.
    /// @notice A proposal must be submitted by the owner, and takes effect after approval of both the proposed beneficiary and current beneficiary, if applicable, any current beneficiary that has time and quota remaining.
    /// @notice See FIP-0029, https://github.com/filecoin-project/FIPs/blob/master/FIPS/fip-0029.md
    function change_beneficiary(MinerTypes.ChangeBeneficiaryParams memory params) public {
        bytes memory raw_request = params.serialize();

        // FIXME make actual call to the miner actor
    }

    /// @notice This method is for use by other actors (such as those acting as beneficiaries), and to abstract the state representation for clients.
    /// @notice Retrieves the currently active and proposed beneficiary information.
    function get_beneficiary() public view returns (MinerTypes.GetBeneficiaryReturn memory) {
        // FIXME make actual call to the miner actor
        bytes
            memory raw_response = hex"828246010121233322833A0001E0F23A002348771A0023488D86450111211111392F581B0000001CAAB5C3B31A0001E0F3F4F5";

        MinerTypes.GetBeneficiaryReturn memory response;
        response.deserialize(raw_response);

        return response;
    }
}
