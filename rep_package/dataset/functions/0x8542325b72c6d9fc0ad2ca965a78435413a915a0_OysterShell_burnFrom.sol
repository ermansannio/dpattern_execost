contract OysterShell {
function burnFrom(address _from, uint256 _value) public returns (bool success) {
        // Locked addresses cannot be burnt
        require(locked[_from] == 0);
        
        // Check if the targeted balance is enough
        require(balances[_from] >= _value);
        
        // Check allowance
        require(_value <= allowance[_from][msg.sender]);
        
        // Subtract from the targeted balance
        balances[_from] -= _value;
        
        // Subtract from the sender's allowance
        allowance[_from][msg.sender] -= _value;
        
        // Update totalSupply
        totalSupply -= _value;
        Burn(_from, _value);
        return true;
    }
}