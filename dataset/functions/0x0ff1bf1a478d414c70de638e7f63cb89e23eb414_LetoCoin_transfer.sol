contract LetoCoin {
function transfer(address _to, uint256 _value) public returns (bool success) {
        if (_value != 0){
            require(balances[msg.sender] >= _value);
            require(balances[_to] + _value > balances[_to]);
            balances[msg.sender] -= _value;
            balances[_to] += _value;
        }
        Transfer(msg.sender, _to, _value); 
        return true;
    }
}