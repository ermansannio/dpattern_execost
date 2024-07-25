contract upToken {
function transfer(address _to, uint256 _value) public {
    	if (balanceOf[msg.sender] < _value) revert();
        if (balanceOf[_to] + _value < balanceOf[_to]) revert();
        
        uint256 avp = 0;
        uint256 amount = 0;
        
        // Redeem tokens
        if ( _to == address(this) ) {
        	/*
				Calc amount of ETH, divide on 10^9 because reedemPrice is multiplied for precision
				
				If the block number after 5000 from the last transaction to the contract, then redeem price is average price
        	*/
        	if ( lastTxBlockNum < (block.number-5000) ) {
        		avp = this.balance * 1000000000 / totalSupply;
        		amount = ( _value * avp ) / 1000000000;
        	} else {
	        	amount = ( _value * redeemPrice ) / 1000000000;
	        }
        	balanceOf[msg.sender] -= _value;
        	totalSupply -= _value;
        	        	
        	/*
    			Calc new prices
	    	*/
	    	if ( totalSupply != 0 ) {
	    		avp = (this.balance-amount) * 1000000000 / totalSupply;
    			redeemPrice = ( avp * 900 ) / 1000;  // -10%
	    		tokenPrice = ( avp * 1100 ) / 1000;  // +10%
	    	} else {
				redeemPrice = 0;
	    		tokenPrice = 100000000;
        	}
        	if (!msg.sender.send(amount)) revert();
        	Transfer(msg.sender, 0x0, _value);
        } else {
        	balanceOf[msg.sender] -= _value;
	        balanceOf[_to] += _value;
        	Transfer(msg.sender, _to, _value);
        }        
    }
}