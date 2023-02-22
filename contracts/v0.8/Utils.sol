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
pragma solidity ^0.8.0;

import "./cbor/AccountCbor.sol";
import "./cbor/BytesCbor.sol";
import "./cbor/FilecoinCbor.sol";

import "./types/AccountTypes.sol";
import "./types/CommonTypes.sol";
import "./types/DataCapTypes.sol";

import "./utils/Actor.sol";

/// @title This library compiles a bunch of helper functions.
/// @author Zondax AG
library Utils {
    using AccountCBOR for *;
    using FilecoinCBOR for *;
    using BytesCBOR for bytes;

    event ReceivedDataCap(string received);

    /// @notice utility function meant to handle calls from other builtin actors. Arguments are passed as cbor serialized data (in filecoin native format)
    /// @param method the filecoin method id that is being called
    /// @param params raw data (in bytes) passed as arguments to the method call
    function handleFilecoinMethod(uint64 method, uint64, bytes calldata params) internal returns (AccountTypes.AuthenticateMessageParams memory) {
        // dispatch methods
        if (method == AccountTypes.AuthenticateMessageMethodNum) {
            // deserialize params here
            return params.deserializeAuthenticateMessageParams();
        } else if (method == DataCapTypes.ReceiverHookMethodNum) {
            emit ReceivedDataCap("DataCap Received!");

            return AccountTypes.AuthenticateMessageParams(new bytes(0), new bytes(0));
        } else {
            revert("the filecoin method that was called is not handled");
        }
    }

    /// @param actorId The actor id you want to interact with
    function universalReceiverHook(uint64 actorId, CommonTypes.UniversalReceiverParams memory params) internal returns (bytes memory) {
        bytes memory raw_request = params.serializeUniversalReceiverParams();

        bytes memory result = Actor.callByID(actorId, CommonTypes.UniversalReceiverHookMethodNum, Misc.CBOR_CODEC, raw_request, 0, false);

        return result;
    }
}
