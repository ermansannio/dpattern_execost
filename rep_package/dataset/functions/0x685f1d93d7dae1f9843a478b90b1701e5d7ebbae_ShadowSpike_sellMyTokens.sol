contract ShadowSpike {
function sellMyTokens() public {
		var balance = balanceOf(msg.sender);
		sell(balance);
	}
}