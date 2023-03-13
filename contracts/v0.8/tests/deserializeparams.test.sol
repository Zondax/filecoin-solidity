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
//
// THIS CODE WAS SECURITY REVIEWED BY KUDELSKI SECURITY, BUT NOT FORMALLY AUDITED

// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.17;

import "../types/MinerTypes.sol";
import "../cbor/MinerCbor.sol";

/// @notice This file is meant to serve as a deployable contract to test
/// @author Zondax AG
contract DeserializeParamsTest {
    using MinerCBOR for *;

    function deserializeGetVestingFundsReturn() public pure {
        bytes memory params = hex"8181820040";

        MinerTypes.GetVestingFundsReturn memory result = params.deserializeGetVestingFundsReturn();

        require(result.vesting_funds.length == 1, "result length should be 1");
    }
}
