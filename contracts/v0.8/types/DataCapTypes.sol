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

/// @title Filecoin datacap actor types for Solidity.
/// @author Zondax AG
library DataCapTypes {
    uint64 constant ActorID = 7;
    uint constant NameMethodNum = 48890204;
    uint constant SymbolMethodNum = 2061153854;
    uint constant TotalSupplyMethodNum = 114981429;
    uint constant BalanceOfMethodNum = 3261979605;
    uint constant TransferMethodNum = 80475954;
    uint constant TransferFromMethodNum = 3621052141;
    uint constant IncreaseAllowanceMethodNum = 1777121560;
    uint constant DecreaseAllowanceMethodNum = 1529376545;
    uint constant RevokeAllowanceMethodNum = 2765635761;
    uint constant BurnMethodNum = 1434719642;
    uint constant BurnFromMethodNum = 2979674018;
    uint constant AllowanceMethodNum = 4205072950;
    uint constant ReceiverHookMethodNum = 3726118371;

    /// @param owner the wallet address of the owner.
    /// @param operator the wallet address of the owner.
    struct GetAllowanceParams {
        bytes owner;
        bytes operator;
    }

    /// @param to the address to receive DataCap token.
    /// @param amount a non-negative amount to transfer.
    /// @param operator_data Arbitrary data to pass on via the receiver hook.
    struct TransferParams {
        bytes to;
        BigInt amount;
        bytes operator_data;
    }

    /// @param from_balance the balance of from_address.
    /// @param to_balance the balance of to_address.
    /// @param recipient_data data returned from receive hook.
    struct TransferReturn {
        BigInt from_balance;
        BigInt to_balance;
        bytes recipient_data;
    }

    /// @param from the address to send DataCap Token.
    /// @param to the address to receive DataCap Token.
    /// @param amount a non-negative amount to transfer.
    /// @param operator_data arbitrary data to pass on via the receiver hook.
    struct TransferFromParams {
        bytes from;
        bytes to;
        BigInt amount;
        bytes operator_data;
    }

    /// @param from_balance the balance of from_address.
    /// @param to_balance the balance of to_address.
    /// @param allowance the remaining allowance of owner address.
    /// @param recipient_data data returned from receive hook.
    struct TransferFromReturn {
        BigInt from_balance;
        BigInt to_balance;
        BigInt allowance;
        bytes recipient_data;
    }

    /// @param operator the  wallet address of the operator.
    /// @param increase increase DataCap token allowance for the operator address.
    struct IncreaseAllowanceParams {
        bytes operator;
        BigInt increase;
    }

    /// @param operator the wallet address of the operator.
    /// @param decrease the decreased DataCap token allowance of the operator address.
    struct DecreaseAllowanceParams {
        bytes operator;
        BigInt decrease;
    }

    /// @param operator the wallet address of the operator.
    struct RevokeAllowanceParams {
        bytes operator;
    }

    /// @param amount the amount the DataCap token to be burned.
    struct BurnParams {
        BigInt amount;
    }

    /// @param balance the updated DataCap token balance of the owner/caller address.
    struct BurnReturn {
        BigInt balance;
    }

    /// @param owner the wallet address of the owner.
    /// @param amount the amount of DataCap token to be burned.
    struct BurnFromParams {
        bytes owner;
        BigInt amount;
    }

    /// @param balance new balance in the account after the successful burn.
    /// @param allowance new remaining allowance between the owner and operator (caller)
    struct BurnFromReturn {
        BigInt balance;
        BigInt allowance;
    }
}
