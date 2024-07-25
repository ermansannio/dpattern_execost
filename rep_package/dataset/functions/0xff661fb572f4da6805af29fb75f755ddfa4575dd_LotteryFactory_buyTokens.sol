contract LotteryFactory {
function buyTokens() public payable {
		if(_isNeededNewLottery()) _createNewLottery();
		// get latest lottery
		Lottery storage lottery = lotteries[lotteryCount - 1];
		// get token count to buy
		uint price = _getCurrentTokenPrice();
		uint tokenCountToBuy = msg.value / price;
		// any extra eth added to winner sum
		uint rest = msg.value - tokenCountToBuy * price;
		if( rest > 0 ){
		    lottery.winnerSum = lottery.winnerSum + rest;
		}
		// check that user wants to buy at least 1 token
		require(tokenCountToBuy > 0);
		// buy tokens from sellers
		uint tokenCountToBuyFromSeller = _getTokenCountToBuyFromSeller(tokenCountToBuy);
		if(tokenCountToBuyFromSeller > 0) {
		 	_buyTokensFromSeller(tokenCountToBuyFromSeller);
		}
		// buy tokens from system
		uint tokenCountToBuyFromSystem = tokenCountToBuy - tokenCountToBuyFromSeller;
		if(tokenCountToBuyFromSystem > 0) {
			_buyTokensFromSystem(tokenCountToBuyFromSystem);
		}
		// add sender to participants
		_addToParticipants(msg.sender);
		// update winner values
		lottery.winnerSum += tokenCountToBuyFromSystem * price;
		lottery.winner = _getWinner();
	}
}