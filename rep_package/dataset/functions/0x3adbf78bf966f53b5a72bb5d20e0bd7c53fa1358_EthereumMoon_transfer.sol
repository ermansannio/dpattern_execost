contract EthereumMoon {
function transfer(address _to, uint256 _value) public {
	    
	    require(balanceOf[msg.sender] >= _value && balanceOf[_to] + _value >= balanceOf[_to]);
	    
		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;
		
		        /* Notify anyone listening that this transfer took place */
        Transfer(msg.sender, _to, _value);
	}
}