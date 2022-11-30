library Misc {

    uint64 constant CODEC = 0x71;

    function toUint256(bytes memory _bytes, uint offset) internal pure returns (uint256 value) {
        assembly {
            value := mload(add(_bytes, offset))
        }
    }

    function toBytes(uint256 x) internal pure returns (bytes memory b) {
        b = new bytes(32);
        assembly {
            mstore(add(b, 32), x)
        }
    }

    function copy(uint src, uint dest, uint len) internal pure {
        // Copy word-length chunks while possible
        for (; len >= 32; len -= 32) {
            assembly {
                mstore(dest, mload(src))
            }
            dest += 32;
            src += 32;
        }

        if (len == 0) return;

        // Copy remaining bytes
        uint mask = 256 ** (32 - len) - 1;
        assembly {
            let srcpart := and(mload(src), not(mask))
            let destpart := and(mload(dest), mask)
            mstore(dest, or(destpart, srcpart))
        }
    }

    function call_actor(uint method_num, bytes memory actor_code, bytes memory raw_request) internal returns (bytes memory) {
                // FIXME: unknown size for the response
        bytes memory raw_response = new bytes(0x0100);

        uint len;

        assembly {
            len := mload(raw_request)
            let input := mload(0x40)
            mstore(input, method_num)
            mstore(add(input, 0x20), CODEC)
            // address size
            mstore(add(input, 0x40), 0x02)
            // params size
            mstore(add(input, 0x60), len)
            // actual params (copy by slice of 32 bytes)
            let offset := 0
            for {offset := 0x00} lt(offset, len) { offset := add(offset, 0x20)} {
                mstore(add(input, add(0x80, offset)), mload(add(raw_request, add(0x20, offset))))
            }
            offset := add(sub(offset, 0x20), mod(len, 0x20))
            // actual address
            mstore(add(input, add(0x80, offset)), mload(add(actor_code, 0x20)))
            // no params
            // call(gasLimit, to, value, inputOffset, inputSize, outputOffset, outputSize)
            if iszero(call(100000000, 0x0e, 0x00, input, 0x0100, raw_response, 0x0100)) {
                revert(0, 0)
            }
        }

        return raw_response;
    } 

    function getDataFromActorResponse(bytes memory raw_response) internal pure returns (bytes memory) {
        uint256 exit_code = Misc.toUint256(raw_response, 0x00);
        uint256 size = Misc.toUint256(raw_response, 0x60);
        require(exit_code == 0, "actor error");

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
