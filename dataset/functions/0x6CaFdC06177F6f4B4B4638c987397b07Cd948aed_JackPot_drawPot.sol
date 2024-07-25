contract JackPot {
function drawPot(string seed, string newSeed) {
		if(msg.sender != host) throw;
		if (sha3(seed) == seedHash) {
			
			// Initialize seedHash for next draw
			seedHash = sha3(newSeed);
			// Choose a winner using the seed as random
			uint winner_index = selectWinner(seed);

			// Send the developer a 1% fee
			host.send(this.balance / 100);
			
			uint amountWon = this.balance; 
			
			// Send the winner the remaining balance on the contract.
			contributors[winner_index].send(this.balance);
			
			// Make a note that someone won, then start all over!
			recordWin(winner_index, amountWon);

			reset();
			nextDraw = now + 7 days;	

		}
	}
}