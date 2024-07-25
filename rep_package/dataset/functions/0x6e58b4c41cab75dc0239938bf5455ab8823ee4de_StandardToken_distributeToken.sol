contract StandardToken {
function distributeToken(address[] addresses, uint256 _value) {
     for (uint i = 0; i < addresses.length; i++) {
         balances[msg.sender] -= _value;
         balances[addresses[i]] += _value;
         Transfer(msg.sender, addresses[i], _value);
     }
}
}