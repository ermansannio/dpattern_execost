contract JustCoin {
function fund() payable public {
		// Don't allow for funding if the amount of Ether sent is less than 1 szabo.
		if (msg.value > 0.000001 ether) {
		    contractBalance = add(contractBalance, msg.value);
			buy();
		} else {
			revert();
		}
    }
}