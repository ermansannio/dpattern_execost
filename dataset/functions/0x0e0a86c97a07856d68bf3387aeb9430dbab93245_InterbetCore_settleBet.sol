contract InterbetCore {
function settleBet(uint makerBetId, address maker, uint outcome) external {
        require(outcome == 1 || outcome == 2 || outcome == 3 || outcome == 4);

        MakerBet storage makerBet = makerBets[makerBetId][maker];
        require(makerBet.makerBetId != 0);

        require(msg.sender == makerBet.trustedVerifier.addr);

        require(makerBet.totalStake > 0);

        require(makerBet.status != BetStatus.Settled);

        BetOutcome betOutcome = BetOutcome(outcome);
        makerBet.outcome = betOutcome;
        makerBet.status = BetStatus.Settled;

        payMaker(makerBet);
        payVerifier(makerBet);

        emit LogSettleBet(makerBetId, maker);
    }
}