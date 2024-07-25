contract pyramidMKII {
function withdraw() public {
		require(balances[msg.sender].ebalance > 0, "not enough divs claimed");
        uint256 sval = balances[msg.sender].ebalance;
        balances[msg.sender].ebalance = 0;
        msg.sender.transfer(sval);
        emit event_withdraw(msg.sender, sval);
	}
}