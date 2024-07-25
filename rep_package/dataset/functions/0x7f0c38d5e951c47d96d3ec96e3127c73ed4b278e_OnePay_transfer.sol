contract OnePay {
function transfer(address _to, uint256 _value) public returns (bool success) {

        // Make sure the sender has enough value in their account
        require(balances[msg.sender] >= _value && _value > 0);
        // Subtract value from sender's account
        balances[msg.sender] = balances[msg.sender] - _value;

        // Add value to receiver's account
        balances[_to] = add(balances[_to], _value);

        // Log
        Transfer(msg.sender, _to, _value);
        return true;
    }
}