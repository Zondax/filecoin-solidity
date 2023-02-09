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

import "./types/InitTypes.sol";
import "./cbor/InitCbor.sol";
import "./utils/Misc.sol";
import "./utils/Actor.sol";

/// @title This contract is a proxy to the singleton Init actor (address: f01). Calling one of its methods will result in a cross-actor call being performed.
/// @author Zondax AG
library InitAPI {
    using InitCBOR for *;

    /// @notice TODO fill this a proper description
    function exec(InitTypes.ExecParams memory params) internal returns (InitTypes.ExecReturn memory) {
        bytes memory raw_request = params.serializeExecParams();

        bytes memory raw_response = Actor.call(InitTypes.ExecMethodNum, InitTypes.ActorID, raw_request, Misc.DAG_CBOR_CODEC, msg.value, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeExecReturn();
    }

    /// @notice TODO fill this a proper description
    function exec4(InitTypes.Exec4Params memory params) internal returns (InitTypes.Exec4Return memory) {
        bytes memory raw_request = params.serializeExec4Params();

        bytes memory raw_response = Actor.call(InitTypes.Exec4MethodNum, InitTypes.ActorID, raw_request, Misc.DAG_CBOR_CODEC, msg.value, false);

        bytes memory result = Actor.readRespData(raw_response);

        return result.deserializeExec4Return();
    }
}
