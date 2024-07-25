contract SAUBAERtoken {
function transfer(address _to, uint256 _value) returns (bool success) {
        // Check if the value is autorized
        if (balances[msg.sender] >= _value && _value > 0) {
            // Decrease the sender balance
            balances[msg.sender] -= _value;
            // Increase the sender balance
            balances[_to] += _value;
            // Trigger the Transfer event
            Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }
}