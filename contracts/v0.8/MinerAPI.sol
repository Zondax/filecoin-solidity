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
// THIS CODE WAS SECURITY REVIEWED BY KUDELSKI SECURITY, BUT NOT FORMALLY AUDITED

// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import "./types/MinerTypes.sol";
import "./types/CommonTypes.sol";
import "./cbor/MinerCbor.sol";
import "./cbor/FilecoinCbor.sol";
import "./cbor/BytesCbor.sol";
import "./utils/Misc.sol";
import "./utils/Actor.sol";

/// @title This library is a proxy to a built-in Miner actor. Calling one of its methods will result in a cross-actor call being performed.
/// @notice During miner initialization, a miner actor is created on the chain, and this actor gives the miner its ID f0.... The miner actor is in charge of collecting all the payments sent to the miner.
/// @dev For more info about the miner actor, please refer to https://lotus.filecoin.io/storage-providers/operate/addresses/
/// @author Zondax AG
library MinerAPI {
    using MinerCBOR for *;
    using FilecoinCBOR for *;
    using BytesCBOR for bytes;

    /// @notice Income and returned collateral are paid to this address
    /// @notice This address is also allowed to change the worker address for the miner
    /// @param target The miner actor id you want to interact with
    /// @return the owner address of a Miner
    function getOwner(CommonTypes.FilActorId target) internal view returns (MinerTypes.GetOwnerReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callNonSingletonByIDReadOnly(target, MinerTypes.GetOwnerMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeGetOwnerReturn();
    }

    /// @param target  The miner actor id you want to interact with
    /// @param addr New owner address
    /// @notice Proposes or confirms a change of owner address.
    /// @notice If invoked by the current owner, proposes a new owner address for confirmation. If the proposed address is the current owner address, revokes any existing proposal that proposed address.
    function changeOwnerAddress(CommonTypes.FilActorId target, CommonTypes.FilAddress memory addr) internal {
        bytes memory raw_request = addr.serializeAddress();

        bytes memory result = Actor.callNonSingletonByID(target, MinerTypes.ChangeOwnerAddressMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);
        if (result.length != 0) {
            revert Actor.InvalidResponseLength();
        }
    }

    /// @param target  The miner actor id you want to interact with
    /// @param addr The "controlling" addresses are the Owner, the Worker, and all Control Addresses.
    /// @return Whether the provided address is "controlling".
    function isControllingAddress(CommonTypes.FilActorId target, CommonTypes.FilAddress memory addr) internal view returns (bool) {
        bytes memory raw_request = addr.serializeAddress();

        bytes memory result = Actor.callNonSingletonByIDReadOnly(target, MinerTypes.IsControllingAddressMethodNum, Misc.CBOR_CODEC, raw_request);

        return result.deserializeBool();
    }

    /// @return the miner's sector size.
    /// @param target The miner actor id you want to interact with
    /// @dev For more information about sector sizes, please refer to https://spec.filecoin.io/systems/filecoin_mining/sector/#section-systems.filecoin_mining.sector
    function getSectorSize(CommonTypes.FilActorId target) internal view returns (uint64) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callNonSingletonByIDReadOnly(target, MinerTypes.GetSectorSizeMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeUint64();
    }

    /// @param target The miner actor id you want to interact with
    /// @notice This is calculated as actor balance - (vesting funds + pre-commit deposit + initial pledge requirement + fee debt)
    /// @notice Can go negative if the miner is in IP debt.
    /// @return the available balance of this miner.
    function getAvailableBalance(CommonTypes.FilActorId target) internal view returns (CommonTypes.BigInt memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callNonSingletonByIDReadOnly(target, MinerTypes.GetAvailableBalanceMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeBytesBigInt();
    }

    /// @param target The miner actor id you want to interact with
    /// @return the funds vesting in this miner as a list of (vesting_epoch, vesting_amount) tuples.
    function getVestingFunds(CommonTypes.FilActorId target) internal view returns (MinerTypes.GetVestingFundsReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callNonSingletonByIDReadOnly(target, MinerTypes.GetVestingFundsMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeGetVestingFundsReturn();
    }

    /// @param target The miner actor id you want to interact with
    /// @notice Proposes or confirms a change of beneficiary address.
    /// @notice A proposal must be submitted by the owner, and takes effect after approval of both the proposed beneficiary and current beneficiary, if applicable, any current beneficiary that has time and quota remaining.
    /// @notice See FIP-0029, https://github.com/filecoin-project/FIPs/blob/master/FIPS/fip-0029.md
    function changeBeneficiary(CommonTypes.FilActorId target, MinerTypes.ChangeBeneficiaryParams memory params) internal {
        bytes memory raw_request = params.serializeChangeBeneficiaryParams();

        bytes memory result = Actor.callNonSingletonByID(target, MinerTypes.ChangeBeneficiaryMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);
        if (result.length != 0) {
            revert Actor.InvalidResponseLength();
        }
    }

    /// @param target The miner actor id you want to interact with
    /// @notice This method is for use by other actors (such as those acting as beneficiaries), and to abstract the state representation for clients.
    /// @notice Retrieves the currently active and proposed beneficiary information.
    function getBeneficiary(CommonTypes.FilActorId target) internal view returns (MinerTypes.GetBeneficiaryReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callNonSingletonByIDReadOnly(target, MinerTypes.GetBeneficiaryMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeGetBeneficiaryReturn();
    }

    /// @param target The miner actor id you want to interact with
    function changeWorkerAddress(CommonTypes.FilActorId target, MinerTypes.ChangeWorkerAddressParams memory params) internal {
        bytes memory raw_request = params.serializeChangeWorkerAddressParams();

        bytes memory result = Actor.callNonSingletonByID(target, MinerTypes.ChangeWorkerAddressMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);
        if (result.length != 0) {
            revert Actor.InvalidResponseLength();
        }
    }

    /// @param target The miner actor id you want to interact with
    function changePeerId(CommonTypes.FilActorId target, CommonTypes.FilAddress memory newId) internal {
        bytes memory raw_request = newId.serializeArrayFilAddress();

        bytes memory result = Actor.callNonSingletonByID(target, MinerTypes.ChangePeerIDMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);
        if (result.length != 0) {
            revert Actor.InvalidResponseLength();
        }
    }

    /// @param target The miner actor id you want to interact with
    function changeMultiaddresses(CommonTypes.FilActorId target, MinerTypes.ChangeMultiaddrsParams memory params) internal {
        bytes memory raw_request = params.serializeChangeMultiaddrsParams();

        bytes memory result = Actor.callNonSingletonByID(target, MinerTypes.ChangeMultiaddrsMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);
        if (result.length != 0) {
            revert Actor.InvalidResponseLength();
        }
    }

    /// @param target The miner actor id you want to interact with
    function repayDebt(CommonTypes.FilActorId target) internal {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callNonSingletonByID(target, MinerTypes.RepayDebtMethodNum, Misc.NONE_CODEC, raw_request, 0, false);
        if (result.length != 0) {
            revert Actor.InvalidResponseLength();
        }
    }

    /// @param target The miner actor id you want to interact with
    function confirmChangeWorkerAddress(CommonTypes.FilActorId target) internal {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callNonSingletonByID(target, MinerTypes.ConfirmChangeWorkerAddressMethodNum, Misc.NONE_CODEC, raw_request, 0, false);
        if (result.length != 0) {
            revert Actor.InvalidResponseLength();
        }
    }

    /// @param target The miner actor id you want to interact with
    function getPeerId(CommonTypes.FilActorId target) internal view returns (CommonTypes.FilAddress memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callNonSingletonByIDReadOnly(target, MinerTypes.GetPeerIDMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeArrayFilAddress();
    }

    /// @param target The miner actor id you want to interact with
    function getMultiaddresses(CommonTypes.FilActorId target) internal view returns (MinerTypes.GetMultiaddrsReturn memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callNonSingletonByIDReadOnly(target, MinerTypes.GetMultiaddrsMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeGetMultiaddrsReturn();
    }

    /// @param target The miner actor id you want to interact with
    /// @param amount the amount you want to withdraw
    function withdrawBalance(CommonTypes.FilActorId target, CommonTypes.BigInt memory amount) internal returns (CommonTypes.BigInt memory) {
        bytes memory raw_request = amount.serializeArrayBigInt();

        bytes memory result = Actor.callNonSingletonByID(target, MinerTypes.WithdrawBalanceMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result.deserializeBytesBigInt();
    }
}
