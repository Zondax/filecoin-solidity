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
//
pragma solidity >=0.4.25 <=0.8.17;

import "solidity-cborutils/contracts/CBOR.sol";

import {AccountTypes} from "../types/AccountTypes.sol";
import "../utils/CborDecode.sol";
import "../utils/Misc.sol";

/// @title FIXME
/// @author Zondax AG
library AuthenticateMessageCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serialize(AccountTypes.AuthenticateMessageParams memory params) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeBytes(params.signature);
        buf.writeBytes(params.message);

        return buf.data();
    }
}

library BytesCBOR {
    using CBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    function serializeBytes(bytes memory data) internal pure returns (bytes memory) {
        // FIXME what should the max length be on the buffer?
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.writeBytes(data);

        return buf.data();
    }
}
