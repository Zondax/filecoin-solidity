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

import "../cbor/BigIntCbor.sol";

/// @title Filecoin actors' common types for Solidity.
/// @author Zondax AG
library CommonTypes {





    struct FailCode {
        uint32 idx;
        uint32 code;
    }

    struct BatchReturn {
        // Total successes in batch
        uint32 success_count;
        // Failure code and index for each failure in batch
        FailCode[] fail_codes;
    }
}
