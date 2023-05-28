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

import "./types/AccountTypes.sol";
import "./cbor/AccountCbor.sol";
import "./cbor/BytesCbor.sol";
import "./utils/Misc.sol";
import "./utils/Actor.sol";

/// @title This library is a proxy to the Account actor. Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
library AccountAPI {
    using AccountCBOR for *;
    using BytesCBOR for bytes;

    /// @notice Authenticates whether the provided signature is valid for the provided message.
    /// @dev Should be called with the raw bytes of a signature, NOT a serialized Signature object that includes a SignatureType.
    /// @dev Errors if the authentication is invalid.
    /// @param target The account actor id you want to interact with
    /// @param params message to be authenticated
    function authenticateMessage(CommonTypes.FilActorId target, AccountTypes.AuthenticateMessageParams memory params) internal view {
        bytes memory raw_request = params.serializeAuthenticateMessageParams();

        bytes memory data = Actor.callNonSingletonByIDReadOnly(target, AccountTypes.AuthenticateMessageMethodNum, Misc.CBOR_CODEC, raw_request);
        require(data.deserializeBool());
    }
}
