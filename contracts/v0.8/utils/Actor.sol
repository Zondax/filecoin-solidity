// SPDX-License-Identifier: Apache-2.0
// DRAFT - NO AUDITED CODE
pragma solidity >=0.4.25 <=0.8.15;

import "@openzeppelin/contracts/utils/Strings.sol";

import "./Misc.sol";

library Actor {
    uint64 constant CODEC = 0x71;
    uint64 constant GAS_LIMIT = 100000000;
    uint64 constant CALL_ACTOR_PRECOMPILE_ADDR = 0x0e;
    uint64 constant MAX_RAW_RESPONSE_SIZE = 0x300;

    function call(uint method_num, bytes memory actor_code, bytes memory raw_request) internal returns (bytes memory) {
        bytes memory raw_response = new bytes(MAX_RAW_RESPONSE_SIZE);

        uint len;

        require(actor_code[0] == 0x00, "actor address needs to be type ID");

        assembly {
            len := mload(raw_request)
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), mload(actor_code))
            // params size
            mstore(add(input, 0x60), len)
            // actual params (copy by slice of 32 bytes)
            let offset := 0
            for {
                offset := 0x00
            } lt(offset, len) {
                offset := add(offset, 0x20)
            } {
                mstore(add(input, add(0x80, offset)), mload(add(raw_request, add(0x20, offset))))
            }
            if mod(len, 0x20) {
                offset := add(sub(offset, 0x20), mod(len, 0x20))
            }
            // actual address
            mstore(add(input, add(0x80, offset)), mload(add(actor_code, 0x20)))
            // no params

            // FIXME set inputSize according to the input length
            // call(gasLimit, to, value, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(call(GAS_LIMIT, CALL_ACTOR_PRECOMPILE_ADDR, 0x00, input, 0x100, raw_response, MAX_RAW_RESPONSE_SIZE)) {
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
