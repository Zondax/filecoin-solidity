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

/// @title Filecoin init actor types for Solidity.
/// @author Zondax AG
library InitTypes {
    uint64 constant ActorID = 1;
    uint constant ExecMethodNum = 81225168;
    uint constant Exec4MethodNum = 3;

    /// @param code_cid cid of the actor type to create
    /// @param constructor_params parameters required to create a new actor
    struct ExecParams {
        bytes code_cid;
        bytes constructor_params;
    }

    /// @param id_address the canonical ID-based address for the actor.
    /// @param robust_address a more expensive but re-org-safe address for the newly created actor.
    struct ExecReturn {
        bytes id_address;
        bytes robust_address;
    }

    /// @param code_cid cid of the actor type to create
    /// @param constructor_params parameters required to create a new actor
    /// @param subaddress sub address the new actor instance will be related to
    struct Exec4Params {
        bytes code_cid;
        bytes constructor_params;
        bytes subaddress;
    }

    /// @param id_address the canonical ID-based address for the actor.
    /// @param robust_address a more expensive but re-org-safe address for the newly created actor.
    struct Exec4Return {
        bytes id_address;
        bytes robust_address;
    }
}
