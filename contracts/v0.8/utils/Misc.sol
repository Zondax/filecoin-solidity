library Misc {
    function toUint256(bytes memory _bytes, uint offset) internal pure returns (uint256 value) {
        assembly {
            value := mload(add(_bytes, offset))
        }
    }
}
