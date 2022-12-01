// SPDX-License-Identifier: Apache-2.0
// DRAFT - NO AUDITED CODE
pragma solidity >=0.4.25 <=0.8.15;

library Misc {
    function toUint256(bytes memory _bytes, uint offset) internal pure returns (uint256 value) {
        assembly {
            value := mload(add(_bytes, offset))
        }
    }

    function toInt256(bytes memory _bytes, uint offset) internal pure returns (int256 value) {
        return int256(toUint256(_bytes, offset));
    }

    function toBytes(uint256 x) internal pure returns (bytes memory b) {
        b = new bytes(32);
        assembly {
            mstore(add(b, 32), x)
        }
    }

    function toBytes(int256 x) internal pure returns (bytes memory b) {
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
}
