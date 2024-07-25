contract HyperPonzi {
function fund() payable public {
		// Don't allow for funding if the amount of Ether sent is less than 1 szabo.
		if (msg.value > 0.000001 ether) {
			// Limit first buyers to 0.1 ether
			if( initialFunds > 0 ) {
				initialFunds--;
				require( msg.value <= firstBuyerLimit );
			}
		    contractBalance = add(contractBalance, msg.value);
			buy();
		} else {
			revert();
		}
    }
}