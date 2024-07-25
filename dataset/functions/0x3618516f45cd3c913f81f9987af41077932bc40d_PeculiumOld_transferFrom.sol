contract PeculiumOld {
function transferFrom(address _from, address _to, uint256 _value) public returns (bool) 
	{ // We overright the transferFrom function to allow freeze possibility (need to allow before)
	
		require(balancesCanSell[msg.sender]);	
		return StandardToken.transferFrom(_from,_to,_value);
	
	}
}