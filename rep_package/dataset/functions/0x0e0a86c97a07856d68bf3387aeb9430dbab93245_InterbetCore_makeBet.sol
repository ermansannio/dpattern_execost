contract InterbetCore {
function makeBet(uint makerBetId, uint odds, address trustedVerifier, uint trustedVerifierFeeRate, uint trustedVerifierBaseFee, uint expiry) external payable {
        require(odds > (10 ** oddsDecimals) && odds < ((10 ** 8) * (10 ** oddsDecimals)));
        require(expiry > now);

        MakerBet storage makerBet = makerBets[makerBetId][msg.sender];

        require(makerBet.makerBetId == 0);

        Verifier memory verifier = verifiers[trustedVerifier];

        require(verifier.addr != address(0x0));
        require(trustedVerifierFeeRate == verifier.feeRate);
        require(trustedVerifierBaseFee == verifier.baseFee);

        uint fund = sub(msg.value, trustedVerifierBaseFee);
        require(fund >= minMakerBetFund);

        makerBet.makerBetId = makerBetId;
        makerBet.maker = msg.sender;
        makerBet.odds = odds;
        makerBet.totalFund = fund;
        makerBet.trustedVerifier = Verifier(verifier.addr, verifier.feeRate, verifier.baseFee);
        makerBet.expiry = expiry;
        makerBet.status = BetStatus.Open;
        makerBet.reservedFund = 0;
        makerBet.takerBetsCount = 0;
        makerBet.totalStake = 0;

        makerBetsCount++;

        emit LogMakeBet(makerBetId, msg.sender);
    }
}