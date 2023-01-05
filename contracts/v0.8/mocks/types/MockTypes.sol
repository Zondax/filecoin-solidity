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
pragma solidity >=0.4.25 <=0.8.17;

/// @title Filecoin market actor types for Solidity.
/// @author Zondax AG
library MockTypes {
    struct Deal {
        uint64 id;
        bytes cid;
        uint64 size;
        bool verified;
        uint64 client;
        uint64 provider;
        string label;
        int64 start;
        int64 end;
        uint256 price_per_epoch;
        uint256 provider_collateral;
        uint256 client_collateral;
        int64 activated;
        int64 terminated;
    }
}
