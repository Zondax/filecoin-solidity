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

import "./types/DataCapTypes.sol";
import "./cbor/DataCapCbor.sol";
import "./cbor/BytesCbor.sol";
import "./utils/Actor.sol";

/// @title This library is a proxy to the singleton DataCap actor (address: f0X). Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
library DataCapAPI {
    using DataCapCBOR for *;
    using BytesCBOR for *;

    function name() internal returns (string memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.NameMethodNum, DataCapTypes.ActorID, raw_request, Misc.NONE_CODEC, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeString();
    }

    function symbol() internal returns (string memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.SymbolMethodNum, DataCapTypes.ActorID, raw_request, Misc.NONE_CODEC, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeString();
    }

    function totalSupply() internal returns (BigInt memory) {
        bytes memory raw_request = new bytes(0);

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.TotalSupplyMethodNum, DataCapTypes.ActorID, raw_request, Misc.NONE_CODEC, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeBytesBigInt();
    }

    function balance(bytes memory addr) internal returns (BigInt memory) {
        bytes memory raw_request = addr.serializeAddress();

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.BalanceOfMethodNum, DataCapTypes.ActorID, raw_request, Misc.CBOR_CODEC, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeBytesBigInt();
    }

    function allowance(DataCapTypes.GetAllowanceParams memory params) internal returns (BigInt memory) {
        bytes memory raw_request = params.serializeGetAllowanceParams();

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.AllowanceMethodNum, DataCapTypes.ActorID, raw_request, Misc.CBOR_CODEC, 0, true);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeBytesBigInt();
    }

    function transfer(DataCapTypes.TransferParams memory params) internal returns (DataCapTypes.TransferReturn memory) {
        bytes memory raw_request = params.serializeTransferParams();

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.TransferMethodNum, DataCapTypes.ActorID, raw_request, Misc.CBOR_CODEC, 0, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeTransferReturn();
    }

    function transferFrom(DataCapTypes.TransferFromParams memory params) internal returns (DataCapTypes.TransferFromReturn memory) {
        bytes memory raw_request = params.serializeTransferFromParams();

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.TransferFromMethodNum, DataCapTypes.ActorID, raw_request, Misc.CBOR_CODEC, 0, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeTransferFromReturn();
    }

    function increaseAllowance(DataCapTypes.IncreaseAllowanceParams memory params) internal returns (BigInt memory) {
        bytes memory raw_request = params.serializeIncreaseAllowanceParams();

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.IncreaseAllowanceMethodNum, DataCapTypes.ActorID, raw_request, Misc.CBOR_CODEC, 0, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeBytesBigInt();
    }

    function decreaseAllowance(DataCapTypes.DecreaseAllowanceParams memory params) internal returns (BigInt memory) {
        bytes memory raw_request = params.serializeDecreaseAllowanceParams();

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.DecreaseAllowanceMethodNum, DataCapTypes.ActorID, raw_request, Misc.CBOR_CODEC, 0, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeBytesBigInt();
    }

    function revokeAllowance(DataCapTypes.RevokeAllowanceParams memory params) internal returns (BigInt memory) {
        bytes memory raw_request = params.serializeRevokeAllowanceParams();

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.RevokeAllowanceMethodNum, DataCapTypes.ActorID, raw_request, Misc.CBOR_CODEC, 0, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeBytesBigInt();
    }

    function burn(DataCapTypes.BurnParams memory params) internal returns (DataCapTypes.BurnReturn memory) {
        bytes memory raw_request = params.serializeBurnParams();

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.BurnMethodNum, DataCapTypes.ActorID, raw_request, Misc.CBOR_CODEC, 0, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeBurnReturn();
    }

    function burnFrom(DataCapTypes.BurnFromParams memory params) internal returns (DataCapTypes.BurnFromReturn memory) {
        bytes memory raw_request = params.serializeBurnFromParams();

        bytes memory raw_response = Actor.callByAddress(DataCapTypes.BurnFromMethodNum, DataCapTypes.ActorID, raw_request, Misc.CBOR_CODEC, 0, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeBurnFromReturn();
    }
}
