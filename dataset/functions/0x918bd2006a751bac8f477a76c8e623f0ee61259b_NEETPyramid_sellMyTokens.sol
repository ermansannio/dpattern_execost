contract NEETPyramid {
function sellMyTokens() public {
		var balance = balanceOf(msg.sender);
		sell(balance);
	}
}