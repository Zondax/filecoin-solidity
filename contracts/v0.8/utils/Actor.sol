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
pragma solidity >=0.4.25 <=0.8.15;

import "@openzeppelin/contracts/utils/Strings.sol";

import "./Misc.sol";

library Actor {
    uint64 constant GAS_LIMIT = 100000000;
    uint64 constant CALL_ACTOR_PRECOMPILE_ADDR = 0x0e;
    uint64 constant MAX_RAW_RESPONSE_SIZE = 0x300;
    uint64 constant READ_ONLY_FLAG = 0x00000001; // https://github.com/filecoin-project/ref-fvm/blob/master/shared/src/sys/mod.rs#L60
    uint64 constant DEFAULT_FLAG = 0x00000000;

    function call(uint method_num, bytes memory actor_code, bytes memory raw_request, uint64 codec) internal returns (bytes memory) {
        bytes memory raw_response = new bytes(MAX_RAW_RESPONSE_SIZE);

        uint raw_request_len;
        uint actor_code_len;
        uint amount = msg.value;

        assembly {
            raw_request_len := mload(raw_request)
            actor_code_len := mload(actor_code)

            let input := mload(0x40)
            mstore(input, method_num)
            // value to send
            mstore(add(input, 0x20), amount)
            // readonly flag is mandatory for now
            mstore(add(input, 0x40), DEFAULT_FLAG)
            // cbor codec is mandatory for now
            mstore(add(input, 0x60), codec)
            // params size
            mstore(add(input, 0x80), raw_request_len)
            // address size
            mstore(add(input, 0xa0), actor_code_len)
            // actual params (copy by slice of 32 bytes)
            let start_index := 0xc0
            let offset := 0
            for {
                offset := 0x00
            } lt(offset, raw_request_len) {
                offset := add(offset, 0x20)
            } {
                mstore(add(input, add(start_index, offset)), mload(add(raw_request, add(0x20, offset))))
            }
            if mod(raw_request_len, 0x20) {
                offset := add(sub(offset, 0x20), mod(raw_request_len, 0x20))
            }

            // actual address (copy by slice of 32 bytes)
            start_index := add(start_index, offset)
            offset := 0
            for {
                offset := 0x00
            } lt(offset, actor_code_len) {
                offset := add(offset, 0x20)
            } {
                mstore(add(input, add(start_index, offset)), mload(add(actor_code, add(0x20, offset))))
            }
            if mod(actor_code_len, 0x20) {
                offset := add(sub(offset, 0x20), mod(actor_code_len, 0x20))
            }

            // FIXME set inputSize according to the input length
            // delegatecall(gasLimit, to, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(delegatecall(GAS_LIMIT, CALL_ACTOR_PRECOMPILE_ADDR, input, 0x100, raw_response, MAX_RAW_RESPONSE_SIZE)) {
                revert(0, 0)
            }
        }

        return raw_response;
    }

    function readRespData(bytes memory raw_response) internal pure returns (bytes memory) {
        uint256 exit_code = Misc.toUint256(raw_response, 0x00);
        uint256 size = Misc.toUint256(raw_response, 0x60);
        require(exit_code == 0, string.concat("actor error code ", Strings.toString(exit_code)));

        bytes memory result = new bytes(size);
        uint src;
        uint dst;
        assembly {
            src := add(raw_response, 0x80)
            dst := add(result, 0x20)
        }
        Misc.copy(src, dst, size);

        return result;
    }
}
