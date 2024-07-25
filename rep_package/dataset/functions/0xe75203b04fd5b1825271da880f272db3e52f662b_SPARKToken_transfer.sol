contract SPARKToken {
function transfer(address _to, uint256 _value) public returns (bool) {
        require(
            _balances[msg.sender] >= _value && 
            _value > 0);
        _balances[msg.sender] = _balances[msg.sender].sub(_value);
        _balances[_to] = _balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }
}