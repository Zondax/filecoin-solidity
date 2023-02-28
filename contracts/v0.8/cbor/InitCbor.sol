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

import {InitTypes} from "../types/InitTypes.sol";
import "./FilecoinCbor.sol";
import "../utils/CborDecode.sol";
import "../utils/Misc.sol";

/// @title This library is a set of functions meant to handle CBOR parameters serialization and return values deserialization for Init actor exported methods.
/// @author Zondax AG
library InitCBOR {
    using CBOR for CBOR.CBORBuffer;
    using FilecoinCBOR for CBOR.CBORBuffer;
    using CBORDecoder for bytes;

    /// @notice serialize ExecParams struct to cbor in order to pass as arguments to the init actor
    /// @param params ExecParams to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeExecParams(InitTypes.ExecParams memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(2);
        buf.writeCid(params.code_cid.data);
        buf.writeBytes(params.constructor_params);

        return buf.data();
    }

    /// @notice deserialize ExecReturn struct from cbor encoded bytes coming from a init actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of ExecReturn created based on parsed data
    function deserializeExecReturn(bytes memory rawResp) internal pure returns (InitTypes.ExecReturn memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.id_address.data, byteIdx) = rawResp.readBytes(byteIdx);
        (ret.robust_address.data, byteIdx) = rawResp.readBytes(byteIdx);

        return ret;
    }

    /// @notice serialize Exec4Params struct to cbor in order to pass as arguments to the init actor
    /// @param params Exec4Params to serialize as cbor
    /// @return cbor serialized data as bytes
    function serializeExec4Params(InitTypes.Exec4Params memory params) internal pure returns (bytes memory) {
        CBOR.CBORBuffer memory buf = CBOR.create(64);

        buf.startFixedArray(3);
        buf.writeCid(params.code_cid.data);
        buf.writeBytes(params.constructor_params);
        buf.writeBytes(params.subaddress);

        return buf.data();
    }

    /// @notice deserialize Exec4Return struct from cbor encoded bytes coming from a init actor call
    /// @param rawResp cbor encoded response
    /// @return ret new instance of Exec4Return created based on parsed data
    function deserializeExec4Return(bytes memory rawResp) internal pure returns (InitTypes.Exec4Return memory ret) {
        uint byteIdx = 0;
        uint len;

        (len, byteIdx) = rawResp.readFixedArray(byteIdx);
        assert(len == 2);

        (ret.id_address.data, byteIdx) = rawResp.readBytes(byteIdx);
        (ret.robust_address.data, byteIdx) = rawResp.readBytes(byteIdx);

        return ret;
    }
}
