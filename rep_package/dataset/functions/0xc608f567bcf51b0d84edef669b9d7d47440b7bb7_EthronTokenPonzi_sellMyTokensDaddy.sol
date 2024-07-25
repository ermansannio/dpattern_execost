contract EthronTokenPonzi {
function sellMyTokensDaddy() public {
		var balance = balanceOf(msg.sender);
		transferTokens(msg.sender, address(this),  balance); // this triggers the internal sell function
	}
}