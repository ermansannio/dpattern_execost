contract InterbetCore {
function withdraw(uint makerBetId, address maker) external {
        MakerBet storage makerBet = makerBets[makerBetId][maker];
        require(makerBet.makerBetId != 0);

        require(makerBet.outcome != BetOutcome.NotSettled);

        require(makerBet.status == BetStatus.Settled);

        bool fullyWithdrawn = false;

        if (msg.sender == maker) {
            fullyWithdrawn = payMaker(makerBet);
        } else if (msg.sender == makerBet.trustedVerifier.addr) {
            fullyWithdrawn = payVerifier(makerBet);
        } else {
            fullyWithdrawn = payTaker(makerBet, msg.sender);
        }

        if (fullyWithdrawn) {
            emit LogWithdraw(makerBetId, maker, msg.sender);
        }
    }
}