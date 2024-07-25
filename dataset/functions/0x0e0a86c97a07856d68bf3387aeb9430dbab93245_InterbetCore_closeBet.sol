contract InterbetCore {
function closeBet(uint makerBetId) external {
        MakerBet storage makerBet = makerBets[makerBetId][msg.sender];
        require(makerBet.makerBetId != 0);

        require(makerBet.status == BetStatus.Open || makerBet.status == BetStatus.Paused);

        require(msg.sender == makerBet.maker);

        makerBet.status = BetStatus.Closed;

        // refund unused fund to maker
        uint unusedFund = sub(makerBet.totalFund, makerBet.reservedFund);

        if (unusedFund > 0) {
            makerBet.totalFund = makerBet.reservedFund;

            uint refundAmount = unusedFund;
            if (makerBet.totalStake == 0) {
                refundAmount = add(refundAmount, makerBet.trustedVerifier.baseFee); // Refund base verifier fee too if no taker-bets, because verifier do not need to settle the bet with no takers
                makerBet.makerFundWithdrawn = true;
            }

            if (!makerBet.maker.send(refundAmount)) {
                makerBet.totalFund = add(makerBet.totalFund, unusedFund);
                makerBet.status = BetStatus.Paused;
                makerBet.makerFundWithdrawn = false;
            } else {
                emit LogCloseBet(makerBetId, msg.sender);
            }
        } else {
            emit LogCloseBet(makerBetId, msg.sender);
        }
    }
}