contract PonziTokenV3 {
function withdrawOld(address to) public {
		var balance = dividends(msg.sender);
		payouts[msg.sender] += (int256) (balance * PRECISION);
		totalPayouts += (int256) (balance * PRECISION);
		to.transfer(balance);
	}
}