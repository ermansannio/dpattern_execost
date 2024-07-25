contract LotteryFactory {
function approveToSell(uint _tokenCount) public {
		Lottery storage lottery = lotteries[lotteryCount - 1];
		// check that user has enough tokens to sell
		require(lottery.ownerTokenCount[msg.sender] - lottery.ownerTokenCountToSell[msg.sender] >= _tokenCount);
		// if there are no sales or this is user's first sale
		if(lottery.sellingAddresses.length == 0 || lottery.sellerId[msg.sender] == 0 && lottery.sellingAddresses[0] != msg.sender) {
			uint sellingAddressesCount = lottery.sellingAddresses.push(msg.sender);
			uint sellingAmountsCount = lottery.sellingAmounts.push(_tokenCount);
			assert(sellingAddressesCount == sellingAmountsCount);
			lottery.sellerId[msg.sender] = sellingAddressesCount - 1;
		} else {
			// seller exists and placed at least 1 sale
			uint sellerIndex = lottery.sellerId[msg.sender];
			lottery.sellingAmounts[sellerIndex] += _tokenCount;
		}
		// update global lottery variables
		lottery.ownerTokenCountToSell[msg.sender] += _tokenCount;
		lottery.tokenCountToSell += _tokenCount;
	}
}