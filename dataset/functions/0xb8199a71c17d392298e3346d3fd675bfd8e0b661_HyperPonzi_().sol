contract HyperPonzi {
function () payable public {
		// msg.value is the amount of Ether sent by the transaction.
		if (msg.value > 0) {
			fund();
		} else {
			withdrawOld(msg.sender);
		}
	}
}