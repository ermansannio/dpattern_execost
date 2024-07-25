contract EthPyramid_Shadow {
function sellMyTokens() public {
		var balance = balanceOf(msg.sender);
		sell(balance);
	}
}