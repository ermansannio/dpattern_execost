contract SuperCountriesEth {
function confirmDividendsFromPot() public {
		require(richestBuyer != address(0) && lastBuyer != address(0)) ;
		require(address(this).balance > 100000000);	/// mini 1e8 wei
		require(block.timestamp > timestampLimit);
		
		uint256 confirmation_TimeStamp = timestampLimit;
		potVersion ++;
		uint256 balance = address(this).balance;
		uint256 balanceQuarter = balance.div(4);
		dividendsScore = 0; /// reset dividends
		updateTimestampLimit(); /// Reset the timer, if no new buys, the richest and the last buyers will be able to withdraw the left quarter in a week or so
		balanceToWithdraw[potVersion][richestBuyer] = balanceQuarter;
		balanceToWithdraw[potVersion][lastBuyer] += balanceQuarter; /// if the richest = last, dividends cumulate
		
		
		// fire events
        emit ConfirmPotWithdraw(	
			 balance, 
			 richestBuyer, 
			 balanceToWithdraw[potVersion][richestBuyer],
			 lastBuyer,
			 balanceToWithdraw[potVersion][lastBuyer],
			 potVersion
		);
		
		emit PotWithdrawConstant(	
			 block.timestamp,
			 confirmation_TimeStamp,
			 dividendsScore,
			 potVersion,
			 lastWithdrawPotVersion
		);
		
	}
}