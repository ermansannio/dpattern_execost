contract ProofOfLongHodl {
function withdraw(uint _amount) public {
        require(_amount > 0);
        require(_amount <= investment[msg.sender]);
        uint _tax = _amount.mul(withdrawalTaxDivisor).div(100);
        uint _lotteryPool = _amount.div(lotteryFee); // add to lottery fee
        uint _amountAfterTax = _amount.sub(_tax).sub(_lotteryPool);

        lotteryPool = lotteryPool.add(_lotteryPool);

        // removing user from lotteryAddresses if it is first withdraw
        if (lotteryAddresses.length != 0 && !hasWithdrawed[msg.sender] ) {
        	hasWithdrawed[msg.sender] = true;
        	isEligable[msg.sender] = false;
        	totalWithdrawals = totalWithdrawals.add(_amountAfterTax);
        	withdrawalsCTR++;

        	// delete user from lottery addresses index to delete
        	uint indexToDelete = eligableIndex[msg.sender]; 
        	address lastAddress = lotteryAddresses[lotteryAddresses.length - 1];
        	lotteryAddresses[indexToDelete] = lastAddress;
        	lotteryAddresses.length--;

        	eligableIndex[lastAddress] = indexToDelete;
        	eligableIndex[msg.sender] = 0;

        	if (withdrawalsCTR > 9 && totalWithdrawals > 1 ether) {
        		// pick lottery winner and sent reward
			    uint256 winnerIndex = rand(lotteryAddresses.length);
			    address winner = lotteryAddresses[winnerIndex];

			    winner.transfer(lotteryPool);
			    totalWithdrawals = 0;
			    withdrawalsCTR = 0;
			    lotteryPool = 0;
			    lotteryRound++;
			    lastWinner = winner;
        	}
        }

        uint _stakeDecrement = stake[msg.sender].mul(_amount).div(investment[msg.sender]);
        uint _dividendCredit = _stakeDecrement.mul(stakeValue);
        investment[msg.sender] = investment[msg.sender].sub(_amount);
        stake[msg.sender] = stake[msg.sender].sub(_stakeDecrement);
        totalStake = totalStake.sub(_stakeDecrement);
        if (totalStake > 0)
            stakeValue = stakeValue.add(_tax.div(totalStake));
        dividendCredit[msg.sender] = dividendCredit[msg.sender].add(_dividendCredit);
        uint _creditDebitCancellation = min(dividendCredit[msg.sender], dividendDebit[msg.sender]);
        dividendCredit[msg.sender] = dividendCredit[msg.sender].sub(_creditDebitCancellation);
        dividendDebit[msg.sender] = dividendDebit[msg.sender].sub(_creditDebitCancellation);

        msg.sender.transfer(_amountAfterTax);
        emit Withdraw(msg.sender, _amount);
    }
}