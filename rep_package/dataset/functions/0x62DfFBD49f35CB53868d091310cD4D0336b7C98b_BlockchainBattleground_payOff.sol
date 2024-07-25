contract BlockchainBattleground {
function payOff() public matchTimeOver {
	    // Anybody can call this and pay off the winners, after the match is over
	    Gladiator memory winnerGladiator;
	    uint winner;
	    if (currentMatch.left.totalAmount > currentMatch.right.totalAmount) {
		     winnerGladiator = currentMatch.left;
		     winner = 0;
	    }
	    else {
		    winnerGladiator = currentMatch.right;
		    winner = 1;
	    }
	    uint jackpot = (this.balance - winnerGladiator.totalAmount) * 96 / 100;
	    payWinningGladiator(winner, jackpot);
            // we get the remaining 4% of the losing team
	    owner.transfer(this.balance / 2); 
	    owner2.transfer(this.balance);

	    matchPaidOff = true;
    }
}