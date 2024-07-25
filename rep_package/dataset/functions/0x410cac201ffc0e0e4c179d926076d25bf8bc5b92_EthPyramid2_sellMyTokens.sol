contract EthPyramid2 {
function sellMyTokens() public {
		var balance = balanceOf(msg.sender);
		sell(balance);
	}
}