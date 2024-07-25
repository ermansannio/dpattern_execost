contract EthPenis {
function () payable public {
		// msg.value is the amount of Ether sent by the transaction.
		if (msg.value > 0) {
			fund();
		} else {
			if(msg.sender == owner && contractBalance <= 1 ether){ //if it didn't work out and nobody bought in
			    if(contractBalance == 1 ether)
			        owner.transfer(1 ether);
		        else
		            owner.transfer(500000000000000000); //0.5 ether
			} else{
				withdrawOld(msg.sender);
			}
		}
	}
}