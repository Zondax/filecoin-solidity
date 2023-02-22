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
import "./CommonTypes.sol";

/// @title Filecoin miner actor types for Solidity.
/// @author Zondax AG
library MinerTypes {
    uint constant GetOwnerMethodNum = 3275365574;
    uint constant ChangeOwnerAddressMethodNum = 1010589339;
    uint constant IsControllingAddressMethodNum = 348244887;
    uint constant GetSectorSizeMethodNum = 3858292296;
    uint constant GetAvailableBalanceMethodNum = 4026106874;
    uint constant GetVestingFundsMethodNum = 1726876304;
    uint constant ChangeBeneficiaryMethodNum = 1570634796;
    uint constant GetBeneficiaryMethodNum = 4158972569;
    uint constant ChangeWorkerAddressMethodNum = 3302309124;
    uint constant ChangePeerIDMethodNum = 1236548004;
    uint constant ChangeMultiaddrsMethodNum = 1063480576;
    uint constant RepayDebtMethodNum = 3665352697;
    uint constant ConfirmChangeWorkerAddressMethodNum = 2354970453;
    uint constant GetPeerIDMethodNum = 2812875329;
    uint constant GetMultiaddrsMethodNum = 1332909407;
    uint constant WithdrawBalanceMethodNum = 2280458852;

    /// @param owner owner address.
    /// @param proposed owner address.
    struct GetOwnerReturn {
        bytes owner;
        bytes proposed;
    }

    /// @param addr the address to be verified.
    struct IsControllingAddressParam {
        bytes addr;
    }

    /// @param is_controlling if the specified address is the control address.
    struct IsControllingAddressReturn {
        bool is_controlling;
    }

    /// @param sector_size the sector size of this miner.
    struct GetSectorSizeReturn {
        uint64 sector_size;
    }

    /// @param available_balance the available token balance amount.
    struct GetAvailableBalanceReturn {
        BigInt available_balance;
    }

    /// @param vesting_funds funds
    struct GetVestingFundsReturn {
        VestingFunds[] vesting_funds;
    }

    /// @param new_beneficiary the new beneficiary address.
    /// @param new_quota the new quota token amount.
    /// @param new_expiration the epoch that the new quota will be expired.
    struct ChangeBeneficiaryParams {
        bytes new_beneficiary;
        BigInt new_quota;
        uint64 new_expiration;
    }

    /// @param active current active beneficiary.
    /// @param proposed the proposed and pending beneficiary.
    struct GetBeneficiaryReturn {
        ActiveBeneficiary active;
        PendingBeneficiaryChange proposed;
    }

    /// @param new_worker the new worker address.
    /// @param new_control_addresses the new controller addresses.
    struct ChangeWorkerAddressParams {
        bytes new_worker;
        bytes[] new_control_addresses;
    }

    /// @param new_id the new peer ID.
    struct ChangePeerIDParams {
        bytes new_id;
    }

    /// @param new_multi_addrs the new multi-signature address.
    struct ChangeMultiaddrsParams {
        bytes[] new_multi_addrs;
    }

    /// @param peer_id the peer ID for the specified storage provider/miner.
    struct GetPeerIDReturn {
        bytes peer_id;
    }

    /// @param multi_addrs the multi-signature address.
    struct GetMultiaddrsReturn {
        bytes[] multi_addrs;
    }

    /// @param amount_requested withdraw token amount.
    struct WithdrawBalanceParams {
        bytes amount_requested;
    }

    /// @param amount_withdrawn the token amount withdraw.
    struct WithdrawBalanceReturn {
        bytes amount_withdrawn;
    }

    /// @param epoch the epoch of funds vested.
    /// @param amount the amount of funds vested.
    struct VestingFunds {
        int64 epoch;
        BigInt amount;
    }

    /// @param quota the quota token amount.
    /// @param used_quota the used quota token amount.
    /// @param expiration the epoch that the quota will be expired.
    struct BeneficiaryTerm {
        BigInt quota;
        BigInt used_quota;
        uint64 expiration;
    }

    /// @param beneficiary the address of the beneficiary.
    /// @param term BeneficiaryTerm
    struct ActiveBeneficiary {
        bytes beneficiary;
        BeneficiaryTerm term;
    }

    /// @param new_beneficiary the new beneficiary address.
    /// @param new_quota the new quota token amount.
    /// @param new_expiration the epoch that the new quota will be expired.
    /// @param approved_by_beneficiary if this proposal is approved by beneficiary or not.
    /// @param approved_by_nominee if this proposal is approved by nominee or not.
    struct PendingBeneficiaryChange {
        bytes new_beneficiary;
        BigInt new_quota;
        uint64 new_expiration;
        bool approved_by_beneficiary;
        bool approved_by_nominee;
    }

    enum SectorSize {
        _2KiB,
        _8MiB,
        _512MiB,
        _32GiB,
        _64GiB
    }
}
