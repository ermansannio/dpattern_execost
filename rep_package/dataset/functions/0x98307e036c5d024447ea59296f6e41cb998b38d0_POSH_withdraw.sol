contract POSH {
function withdraw(uint tokenCount) // the parameter is ignored, yes
      public
      returns (bool)
    {
		var balance = dividends(msg.sender);
		payouts[msg.sender] += (int256) (balance * PRECISION);
		totalPayouts += (int256) (balance * PRECISION);
		msg.sender.transfer(balance);
		return true;
    }
}