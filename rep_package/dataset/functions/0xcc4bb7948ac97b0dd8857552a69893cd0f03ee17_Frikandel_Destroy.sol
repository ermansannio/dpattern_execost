contract Frikandel {
function Destroy() public {
	    if (msg.sender != creator) { revert(); } //yo what why
	    
	    if ((balances[creator] > 25000) && Killable == true){ //Only if the owner has more then 25k (indicating the airdrop was not finished yet) and the contract is killable.. Go ahead
	        selfdestruct(creator);
	    }
	}
}