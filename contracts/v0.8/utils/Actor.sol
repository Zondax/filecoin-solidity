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
// DRAFT!! THIS CODE HAS NOT BEEN AUDITED - USE ONLY FOR PROTOTYPING

// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import "../external/Strings.sol";

import "./Misc.sol";

/// @title Call actors utilities library, meant to interact with Filecoin builtin actors
/// @author Zondax AG
library Actor {
    address constant CALL_ACTOR_ADDRESS = 0xfe00000000000000000000000000000000000003;
    address constant CALL_ACTOR_ID = 0xfe00000000000000000000000000000000000005;
    string constant CALL_ERROR_MESSAGE = "actor call failed";
    string constant UNEXPECTED_RESPONSE_MESSAGE = "unexpected response received";

    uint64 constant READ_ONLY_FLAG = 0x00000001; // https://github.com/filecoin-project/ref-fvm/blob/master/shared/src/sys/mod.rs#L60
    uint64 constant DEFAULT_FLAG = 0x00000000;

    /// @notice allows to interact with an specific actor by its address (bytes format)
    /// @param actor_address actor address (bytes format) to interact with
    /// @param method_num id of the method from the actor to call
    /// @param codec how the request data passed as argument is encoded
    /// @param raw_request encoded arguments to be passed in the call
    /// @param amount tokens to be transfered to the called actor
    /// @param static_call indicates if the call will be allaed to change the actor state or not (just read the state)
    /// @return payload (in bytes) with the actual response data (without codec or response code)
    function callByAddress(
        bytes memory actor_address,
        uint256 method_num,
        uint64 codec,
        bytes memory raw_request,
        uint256 amount,
        bool static_call
    ) internal returns (bytes memory) {
        require(actor_address.length > 1, "invalid actor_address");
        require(address(this).balance >= amount, "not enough balance");

        // We have to delegate-call the call-actor precompile because the call-actor precompile will
        // call the target actor on our behalf. This will _not_ delegate to the target `actor_address`.
        //
        // Specifically:
        //
        // - `static_call == false`: `CALLER (you) --(DELEGATECALL)-> CALL_ACTOR_PRECOMPILE --(CALL)-> actor_address
        // - `static_call == true`:  `CALLER (you) --(DELEGATECALL)-> CALL_ACTOR_PRECOMPILE --(STATICCALL)-> actor_address
        (bool success, bytes memory data) = address(CALL_ACTOR_ADDRESS).delegatecall(
            abi.encode(uint64(method_num), amount, static_call ? READ_ONLY_FLAG : DEFAULT_FLAG, codec, raw_request, actor_address)
        );
        require(success == true, CALL_ERROR_MESSAGE);

        return readRespData(data);
    }

    /// @notice allows to interact with an specific actor by its id (uint64)
    /// @param actor_id actor id (uint64) to interact with
    /// @param method_num id of the method from the actor to call
    /// @param codec how the request data passed as argument is encoded
    /// @param raw_request encoded arguments to be passed in the call
    /// @param amount tokens to be transferred to the called actor
    /// @param static_call indicates if the call will be allowed to change the actor state or not (just read the state)
    /// @return payload (in bytes) with the actual response data (without codec or response code)
    function callByID(
        uint64 actor_id,
        uint256 method_num,
        uint64 codec,
        bytes memory raw_request,
        uint256 amount,
        bool static_call
    ) internal returns (bytes memory) {
        require(address(this).balance >= amount, "not enough balance");

        (bool success, bytes memory data) = address(CALL_ACTOR_ID).delegatecall(
            abi.encode(uint64(method_num), amount, static_call ? READ_ONLY_FLAG : DEFAULT_FLAG, codec, raw_request, actor_id)
        );
        require(success == true, CALL_ERROR_MESSAGE);

        return readRespData(data);
    }

    /// @notice allows to interact with an non-singleton actors by its id (uint64)
    /// @param actor_id actor id (uint64) to interact with
    /// @param method_num id of the method from the actor to call
    /// @param codec how the request data passed as argument is encoded
    /// @param raw_request encoded arguments to be passed in the call
    /// @param amount tokens to be transfered to the called actor
    /// @param static_call indicates if the call will be allowed to change the actor state or not (just read the state)
    /// @dev it requires the id to be bigger than 99, as singleton actors are smaller than that
    function callNonSingletonByID(
        uint64 actor_id,
        uint256 method_num,
        uint64 codec,
        bytes memory raw_request,
        uint256 amount,
        bool static_call
    ) internal returns (bytes memory) {
        require(actor_id >= 100, "actor id is not valid");
        return callByID(actor_id, method_num, codec, raw_request, amount, static_call);
    }

    /// @notice parse the response an actor returned
    /// @notice it will validate the return code (success) and the codec (valid one)
    /// @param raw_response raw data (bytes) the actor returned
    /// @return the actual raw data (payload, in bytes) to be parsed according to the actor and method called
    function readRespData(bytes memory raw_response) internal pure returns (bytes memory) {
        (int256 exit, uint64 return_codec, bytes memory return_value) = abi.decode(raw_response, (int256, uint64, bytes));

        if (return_codec == Misc.NONE_CODEC) {
            require(return_value.length == 0, "response length should be 0");
        } else if (return_codec == Misc.CBOR_CODEC || return_codec == Misc.DAG_CBOR_CODEC) {
            require(return_value.length > 0, "response length should greater than 0");
        } else {
            require(false, "invalid response codec");
        }

        require(exit == 0, getErrorCodeMsg(exit));

        return return_value;
    }

    /// @notice converts exit code to string message
    /// @param exit_code the actual exit code
    /// @return message based on the exit code
    function getErrorCodeMsg(int256 exit_code) internal pure returns (string memory) {
        return
            exit_code >= 0
                ? string(abi.encodePacked("actor error code ", Strings.toString(uint256(exit_code))))
                : string(abi.encodePacked("actor error code -", Strings.toString(Misc.abs(exit_code))));
    }
}
