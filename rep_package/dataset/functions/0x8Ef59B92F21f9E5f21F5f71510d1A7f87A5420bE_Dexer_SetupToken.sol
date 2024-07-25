contract Dexer {
function SetupToken(string tokenName, string tokenSymbol, uint256 tokenSupply)
	{
		if (msg.sender == owner && setupDone == false)
		{
			symbol = tokenSymbol;
			name = tokenName;
			_totalSupply = tokenSupply * 100;
			balances[owner] = _totalSupply;
			setupDone = true;
		}
	}
}