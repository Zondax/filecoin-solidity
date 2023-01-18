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

import "./utils/Misc.sol";
import "./utils/Actor.sol";

/// @title TODO complete me
/// @author Zondax AG
library SendAPI {
    /// @notice TODO fill this a proper description
    function send(bytes memory toAddress, uint256 amount) internal {
        bytes memory rawResponse = Actor.call(0, toAddress, new bytes(0), Misc.NONE_CODEC, amount);

        Actor.readRespData(rawResponse);
    }
}
