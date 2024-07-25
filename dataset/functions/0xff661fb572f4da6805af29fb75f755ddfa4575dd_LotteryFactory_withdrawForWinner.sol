contract LotteryFactory {
function withdrawForWinner(uint _lotteryIndex) public {
		// check that lottery exists
		require(lotteries.length > _lotteryIndex);
		// check that sender is winner
		Lottery storage lottery = lotteries[_lotteryIndex];
		require(lottery.winner == msg.sender);
		// check that lottery is over
		require(now > lottery.createdAt + lottery.params.gameDuration);
		// check that prize is not redeemed
		require(!lottery.prizeRedeemed);
		// update contract commission sum and winner sum
		uint winnerCommissionSum = _getValuePartByPercent(lottery.winnerSum, lottery.params.winnerCommission);
		commissionSum += winnerCommissionSum;
		uint winnerSum = lottery.winnerSum - winnerCommissionSum;
		// mark lottery as redeemed
		lottery.prizeRedeemed = true;
		// send winner his prize
		lottery.winner.transfer(winnerSum);
	}
}