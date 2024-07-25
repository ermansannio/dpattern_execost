contract Giveaway {
function kill() public {
        require(msg.sender == owner);
	    selfdestruct(msg.sender);
	}
}