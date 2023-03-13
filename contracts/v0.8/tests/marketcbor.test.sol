// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {MarketTypes} from "../types/MarketTypes.sol";
import {CommonTypes} from "../types/CommonTypes.sol";
import {MarketCBOR} from "../cbor/MarketCbor.sol";
import {BigIntCBOR} from "../cbor/BigIntCbor.sol";
import "../utils/FilAddresses.sol";

contract MarketCBORTest {
    using MarketCBOR for *;

    function bigIntEqual(CommonTypes.BigInt memory n1, CommonTypes.BigInt memory n2) internal pure {
        require(keccak256(n1.val) == keccak256(n2.val));
        require(n1.neg == n2.neg);
    }

    function testDealProposalSerDes() public view {
        MarketTypes.DealProposal memory proposal;
        proposal.piece_cid = CommonTypes.Cid(hex"000181E2039220206B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B");
        proposal.piece_size = 1024;
        proposal.verified_deal = true;
        proposal.client = FilAddresses.fromBytes(hex"001234");
        proposal.provider = FilAddresses.fromBytes(hex"005678");
        proposal.label = CommonTypes.DealLabel(bytes("test"), true);
        proposal.start_epoch = CommonTypes.ChainEpoch.wrap(20000);
        proposal.end_epoch = CommonTypes.ChainEpoch.wrap(40000);
        proposal.storage_price_per_epoch = CommonTypes.BigInt(hex"50", false);
        proposal.provider_collateral = CommonTypes.BigInt(hex"10", false);
        proposal.client_collateral = CommonTypes.BigInt(hex"20", false);

        bytes memory cborBytes = proposal.serializeDealProposal();

        MarketTypes.DealProposal memory deserProposal = cborBytes.deserializeDealProposal();
        require(keccak256(proposal.piece_cid.data) == keccak256(deserProposal.piece_cid.data), "unequal piece_cid");
        require(proposal.piece_size == deserProposal.piece_size, "unequal piece_size");
        require(proposal.verified_deal == deserProposal.verified_deal, "unequal verified_deal");
        require(keccak256(proposal.client.data) == keccak256(deserProposal.client.data), "unequal client");
        require(keccak256(proposal.provider.data) == keccak256(deserProposal.provider.data), "unequal provider");
        require(keccak256(abi.encodePacked(proposal.label.data)) == keccak256(abi.encodePacked(deserProposal.label.data)), "unequal label");
        require(proposal.label.isString == deserProposal.label.isString, "unequal label type");
        require(CommonTypes.ChainEpoch.unwrap(proposal.start_epoch) == CommonTypes.ChainEpoch.unwrap(deserProposal.start_epoch), "unequal start_epoch");
        require(CommonTypes.ChainEpoch.unwrap(proposal.end_epoch) == CommonTypes.ChainEpoch.unwrap(deserProposal.end_epoch), "unequal end_epoch");
        bigIntEqual(proposal.storage_price_per_epoch, deserProposal.storage_price_per_epoch);
        bigIntEqual(proposal.provider_collateral, deserProposal.provider_collateral);
        bigIntEqual(proposal.client_collateral, deserProposal.client_collateral);
    }
}
