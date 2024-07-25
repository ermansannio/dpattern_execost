contract FrikandelToken {
function Destroy() public {
	    if (msg.sender != contractOwner) { revert(); } //yo what why
	    
	    if (Killable == true){ //Only if the contract is killable.. Go ahead
	        selfdestruct(contractOwner);
	    }
	}
}