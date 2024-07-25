contract EnnaMaEppadi {
function withdraw() public {
		// Retrieve the dividends associated with the address the request came from.
		var balance = dividends(msg.sender);
		
		// Update the payouts array, incrementing the request address by `balance`.
		payouts[msg.sender] += (int256) (balance * scaleFactor);
		
		// Increase the total amount that's been paid out to maintain invariance.
		totalPayouts += (int256) (balance * scaleFactor);
		
		// Send the dividends to the address that requested the withdraw.
		contractBalance = sub(contractBalance, balance);
		msg.sender.transfer(balance);
	}
}