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

import "solidity-cborutils/contracts/CBOR.sol";

import "../utils/CborDecode.sol";
import "../utils/Misc.sol";

/// @title This library is a set of functions meant to handle CBOR serialization and deserialization for uint64 type
/// @author Zondax AG
library Uint64CBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    /// @notice serialize uint64 to cbor
    /// @param id value to serialize
    /// @return cbor encoded bytes
    function serialize(uint64 id) internal pure returns (bytes memory) {
        uint256 capacity = Misc.getPrefixSize(uint256(id));
        CBOR.CBORBuffer memory buf = CBOR.create(capacity);

        buf.writeUInt64(id);

        return buf.data();
    }
}
