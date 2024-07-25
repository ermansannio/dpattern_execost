contract InterbetCore {
function takeBet(uint makerBetId, address maker, uint odds, uint takerBetId) external payable {
        require(msg.sender != maker);

        require(msg.value > 0);

        MakerBet storage makerBet = makerBets[makerBetId][maker];
        require(makerBet.makerBetId != 0);

        require(msg.sender != makerBet.trustedVerifier.addr);

        require(now < makerBet.expiry);

        require(makerBet.status == BetStatus.Open);

        require(makerBet.odds == odds);

        // Avoid too many taker-bets in one maker-bet
        require(makerBet.takerBetsCount < maxAllowedTakerBetsPerMakerBet);

        // Avoid too many tiny bets
        uint minAllowedStake = mul(mul(makerBet.totalFund, (10 ** oddsDecimals)), minAllowedStakeInPercentage) / sub(odds, (10 ** oddsDecimals)) / 100;
        uint maxAvailableStake = mul(sub(makerBet.totalFund, makerBet.reservedFund), (10 ** oddsDecimals)) / sub(odds, (10 ** oddsDecimals));
        if (maxAvailableStake >= minAllowedStake) {
            require(msg.value >= minAllowedStake);
        } else {
            require(msg.value >= sub(maxAvailableStake, (maxAvailableStake / 10)) && msg.value <= maxAvailableStake);
        }

        // If remaining fund is not enough, send the money back.
        require(msg.value <= maxAvailableStake);

        makerBet.takerBets.length++;
        makerBet.takerBets[makerBet.takerBetsCount] = TakerBet(takerBetId, msg.sender, odds, msg.value, false);
        makerBet.reservedFund = add(makerBet.reservedFund, mul(msg.value, sub(odds, (10 ** oddsDecimals))) / (10 ** oddsDecimals));   
        makerBet.totalStake = add(makerBet.totalStake, msg.value);
        makerBet.takerBetsCount++;

        emit LogTakeBet(makerBetId, maker, takerBetId, msg.sender);
    }
}