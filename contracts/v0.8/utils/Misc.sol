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

/// @title Library containing miscellaneous functions used on the project
/// @author Zondax AG
library Misc {
    uint64 constant DAG_CBOR_CODEC = 0x71;
    uint64 constant CBOR_CODEC = 0x51;
    uint64 constant NONE_CODEC = 0x00;

    // Code taken from Openzeppelin repo
    // Link: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/0320a718e8e07b1d932f5acb8ad9cec9d9eed99b/contracts/utils/math/SignedMath.sol#L37-L42
    /// @notice get the abs from a signed number
    /// @param n number to get abs from
    /// @return unsigned number
    function abs(int256 n) internal pure returns (uint256) {
        unchecked {
            // must be unchecked in order to support `n = type(int256).min`
            return uint256(n >= 0 ? n : -n);
        }
    }
}
