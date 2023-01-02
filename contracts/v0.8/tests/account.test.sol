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
pragma solidity >=0.4.25 <=0.8.15;

import "../types/AccountTypes.sol";
import "../AccountAPI.sol";

/// @author Zondax AG
contract AccountApiTest {
    function authenticate_message(bytes memory target, AccountTypes.AuthenticateMessageParams memory params) public {
        AccountAPI.authenticateMessage(target, params);
    }

    function universal_receiver_hook(bytes memory target, bytes memory params) public {
        AccountAPI.universalReceiverHook(target, params);
    }
}
