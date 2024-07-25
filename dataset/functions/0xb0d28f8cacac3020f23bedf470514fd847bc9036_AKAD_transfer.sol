contract AKAD {
function transfer(address _to, uint256 _value) public returns (bool success) {
        if (balances[msg.sender] >= _value && _value > 0) {             // Check if the sender has enough
            balances[msg.sender] = balances[msg.sender].sub(_value);    // Safe decrease sender balance
            balances[_to] = balances[_to].add(_value);                  // Safe increase recipient balance
            emit Transfer(msg.sender, _to, _value);                     // Emit transfer event
            return true;
        } else {
            return false;
         }
    }
}