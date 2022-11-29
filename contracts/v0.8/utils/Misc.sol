library Misc {
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
}
