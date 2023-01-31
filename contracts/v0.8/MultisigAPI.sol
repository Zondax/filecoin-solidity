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

import "./types/MultisigTypes.sol";
import "./cbor/MultisigCbor.sol";
import "./cbor/BytesCbor.sol";
import "./utils/Misc.sol";
import "./utils/Actor.sol";

/// @title This contract is a proxy to the Multisig actor. Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
library MultisigAPI {
    using BytesCBOR for bytes;
    using MultisigCBOR for *;

    /// @notice TODO fill me up
    /// @param target The multisig address (filecoin bytes format) you want to interact with
    function propose(bytes memory target, MultisigTypes.ProposeParams memory params) internal returns (MultisigTypes.ProposeReturn memory) {
        bytes memory raw_request = params.serializeProposeParams();

        bytes memory raw_response = Actor.call(MultisigTypes.ProposeMethodNum, target, raw_request, Misc.CBOR_CODEC, msg.value, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeProposeReturn();
    }

    /// @notice TODO fill me up
    /// @param target The multisig address (filecoin bytes format) you want to interact with
    function approve(bytes memory target, MultisigTypes.TxnIDParams memory params) internal returns (MultisigTypes.ApproveReturn memory) {
        bytes memory raw_request = params.serializeTxnIDParams();

        bytes memory raw_response = Actor.call(MultisigTypes.ApproveMethodNum, target, raw_request, Misc.CBOR_CODEC, msg.value, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeApproveReturn();
    }

    /// @notice TODO fill me up
    /// @param target The multisig address (filecoin bytes format) you want to interact with
    function cancel(bytes memory target, MultisigTypes.TxnIDParams memory params) internal {
        bytes memory raw_request = params.serializeTxnIDParams();

        bytes memory raw_response = Actor.call(MultisigTypes.CancelMethodNum, target, raw_request, Misc.CBOR_CODEC, msg.value, false);

        bytes memory result = Actor.readRespData(raw_response);
        require(result.length == 0, "unexpected response received");
    }

    /// @notice TODO fill me up
    /// @param target The multisig address (filecoin bytes format) you want to interact with
    function addSigner(bytes memory target, MultisigTypes.AddSignerParams memory params) internal {
        bytes memory raw_request = params.serializeAddSignerParams();

        bytes memory raw_response = Actor.call(MultisigTypes.AddSignerMethodNum, target, raw_request, Misc.CBOR_CODEC, msg.value, false);

        bytes memory result = Actor.readRespData(raw_response);
        require(result.length == 0, "unexpected response received");
    }

    /// @notice TODO fill me up
    /// @param target The multisig address (filecoin bytes format) you want to interact with
    function removeSigner(bytes memory target, MultisigTypes.RemoveSignerParams memory params) internal {
        bytes memory raw_request = params.serializeRemoveSignerParams();

        bytes memory raw_response = Actor.call(MultisigTypes.RemoveSignerMethodNum, target, raw_request, Misc.CBOR_CODEC, msg.value, false);

        bytes memory result = Actor.readRespData(raw_response);
        require(result.length == 0, "unexpected response received");
    }

    /// @notice TODO fill me up
    /// @param target The multisig address (filecoin bytes format) you want to interact with
    function swapSigner(bytes memory target, MultisigTypes.SwapSignerParams memory params) internal {
        bytes memory raw_request = params.serializeSwapSignerParams();

        bytes memory raw_response = Actor.call(MultisigTypes.SwapSignerMethodNum, target, raw_request, Misc.CBOR_CODEC, msg.value, false);

        bytes memory result = Actor.readRespData(raw_response);
        require(result.length == 0, "unexpected response received");
    }

    /// @notice TODO fill me up
    /// @param target The multisig address (filecoin bytes format) you want to interact with
    function changeNumApprovalsThreshold(bytes memory target, MultisigTypes.ChangeNumApprovalsThresholdParams memory params) internal {
        bytes memory raw_request = params.serializeChangeNumApprovalsThresholdParams();

        bytes memory raw_response = Actor.call(
            MultisigTypes.ChangeNumApprovalsThresholdMethodNum,
            target,
            raw_request,
            Misc.CBOR_CODEC,
            msg.value,
            false
        );

        bytes memory result = Actor.readRespData(raw_response);
        require(result.length == 0, "unexpected response received");
    }

    /// @notice TODO fill me up
    /// @param target The multisig address (filecoin bytes format) you want to interact with
    function lockBalance(bytes memory target, MultisigTypes.LockBalanceParams memory params) internal {
        bytes memory raw_request = params.serializeLockBalanceParams();

        bytes memory raw_response = Actor.call(MultisigTypes.LockBalanceMethodNum, target, raw_request, Misc.CBOR_CODEC, msg.value, false);

        bytes memory result = Actor.readRespData(raw_response);
        require(result.length == 0, "unexpected response received");
    }

    /// @notice TODO fill me up
    /// @param target The multisig address (filecoin bytes format) you want to interact with
    function universalReceiverHook(bytes memory target, bytes memory params) internal {
        bytes memory raw_request = params.serializeBytes();

        bytes memory raw_response = Actor.call(
            MultisigTypes.UniversalReceiverHookMethodNum,
            target,
            raw_request,
            Misc.CBOR_CODEC,
            msg.value,
            false
        );

        bytes memory result = Actor.readRespData(raw_response);
        require(result.length == 0, "unexpected response received");
    }
}
