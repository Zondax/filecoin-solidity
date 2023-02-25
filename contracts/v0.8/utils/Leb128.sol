/*******************************************************************************
 *   (c) 2023 Zondax AG
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

import "../external/Buffer.sol";

/// @notice This library implement the leb128 
/// @author Zondax AG
library Leb128 {
    using Buffer for Buffer.buffer;

    /// @notice encode a unsigned integer 64bits into bytes
    /// @param actorId the actor ID to encode
    /// @return result return the value in bytes
    function encodeUnsignedLeb128FromUInt64(uint64 actorId) internal pure returns (Buffer.buffer memory result) {
        Buffer.buffer memory result;
        uint8 value;

        while (true) {
            uint8 byte_ = value & 0x7f;
            value >>= 7;
            if (value == 0) {
                result.appendUint8(byte_);
                return result;
            }
            result.appendUint8(byte_ | 0x80);
        }
    }

}
