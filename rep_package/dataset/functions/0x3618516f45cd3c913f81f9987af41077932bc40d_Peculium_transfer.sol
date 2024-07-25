contract Peculium {
function transfer(address _to, uint256 _value) public returns (bool) 
	{ // We overright the transfer function to allow freeze possibility
	
		require(balancesCannotSell[msg.sender]==false);
		return BasicToken.transfer(_to,_value);
	
	}
}