fn main() {
    println!("MARKET EXPORTED METHOD NUM");

    let AddBalanceExported = frc42_dispatch::method_hash!("AddBalance");
    let WithdrawBalanceExported = frc42_dispatch::method_hash!("WithdrawBalance");
    let PublishStorageDealsExported = frc42_dispatch::method_hash!("PublishStorageDeals");
    let GetBalanceExported = frc42_dispatch::method_hash!("GetBalance");
    let GetDealDataCommitmentExported = frc42_dispatch::method_hash!("GetDealDataCommitment");
    let GetDealClientExported = frc42_dispatch::method_hash!("GetDealClient");
    let GetDealProviderExported = frc42_dispatch::method_hash!("GetDealProvider");
    let GetDealLabelExported = frc42_dispatch::method_hash!("GetDealLabel");
    let GetDealTermExported = frc42_dispatch::method_hash!("GetDealTerm");
    let GetDealTotalPriceExported = frc42_dispatch::method_hash!("GetDealTotalPrice");
    let GetDealClientCollateralExported = frc42_dispatch::method_hash!("GetDealClientCollateral");
    let GetDealProviderCollateralExported = frc42_dispatch::method_hash!("GetDealProviderCollateral");
    let GetDealVerifiedExported = frc42_dispatch::method_hash!("GetDealVerified");
    let GetDealActivationExported = frc42_dispatch::method_hash!("GetDealActivation");

    println!("AddBalanceExported {}", AddBalanceExported);
    println!("WithdrawBalanceExported {}", WithdrawBalanceExported);
    println!("PublishStorageDealsExported {}", PublishStorageDealsExported);
    println!("GetBalanceExported {}", GetBalanceExported);
    println!("GetDealDataCommitmentExported {}", GetDealDataCommitmentExported);
    println!("GetDealClientExported {}", GetDealClientExported);
    println!("GetDealProviderExported {}", GetDealProviderExported);
    println!("GetDealLabelExported {}", GetDealLabelExported);
    println!("GetDealTermExported {}", GetDealTermExported);
    println!("GetDealTotalPriceExported {}", GetDealTotalPriceExported);
    println!("GetDealClientCollateralExported {}", GetDealClientCollateralExported);
    println!("GetDealProviderCollateralExported {}", GetDealProviderCollateralExported);
    println!("GetDealVerifiedExported {}", GetDealVerifiedExported);
    println!("GetDealActivationExported {}", GetDealActivationExported);

    println!("MINER EXPORTED METHOD NUM");

    let ChangeWorkerAddressExported = frc42_dispatch::method_hash!("ChangeWorkerAddress");
    let ChangePeerIDExported = frc42_dispatch::method_hash!("ChangePeerID");
    let WithdrawBalanceExported = frc42_dispatch::method_hash!("WithdrawBalance");
    let ChangeMultiaddrsExported = frc42_dispatch::method_hash!("ChangeMultiaddrs");
    let ConfirmChangeWorkerAddressExported = frc42_dispatch::method_hash!("ConfirmChangeWorkerAddress");
    let RepayDebtExported = frc42_dispatch::method_hash!("RepayDebt");
    let ChangeOwnerAddressExported = frc42_dispatch::method_hash!("ChangeOwnerAddress");
    let ChangeBenificiaryExported = frc42_dispatch::method_hash!("ChangeBeneficiary");
    let GetBeneficiaryExported = frc42_dispatch::method_hash!("GetBeneficiary");
    let GetOwnerExported = frc42_dispatch::method_hash!("GetOwner");
    let IsControllingAddressExported = frc42_dispatch::method_hash!("IsControllingAddress");
    let GetSectorSizeExported = frc42_dispatch::method_hash!("GetSectorSize");
    let GetAvailableBalanceExported = frc42_dispatch::method_hash!("GetAvailableBalance");
    let GetVestingFundsExported = frc42_dispatch::method_hash!("GetVestingFunds");
    let GetPeerIDExported = frc42_dispatch::method_hash!("GetPeerID");
    let GetMultiaddrsExported = frc42_dispatch::method_hash!("GetMultiaddrs");

    println!("ChangeWorkerAddressExported {}", ChangeWorkerAddressExported);
    println!("ChangePeerIDExported {}", ChangePeerIDExported);
    println!("WithdrawBalanceExported {}", WithdrawBalanceExported);
    println!("ChangeMultiaddrsExported {}", ChangeMultiaddrsExported);
    println!("ConfirmChangeWorkerAddressExported {}", ConfirmChangeWorkerAddressExported);
    println!("RepayDebtExported {}", RepayDebtExported);
    println!("ChangeOwnerAddressExported {}", ChangeOwnerAddressExported);
    println!("ChangeBenificiaryExported {}", ChangeBenificiaryExported);
    println!("GetOwnerExported {}", GetOwnerExported);
    println!("IsControllingAddressExported {}", IsControllingAddressExported);
    println!("GetSectorSizeExported {}", GetSectorSizeExported);
    println!("GetAvailableBalanceExported {}", GetAvailableBalanceExported);
    println!("GetVestingFundsExported {}", GetVestingFundsExported);
    println!("GetPeerIDExported {}", GetPeerIDExported);
    println!("GetMultiaddrsExported {}", GetMultiaddrsExported);


    println!("POWER EXPORTED METHOD NUM");

    let CreateMinerExported = frc42_dispatch::method_hash!("CreateMiner");
    let NetworkRawPowerExported = frc42_dispatch::method_hash!("NetworkRawPower");
    let MinerRawPowerExported = frc42_dispatch::method_hash!("MinerRawPower");
    let MinerCountExported = frc42_dispatch::method_hash!("MinerCount");
    let MinerConsensusCountExported = frc42_dispatch::method_hash!("MinerConsensusCount");

    println!("CreateMinerExported {}", CreateMinerExported);
    println!("NetworkRawPowerExported {}", NetworkRawPowerExported);
    println!("MinerRawPowerExported {}", MinerRawPowerExported);
    println!("MinerCountExported {}", MinerCountExported);
    println!("MinerConsensusCountExported {}", MinerConsensusCountExported);


    println!("VERIFIED REGISTRY EXPORTED METHOD NUM");

    let AddVerifiedClientExported = frc42_dispatch::method_hash!("AddVerifiedClient");
    let RemoveExpiredAllocationsExported = frc42_dispatch::method_hash!("RemoveExpiredAllocations");
    let GetClaimsExported = frc42_dispatch::method_hash!("GetClaims");
    let ExtendClaimTermsExported = frc42_dispatch::method_hash!("ExtendClaimTerms");
    let RemoveExpiredClaimsExported = frc42_dispatch::method_hash!("RemoveExpiredClaims");
    let UniversalReceiverHook = frc42_dispatch::method_hash!("Receive");

    println!("AddVerifiedClientExported {}", AddVerifiedClientExported);
    println!("RemoveExpiredAllocationsExported {}", RemoveExpiredAllocationsExported);
    println!("GetClaimsExported {}", GetClaimsExported);
    println!("ExtendClaimTermsExported {}", ExtendClaimTermsExported);
    println!("RemoveExpiredClaimsExported {}", RemoveExpiredClaimsExported);
    println!("UniversalReceiverHook {}", UniversalReceiverHook);
}
