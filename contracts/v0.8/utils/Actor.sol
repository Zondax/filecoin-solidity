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

import "@openzeppelin/contracts/utils/Strings.sol";

import "./Misc.sol";

library Actor {
    address constant CALL_ACTOR_ADDRESS = 0xfe00000000000000000000000000000000000003;
    address constant CALL_ACTOR_ID = 0xfe00000000000000000000000000000000000005;
    string constant CALL_ERROR_MESSAGE = "actor call failed";

    uint64 constant CALL_ACTOR_PRECOMPILE_ADDR = 0x0e;
    uint64 constant MAX_RAW_RESPONSE_SIZE = 0x300;
    uint64 constant READ_ONLY_FLAG = 0x00000001; // https://github.com/filecoin-project/ref-fvm/blob/master/shared/src/sys/mod.rs#L60
    uint64 constant DEFAULT_FLAG = 0x00000000;

    function call(
        uint256 method_num,
        bytes memory actor_address,
        bytes memory raw_request,
        uint64 codec,
        uint256 amount,
        bool read_only
    ) internal returns (bytes memory) {
        // Address in bytes format only start by 0, 1, 2, 3 or 4
        require(actor_address[0] == 0x00 || actor_address[0] == 0x01 || actor_address[0] == 0x02 || actor_address[0] == 0x03 || actor_address[0] == 0x04, "actor_address address should be bytes format");

        (bool success, bytes memory data) = address(CALL_ACTOR_ADDRESS).delegatecall(
            abi.encode(uint64(method_num), amount, read_only ? READ_ONLY_FLAG : DEFAULT_FLAG, codec, raw_request, actor_address)
        );
        require(success == true, CALL_ERROR_MESSAGE);

        return data;
    }

    function callByID(
        uint64 actor_id,
        uint256 method_num,
        uint64 codec,
        bytes memory raw_request,
        uint256 amount,
        bool read_only
    ) internal returns (bytes memory) {
        (bool success, bytes memory data) = address(CALL_ACTOR_ID).delegatecall(
            abi.encode(uint64(method_num), amount, read_only ? READ_ONLY_FLAG : DEFAULT_FLAG, codec, raw_request, actor_id)
        );
        require(success == true, CALL_ERROR_MESSAGE);

        return data;
    }

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

    function getErrorCodeMsg(int256 exit_code) internal pure returns (string memory) {
        return
            exit_code >= 0
                ? string(abi.encodePacked("actor error code ", Strings.toString(uint256(exit_code))))
                : string(abi.encodePacked("actor error code -", Strings.toString(Misc.abs(exit_code))));
    }
}
