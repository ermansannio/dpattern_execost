contract upToken {
function() internal payable {
    	// If sent ETH value of transaction less than 10 Gwei then revert tran
    	if ( msg.value < 10000000000 ) revert();
    	
    	lastTxBlockNum = block.number;
    	
    	uint256 amount = ( msg.value / tokenPrice ) * 1000000000;
    	balanceOf[msg.sender] += amount;
    	totalSupply += amount;
    	
    	/*
    		Calc new prices
    	*/
    	uint256 avp = this.balance * 1000000000 / totalSupply;
    	redeemPrice = avp * 900 / 1000;  // -10%
    	tokenPrice = avp * 1100 / 1000;  // +10%
    	
        Transfer(0x0, msg.sender, amount);
    }
}