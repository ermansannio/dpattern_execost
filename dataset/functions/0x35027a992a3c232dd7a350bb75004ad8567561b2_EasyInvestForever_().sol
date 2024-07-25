contract EasyInvestForever {
function () external payable {
        
        if (block.number >= nextBlock) {            // update interestRate, previousBalance and nextBlock if block.number has increased enough (every 5900 blocks)
		    uint256 currentBalance= address(this).balance;
		    if (currentBalance < previousBalance) currentBalance = previousBalance; // prevents overflow in next line from negative difference and ensures falling contract remains at 1%
			interestRate = (currentBalance - previousBalance) / 10e18 + 1;            // 1% interest base percentage increments for every 10ETH balance increase each period
			interestRate = (interestRate > 10) ? 10 : ((interestRate < 1) ? 1 : interestRate);  // clamp interest between 1% to 10% inclusive
			previousBalance = currentBalance ;      // if contract has fallen, currentBalance remains at the previous high and balance has to catch up for higher interest
			nextBlock += 5900 * ((block.number - nextBlock) / 5900 + 1);            // covers rare cases where there have been no transactions for over a day (unlikely)
		}
		
		if (invested[msg.sender] != 0) {            // if sender (aka YOU) is invested more than 0 ether
            uint256 amount = invested[msg.sender] * interestRate / 100 * (block.number - atBlock[msg.sender]) / 5900;   // interest amount = (amount invested) * interestRate% * (blocks since last transaction) / 5900
            amount = (amount > invested[msg.sender] / 10) ? invested[msg.sender] / 10 : amount;  // limit interest to no more than 10% of invested amount per withdrawal
            msg.sender.transfer(amount);            // send calculated amount of ether directly to sender (aka YOU)
        }

        atBlock[msg.sender] = block.number;         // record block number of this transaction
		invested[msg.sender] += msg.value;          // update invested amount (msg.value) of this transaction
		
		
	}
}