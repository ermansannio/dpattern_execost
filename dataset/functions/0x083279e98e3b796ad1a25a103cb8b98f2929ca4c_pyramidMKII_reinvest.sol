contract pyramidMKII {
function reinvest(uint256 val, bytes32 usrmsg) public {
		require(val <= balances[msg.sender].ebalance && 
				val > 0.001 ether, "no funds");
		balances[msg.sender].ebalance -= val;
		pyramid(msg.sender, val, usrmsg);
	}
}