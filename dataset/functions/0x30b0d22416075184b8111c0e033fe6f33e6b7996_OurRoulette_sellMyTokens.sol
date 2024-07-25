contract OurRoulette {
function sellMyTokens() public {
		uint256 balance = balanceOf(msg.sender);
		sell(balance);
	}
}