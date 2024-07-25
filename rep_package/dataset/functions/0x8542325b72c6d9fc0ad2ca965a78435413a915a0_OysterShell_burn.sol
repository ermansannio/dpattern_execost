contract OysterShell {
function burn(uint256 _value) public returns (bool success) {
        // Locked addresses cannot be burnt
        require(locked[msg.sender] == 0);
        
        // Check if the sender has enough
        require(balances[msg.sender] >= _value);
        
        // Subtract from the sender
        balances[msg.sender] -= _value;
        
        // Updates totalSupply
        totalSupply -= _value;
        Burn(msg.sender, _value);
        return true;
    }
}