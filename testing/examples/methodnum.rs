use std::fs;

    /*****************************************
     *
     *  This file is used only to generate and
     *  compare the method num using FRC42
     *
     *****************************************/

fn main() {

    /*********************************
     *
     *          MARKET ACTOR
     *
     *********************************/


    println!("MARKET EXPORTED METHOD NUM");

    let mut method_nums: Vec<(String, u64)> = vec![];

    let AddBalanceExported = frc42_dispatch::method_hash!("AddBalance");
    method_nums.push(("AddBalanceMethodNum".to_string(), AddBalanceExported));
    let WithdrawBalanceExported = frc42_dispatch::method_hash!("WithdrawBalance");
    method_nums.push(("WithdrawBalanceMethodNum".to_string(), WithdrawBalanceExported));
    let PublishStorageDealsExported = frc42_dispatch::method_hash!("PublishStorageDeals");
    method_nums.push(("PublishStorageDealsMethodNum".to_string(), PublishStorageDealsExported));
    let GetBalanceExported = frc42_dispatch::method_hash!("GetBalance");
    method_nums.push(("GetBalanceMethodNum".to_string(), GetBalanceExported));
    let GetDealDataCommitmentExported = frc42_dispatch::method_hash!("GetDealDataCommitment");
    method_nums.push(("GetDealDataCommitmentMethodNum".to_string(), GetDealDataCommitmentExported));
    let GetDealClientExported = frc42_dispatch::method_hash!("GetDealClient");
    method_nums.push(("GetDealClientMethodNum".to_string(), GetDealClientExported));
    let GetDealProviderExported = frc42_dispatch::method_hash!("GetDealProvider");
    method_nums.push(("GetDealProviderMethodNum".to_string(), GetDealProviderExported));
    let GetDealLabelExported = frc42_dispatch::method_hash!("GetDealLabel");
    method_nums.push(("GetDealLabelMethodNum".to_string(), GetDealLabelExported));
    let GetDealTermExported = frc42_dispatch::method_hash!("GetDealTerm");
    method_nums.push(("GetDealTermMethodNum".to_string(), GetDealTermExported));
    let GetDealClientCollateralExported = frc42_dispatch::method_hash!("GetDealClientCollateral");
    method_nums.push(("GetDealClientCollateralMethodNum".to_string(), GetDealClientCollateralExported));
    let GetDealProviderCollateralExported = frc42_dispatch::method_hash!("GetDealProviderCollateral");
    method_nums.push(("GetDealProviderCollateralMethodNum".to_string(), GetDealProviderCollateralExported));
    let GetDealVerifiedExported = frc42_dispatch::method_hash!("GetDealVerified");
    method_nums.push(("GetDealVerifiedMethodNum".to_string(), GetDealVerifiedExported));
    let GetDealActivationExported = frc42_dispatch::method_hash!("GetDealActivation");
    method_nums.push(("GetDealActivationMethodNum".to_string(), GetDealActivationExported));
    let GetDealTotalPriceExported = frc42_dispatch::method_hash!("GetDealTotalPrice");
    method_nums.push(("GetDealTotalPriceMethodNum".to_string(), GetDealTotalPriceExported));

    println!("AddBalanceExported {}", AddBalanceExported);
    println!("WithdrawBalanceExported {}", WithdrawBalanceExported);
    println!("PublishStorageDealsExported {}", PublishStorageDealsExported);
    println!("GetBalanceExported {}", GetBalanceExported);
    println!("GetDealDataCommitmentExported {}", GetDealDataCommitmentExported);
    println!("GetDealClientExported {}", GetDealClientExported);
    println!("GetDealProviderExported {}", GetDealProviderExported);
    println!("GetDealLabelExported {}", GetDealLabelExported);
    println!("GetDealTermExported {}", GetDealTermExported);
    println!("GetDealClientCollateralExported {}", GetDealClientCollateralExported);
    println!("GetDealProviderCollateralExported {}", GetDealProviderCollateralExported);
    println!("GetDealVerifiedExported {}", GetDealVerifiedExported);
    println!("GetDealActivationExported {}", GetDealActivationExported);
    println!("GetDealTotalPriceExported {}", GetDealTotalPriceExported);

    // Verify we have the right one
    let file = fs::read_to_string("../contracts/v0.8/types/MarketTypes.sol").unwrap();

    'method: for (method, method_num ) in method_nums {
        for line in file.lines() {
            if line.contains(&format!(" {} ",method)) {
                if !line.contains(&method_num.to_string()) {
                    panic!("Wrong method num for {}", method);
                }
                continue 'method;
            }
        }
        panic!("Missing method : {}", method);
    }


    /*********************************
     *
     *          MINER ACTOR
     *
     *********************************/


    println!("MINER EXPORTED METHOD NUM");

    let mut method_nums: Vec<(String, u64)> = vec![];

    let ChangeWorkerAddressExported = frc42_dispatch::method_hash!("ChangeWorkerAddress");
    method_nums.push(("ChangeWorkerAddressMethodNum".to_string(), ChangeWorkerAddressExported));

    let ChangePeerIDExported = frc42_dispatch::method_hash!("ChangePeerID");
    method_nums.push(("ChangePeerIDMethodNum".to_string(), ChangePeerIDExported));

    let WithdrawBalanceExported = frc42_dispatch::method_hash!("WithdrawBalance");
    method_nums.push(("WithdrawBalanceMethodNum".to_string(), WithdrawBalanceExported));

    let ChangeMultiaddrsExported = frc42_dispatch::method_hash!("ChangeMultiaddrs");
    method_nums.push(("ChangeMultiaddrsMethodNum".to_string(), ChangeMultiaddrsExported));

    let ConfirmChangeWorkerAddressExported = frc42_dispatch::method_hash!("ConfirmChangeWorkerAddress");
    method_nums.push(("ConfirmChangeWorkerAddressMethodNum".to_string(), ConfirmChangeWorkerAddressExported));

    let RepayDebtExported = frc42_dispatch::method_hash!("RepayDebt");
    method_nums.push(("RepayDebtMethodNum".to_string(), RepayDebtExported));

    let ChangeOwnerAddressExported = frc42_dispatch::method_hash!("ChangeOwnerAddress");
    method_nums.push(("ChangeOwnerAddressMethodNum".to_string(), ChangeOwnerAddressExported));

    let ChangeBenificiaryExported = frc42_dispatch::method_hash!("ChangeBeneficiary");
    method_nums.push(("ChangeBeneficiaryMethodNum".to_string(), ChangeBenificiaryExported));

    let GetBeneficiaryExported = frc42_dispatch::method_hash!("GetBeneficiary");
    method_nums.push(("GetBeneficiaryMethodNum".to_string(), GetBeneficiaryExported));

    let GetOwnerExported = frc42_dispatch::method_hash!("GetOwner");
    method_nums.push(("GetOwnerMethodNum".to_string(), GetOwnerExported));

    let IsControllingAddressExported = frc42_dispatch::method_hash!("IsControllingAddress");
    method_nums.push(("IsControllingAddressMethodNum".to_string(), IsControllingAddressExported));

    let GetSectorSizeExported = frc42_dispatch::method_hash!("GetSectorSize");
    method_nums.push(("GetSectorSizeMethodNum".to_string(), GetSectorSizeExported));

    let GetAvailableBalanceExported = frc42_dispatch::method_hash!("GetAvailableBalance");
    method_nums.push(("GetAvailableBalanceMethodNum".to_string(), GetAvailableBalanceExported));

    let GetVestingFundsExported = frc42_dispatch::method_hash!("GetVestingFunds");
    method_nums.push(("GetVestingFundsMethodNum".to_string(), GetVestingFundsExported));

    let GetPeerIDExported = frc42_dispatch::method_hash!("GetPeerID");
    method_nums.push(("GetPeerIDMethodNum".to_string(), GetPeerIDExported));

    let GetMultiaddrsExported = frc42_dispatch::method_hash!("GetMultiaddrs");
    method_nums.push(("GetMultiaddrsMethodNum".to_string(), GetMultiaddrsExported));


    println!("ChangeWorkerAddressExported {}", ChangeWorkerAddressExported);
    println!("ChangePeerIDExported {}", ChangePeerIDExported);
    println!("WithdrawBalanceExported {}", WithdrawBalanceExported);
    println!("ChangeMultiaddrsExported {}", ChangeMultiaddrsExported);
    println!("ConfirmChangeWorkerAddressExported {}", ConfirmChangeWorkerAddressExported);
    println!("RepayDebtExported {}", RepayDebtExported);
    println!("ChangeOwnerAddressExported {}", ChangeOwnerAddressExported);
    println!("ChangeBenificiaryExported {}", ChangeBenificiaryExported);
    println!("GetBeneficiaryExported {}", GetBeneficiaryExported);
    println!("GetOwnerExported {}", GetOwnerExported);
    println!("IsControllingAddressExported {}", IsControllingAddressExported);
    println!("GetSectorSizeExported {}", GetSectorSizeExported);
    println!("GetAvailableBalanceExported {}", GetAvailableBalanceExported);
    println!("GetVestingFundsExported {}", GetVestingFundsExported);
    println!("GetPeerIDExported {}", GetPeerIDExported);
    println!("GetMultiaddrsExported {}", GetMultiaddrsExported);

    // Verify we have the right ones
    let file = fs::read_to_string("../contracts/v0.8/types/MinerTypes.sol").unwrap();

    'method: for (method, method_num ) in method_nums {
        for line in file.lines() {
            if line.contains(&format!(" {} ",method)) {
                if !line.contains(&method_num.to_string()) {
                    panic!("Wrong method num for {}", method);
                }
                continue 'method;
            }
        }
        panic!("Missing method : {}", method);
    }

    /*********************************
     *
     *          POWER ACTOR
     *
     *********************************/


    println!("POWER EXPORTED METHOD NUM");

    let mut method_nums: Vec<(String, u64)> = vec![];

    let CreateMinerExported = frc42_dispatch::method_hash!("CreateMiner");
    method_nums.push(("CreateMinerMethodNum".to_string(), CreateMinerExported));

    let NetworkRawPowerExported = frc42_dispatch::method_hash!("NetworkRawPower");
    method_nums.push(("NetworkRawPowerMethodNum".to_string(), NetworkRawPowerExported));

    let MinerRawPowerExported = frc42_dispatch::method_hash!("MinerRawPower");
    method_nums.push(("MinerRawPowerMethodNum".to_string(), MinerRawPowerExported));

    let MinerCountExported = frc42_dispatch::method_hash!("MinerCount");
    method_nums.push(("MinerCountMethodNum".to_string(), MinerCountExported));

    let MinerConsensusCountExported = frc42_dispatch::method_hash!("MinerConsensusCount");
    method_nums.push(("MinerConsensusCountMethodNum".to_string(), MinerConsensusCountExported));

    println!("CreateMinerExported {}", CreateMinerExported);
    println!("NetworkRawPowerExported {}", NetworkRawPowerExported);
    println!("MinerRawPowerExported {}", MinerRawPowerExported);
    println!("MinerCountExported {}", MinerCountExported);
    println!("MinerConsensusCountExported {}", MinerConsensusCountExported);

    // Verify we have the right ones
    let file = fs::read_to_string("../contracts/v0.8/types/PowerTypes.sol").unwrap();

    'method: for (method, method_num ) in method_nums {
        for line in file.lines() {
            if line.contains(&format!(" {} ",method)) {
                if !line.contains(&method_num.to_string()) {
                    panic!("Wrong method num for {}", method);
                }
                continue 'method;
            }
        }
        panic!("Missing method : {}", method);
    }

    /*********************************
     *
     *      VERIFIED REGISTRY ACTOR
     *
     *********************************/


    println!("VERIFIED REGISTRY EXPORTED METHOD NUM");
    let mut method_nums: Vec<(String, u64)> = vec![];

    let AddVerifiedClientExported = frc42_dispatch::method_hash!("AddVerifiedClient");
    method_nums.push(("AddVerifiedClientMethodNum".to_string(), AddVerifiedClientExported));

    let RemoveExpiredAllocationsExported = frc42_dispatch::method_hash!("RemoveExpiredAllocations");
    method_nums.push(("RemoveExpiredAllocationsMethodNum".to_string(), RemoveExpiredAllocationsExported));

    let GetClaimsExported = frc42_dispatch::method_hash!("GetClaims");
    method_nums.push(("GetClaimsMethodNum".to_string(), GetClaimsExported));

    let ExtendClaimTermsExported = frc42_dispatch::method_hash!("ExtendClaimTerms");
    method_nums.push(("ExtendClaimTermsMethodNum".to_string(), ExtendClaimTermsExported));

    let RemoveExpiredClaimsExported = frc42_dispatch::method_hash!("RemoveExpiredClaims");
    method_nums.push(("RemoveExpiredClaimsMethodNum".to_string(), RemoveExpiredClaimsExported));


    println!("AddVerifiedClientExported {}", AddVerifiedClientExported);
    println!("RemoveExpiredAllocationsExported {}", RemoveExpiredAllocationsExported);
    println!("GetClaimsExported {}", GetClaimsExported);
    println!("ExtendClaimTermsExported {}", ExtendClaimTermsExported);
    println!("RemoveExpiredClaimsExported {}", RemoveExpiredClaimsExported);

    // Verify we have the right ones
    let file = fs::read_to_string("../contracts/v0.8/types/VerifRegTypes.sol").unwrap();

    'method: for (method, method_num ) in method_nums {
        for line in file.lines() {
            if line.contains(&format!(" {} ",method)) {
                if !line.contains(&method_num.to_string()) {
                    panic!("Wrong method num for {}", method);
                }
                continue 'method;
            }
        }
        panic!("Missing method : {}", method);
    }

    /*********************************
     *
     *      DATA CAP ACTOR
     *
     *********************************/

    println!("DATA CAP EXPORTED METHOD NUM");
    let mut method_nums: Vec<(String, u64)> = vec![];

    let NameExported = frc42_dispatch::method_hash!("Name");
    method_nums.push(("NameMethodNum".to_string(), NameExported));

    let SymbolExported = frc42_dispatch::method_hash!("Symbol");
    method_nums.push(("SymbolMethodNum".to_string(), SymbolExported));

    let TotalSupplyExported = frc42_dispatch::method_hash!("TotalSupply");
    method_nums.push(("TotalSupplyMethodNum".to_string(), TotalSupplyExported));

    let BalanceExported = frc42_dispatch::method_hash!("Balance");
    method_nums.push(("BalanceOfMethodNum".to_string(), BalanceExported));

    let TransferExported = frc42_dispatch::method_hash!("Transfer");
    method_nums.push(("TransferMethodNum".to_string(), TransferExported));

    let TransferFromExported = frc42_dispatch::method_hash!("TransferFrom");
    method_nums.push(("TransferFromMethodNum".to_string(), TransferFromExported));

    let IncreaseAllowanceExported = frc42_dispatch::method_hash!("IncreaseAllowance");
    method_nums.push(("IncreaseAllowanceMethodNum".to_string(), IncreaseAllowanceExported));

    let DecreaseAllowanceExported = frc42_dispatch::method_hash!("DecreaseAllowance");
    method_nums.push(("DecreaseAllowanceMethodNum".to_string(), DecreaseAllowanceExported));

    let RevokeAllowanceExported = frc42_dispatch::method_hash!("RevokeAllowance");
    method_nums.push(("RevokeAllowanceMethodNum".to_string(), RevokeAllowanceExported));

    let BurnExported = frc42_dispatch::method_hash!("Burn");
    method_nums.push(("BurnMethodNum".to_string(), BurnExported));

    let BurnFromExported = frc42_dispatch::method_hash!("BurnFrom");
    method_nums.push(("BurnFromMethodNum".to_string(), BurnFromExported));

    let AllowanceExported = frc42_dispatch::method_hash!("Allowance");
    method_nums.push(("AllowanceMethodNum".to_string(), AllowanceExported));



    println!("NameExported {}", NameExported);
    println!("SymbolExported {}", SymbolExported);
    println!("TotalSupplyExported {}", TotalSupplyExported);
    println!("BalanceExported {}", BalanceExported);
    println!("TransferExported {}", TransferExported);
    println!("TransferFromExported {}", TransferFromExported);
    println!("IncreaseAllowanceExported {}", IncreaseAllowanceExported);
    println!("DecreaseAllowanceExported {}", DecreaseAllowanceExported);
    println!("RevokeAllowanceExported {}", RevokeAllowanceExported);
    println!("BurnExported {}", BurnExported);
    println!("BurnFromExported {}", BurnFromExported);
    println!("AllowanceExported {}", AllowanceExported);

    // Verify we have the right ones
    let file = fs::read_to_string("../contracts/v0.8/types/DataCapTypes.sol").unwrap();

    'method: for (method, method_num ) in method_nums {
        for line in file.lines() {
            if line.contains(&format!(" {} ",method)) {
                if !line.contains(&method_num.to_string()) {
                    println!("{}", line);
                    panic!("Wrong method num for {} {}", method, AllowanceExported);
                }
                continue 'method;
            }
        }
        panic!("Missing method : {}", method);
    }


    /*********************************
     *
     *      ACCOUNT ACTOR
     *
     *********************************/

    println!("ACCOUNT EXPORTED METHOD NUM");
    let mut method_nums: Vec<(String, u64)> = vec![];

    let AuthenticateMessageExported = frc42_dispatch::method_hash!("AuthenticateMessage");
    method_nums.push(("AuthenticateMessageMethodNum".to_string(), AuthenticateMessageExported));


    println!("AuthenticateMessageExported {}", AuthenticateMessageExported);

    // Verify we have the right ones
    let file = fs::read_to_string("../contracts/v0.8/types/AccountTypes.sol").unwrap();

    'method: for (method, method_num ) in method_nums {
        for line in file.lines() {
            if line.contains(&format!(" {} ",method)) {
                if !line.contains(&method_num.to_string()) {
                    panic!("Wrong method num for {}", method);
                }
                continue 'method;
            }
        }
        panic!("Missing method : {}", method);
    }

    /*********************************
     *
     *      COMMON ACTOR
     *
     *********************************/

     println!("COMMON EXPORTED METHOD NUM");
     let mut method_nums: Vec<(String, u64)> = vec![];

     let UniversalReceiverHook = frc42_dispatch::method_hash!("Receive");
     method_nums.push(("UniversalReceiverHookMethodNum".to_string(), UniversalReceiverHook));


     println!("UniversalReceiverHookMethodNum {}", UniversalReceiverHook);

     // Verify we have the right ones
     let file = fs::read_to_string("../contracts/v0.8/types/CommonTypes.sol").unwrap();

     'method: for (method, method_num ) in method_nums {
         for line in file.lines() {
             if line.contains(&format!(" {} ",method)) {
                 if !line.contains(&method_num.to_string()) {
                     panic!("Wrong method num for {}", method);
                 }
                 continue 'method;
             }
         }
         panic!("Missing method : {}", method);
     }
}
