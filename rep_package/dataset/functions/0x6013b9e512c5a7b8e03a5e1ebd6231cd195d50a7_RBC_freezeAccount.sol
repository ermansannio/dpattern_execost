contract RBC {
function freezeAccount(uint256 _value) onlyOwner returns (bool success) {
        if (balanceOf[msg.sender] < _value) throw;            // Check if the sender has enough
		if (_value <= 0) throw; 
        balanceOf[msg.sender] -= _value;                      // Subtract from the sender
        frozenAccount[msg.sender] += _value;                  // Updates totalSupply
        FrozenFunds(msg.sender, _value);
        return true;
    }
}