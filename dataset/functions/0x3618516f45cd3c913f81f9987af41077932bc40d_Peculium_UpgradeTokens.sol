contract Peculium {
function UpgradeTokens() public
	{
	// Use this function to swap your old peculium against new ones (the new ones don't need defrost to be transfered)
	// Old peculium are burned
		require(peculOld.totalSupply()>0);
		uint256 amountChanged = peculOld.allowance(msg.sender,address(this));
		require(amountChanged>0);
		peculOld.transferFrom(msg.sender,address(this),amountChanged);
		peculOld.burn(amountChanged);

		balances[address(this)] = balances[address(this)].sub(amountChanged);
    		balances[msg.sender] = balances[msg.sender].add(amountChanged);
		Transfer(address(this), msg.sender, amountChanged);
		ChangedTokens(msg.sender,amountChanged);
		
	}
}