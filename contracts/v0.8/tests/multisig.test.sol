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

import "../types/MultisigTypes.sol";
import "../MultisigAPI.sol";

/// @author Zondax AG
contract MultisigApiTest {
    function propose(bytes memory target, MultisigTypes.ProposeParams memory params) public returns (MultisigTypes.ProposeReturn memory) {
        return MultisigAPI.propose(target, params);
    }

    function approve(bytes memory target, MultisigTypes.TxnIDParams memory params) public returns (MultisigTypes.ApproveReturn memory) {
        return MultisigAPI.approve(target, params);
    }

    function cancel(bytes memory target, MultisigTypes.TxnIDParams memory params) public {
        return MultisigAPI.cancel(target, params);
    }

    function add_signer(bytes memory target, MultisigTypes.AddSignerParams memory params) public {
        return MultisigAPI.addSigner(target, params);
    }

    function remove_signer(bytes memory target, MultisigTypes.RemoveSignerParams memory params) public {
        return MultisigAPI.removeSigner(target, params);
    }

    function swap_signer(bytes memory target, MultisigTypes.SwapSignerParams memory params) public {
        return MultisigAPI.swapSigner(target, params);
    }

    function change_num_approvals_threshold(bytes memory target, MultisigTypes.ChangeNumApprovalsThresholdParams memory params) public {
        return MultisigAPI.changeNumApprovalsThreshold(target, params);
    }

    function lock_balance(bytes memory target, MultisigTypes.LockBalanceParams memory params) public {
        return MultisigAPI.lockBalance(target, params);
    }

    function universal_receiver_hook(bytes memory target, bytes memory params) public {
        return MultisigAPI.universalReceiverHook(target, params);
    }
}
