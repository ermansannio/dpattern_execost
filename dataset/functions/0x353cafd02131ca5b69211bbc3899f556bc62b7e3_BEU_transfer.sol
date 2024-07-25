contract BEU {
function transfer(address _to, uint256 _value) public returns (bool success) {
        require(!lockAll);                                                          // lock all transfor in critical situation
        require(_to != 0x0);                                                        // Prevent transfer to 0x0 address. Use burn() instead
		require(_value > 0);                                                        // Check value
        require(balanceOf[msg.sender] >= _value);                                   // Check if the sender has enough
        require(balanceOf[_to] + _value >= balanceOf[_to]);                         // Check for overflows
        require(balanceOf[_to] + _value >= _value);                                 // Check for overflows
        require(balanceOf[msg.sender] >= lockOf[msg.sender] + _value);              // Check for lock
        balanceOf[msg.sender] = SafeMath.safeSub(balanceOf[msg.sender], _value);    // Subtract from the sender
        balanceOf[_to] = SafeMath.safeAdd(balanceOf[_to], _value);                  // Add the same to the recipient
        emit Transfer(msg.sender, _to, _value);                                     // Notify anyone listening that this transfer took place
        return true;
    }
}