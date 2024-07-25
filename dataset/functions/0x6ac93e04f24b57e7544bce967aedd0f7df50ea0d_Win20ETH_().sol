contract Win20ETH {
function() public payable {
	    if( msg.sender != owner){
	        revert();
	    }
	    jackpot += msg.value;
	}
}