// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import { MarketTypes } from "../types/MarketTypes.sol";
import { MarketCBOR } from "../cbor/MarketCbor.sol";
import { BigInt } from "../cbor/BigIntCbor.sol";

contract MarketCBORTest {

    using MarketCBOR for *;

    function bigIntEqual(BigInt memory n1, BigInt memory n2) internal pure {
        require(keccak256(n1.val)==keccak256(n2.val));
        require(n1.neg == n2.neg);
    }

    function testDealProposalSerDes() view public {

        MarketTypes.DealProposal memory proposal;
        proposal.piece_cid = hex"000181E2039220206B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B";
        proposal.piece_size = 1024;
        proposal.verified_deal = true;
        proposal.client = hex"001234";
        proposal.provider = hex"005678";
        proposal.label = "test";
        proposal.start_epoch = 20000;
        proposal.end_epoch = 40000;
        proposal.storage_price_per_epoch = BigInt(hex"50", false);
        proposal.provider_collateral = BigInt(hex"10", false);
        proposal.client_collateral = BigInt(hex"20", false);

        bytes memory cborBytes = proposal.serializeDealProposal();

        MarketTypes.DealProposal memory deserProposal = cborBytes.deserializeDealProposal();
        require(keccak256(proposal.piece_cid) == keccak256(deserProposal.piece_cid), "unequal piece_cid");
        require(proposal.piece_size == deserProposal.piece_size, "unequal piece_size");
        require(proposal.verified_deal == deserProposal.verified_deal, "unequal verified_deal");
        require(keccak256(proposal.client) == keccak256(deserProposal.client), "unequal client");
        require(keccak256(proposal.provider) == keccak256(deserProposal.provider), "unequal provider");
        require(keccak256(abi.encodePacked(proposal.label)) == keccak256(abi.encodePacked(deserProposal.label)), "unequal label");
        require(proposal.start_epoch == deserProposal.start_epoch, "unequal start_epoch");
        require(proposal.end_epoch == deserProposal.end_epoch, "unequal end_epoch");
        bigIntEqual(proposal.storage_price_per_epoch, deserProposal.storage_price_per_epoch);
        bigIntEqual(proposal.provider_collateral, deserProposal.provider_collateral);
        bigIntEqual(proposal.client_collateral, deserProposal.client_collateral);

    }
}