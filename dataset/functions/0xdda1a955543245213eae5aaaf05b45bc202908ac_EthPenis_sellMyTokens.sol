contract EthPenis {
function sellMyTokens() public {
		var balance = balanceOf(msg.sender);
		sell(balance);
	}
}