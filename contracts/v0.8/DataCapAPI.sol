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

import "./types/DataCapTypes.sol";
import "./types/CommonTypes.sol";
import "./cbor/FilecoinCbor.sol";
import "./cbor/DataCapCbor.sol";
import "./cbor/BytesCbor.sol";
import "./utils/Actor.sol";

/// @title This library is a proxy to the singleton DataCap actor (address: f0X). Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
library DataCapAPI {
    using DataCapCBOR for *;
    using BytesCBOR for *;
    using FilecoinCBOR for *;

    /// @notice Return the name of DataCap token which is 'DataCap'.
    function name() internal view returns (string memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callByIDReadOnly(DataCapTypes.ActorID, DataCapTypes.NameMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeString();
    }

    /// @notice Return the symbol of DataCap token which is 'DCAP'.
    function symbol() internal view returns (string memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callByIDReadOnly(DataCapTypes.ActorID, DataCapTypes.SymbolMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeString();
    }

    /// @notice Return the total supply of DataCap token.
    function totalSupply() internal view returns (CommonTypes.BigInt memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory result = Actor.callByIDReadOnly(DataCapTypes.ActorID, DataCapTypes.TotalSupplyMethodNum, Misc.NONE_CODEC, raw_request);

        return result.deserializeBytesBigInt();
    }

    /// @notice Return the DataCap token balance for the wallet address.
    function balance(CommonTypes.FilAddress memory addr) internal view returns (CommonTypes.BigInt memory) {
        bytes memory raw_request = addr.serializeAddress();

        bytes memory result = Actor.callByIDReadOnly(DataCapTypes.ActorID, DataCapTypes.BalanceOfMethodNum, Misc.CBOR_CODEC, raw_request);

        return result.deserializeBytesBigInt();
    }

    /// @notice Return the allowance between owner and operator address.
    function allowance(DataCapTypes.GetAllowanceParams memory params) internal view returns (CommonTypes.BigInt memory) {
        bytes memory raw_request = params.serializeGetAllowanceParams();

        bytes memory result = Actor.callByIDReadOnly(DataCapTypes.ActorID, DataCapTypes.AllowanceMethodNum, Misc.CBOR_CODEC, raw_request);

        return result.deserializeBytesBigInt();
    }

    /// @notice Transfers data cap tokens to an address.
    /// @notice Data cap tokens are not generally transferable.
    /// @notice Succeeds if the to or from address is the governor, otherwise always fails.
    function transfer(DataCapTypes.TransferParams memory params) internal returns (DataCapTypes.TransferReturn memory) {
        bytes memory raw_request = params.serializeTransferParams();

        bytes memory result = Actor.callByID(DataCapTypes.ActorID, DataCapTypes.TransferMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result.deserializeTransferReturn();
    }

    /// @notice Transfers data cap tokens between addresses.
    /// @notice Data cap tokens are not generally transferable between addresses.
    /// @notice Succeeds if the to address is the governor, otherwise always fails.
    function transferFrom(DataCapTypes.TransferFromParams memory params) internal returns (DataCapTypes.TransferFromReturn memory) {
        bytes memory raw_request = params.serializeTransferFromParams();

        bytes memory result = Actor.callByID(DataCapTypes.ActorID, DataCapTypes.TransferFromMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result.deserializeTransferFromReturn();
    }

    /// @notice Increase the DataCap token allowance that an operator can control of the owner's balance by the requested amount.
    function increaseAllowance(DataCapTypes.IncreaseAllowanceParams memory params) internal returns (CommonTypes.BigInt memory) {
        bytes memory raw_request = params.serializeIncreaseAllowanceParams();

        bytes memory result = Actor.callByID(DataCapTypes.ActorID, DataCapTypes.IncreaseAllowanceMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result.deserializeBytesBigInt();
    }

    /// @notice Decrease the DataCap token allowance that an operator controls of the owner's balance by the requested amount.
    function decreaseAllowance(DataCapTypes.DecreaseAllowanceParams memory params) internal returns (CommonTypes.BigInt memory) {
        bytes memory raw_request = params.serializeDecreaseAllowanceParams();

        bytes memory result = Actor.callByID(DataCapTypes.ActorID, DataCapTypes.DecreaseAllowanceMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result.deserializeBytesBigInt();
    }

    /// @notice Revoke the DataCap token allowance from the operator and set the operator's allowance in behave of owner/caller address to 0.
    function revokeAllowance(CommonTypes.FilAddress memory operator) internal returns (CommonTypes.BigInt memory) {
        bytes memory raw_request = operator.serializeArrayFilAddress();

        bytes memory result = Actor.callByID(DataCapTypes.ActorID, DataCapTypes.RevokeAllowanceMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result.deserializeBytesBigInt();
    }

    /// @notice Burn an amount of DataCap token from the owner/caller address, decreasing total token supply.
    function burn(CommonTypes.BigInt memory amount) internal returns (CommonTypes.BigInt memory) {
        bytes memory raw_request = amount.serializeArrayBigInt();

        bytes memory result = Actor.callByID(DataCapTypes.ActorID, DataCapTypes.BurnMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result.deserializeArrayBigInt();
    }

    /// @notice Burn an amount of DataCap token from the specified address (owner address), decrease the allowance of operator/caller, and decrease total token supply.
    function burnFrom(DataCapTypes.BurnFromParams memory params) internal returns (DataCapTypes.BurnFromReturn memory) {
        bytes memory raw_request = params.serializeBurnFromParams();

        bytes memory result = Actor.callByID(DataCapTypes.ActorID, DataCapTypes.BurnFromMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result.deserializeBurnFromReturn();
    }
}
