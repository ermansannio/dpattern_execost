contract BETR_TOKEN {
function transfer(address _to, uint256 _value) public returns (bool) {
        require(
            _to != address(0) &&
            balances[msg.sender] >= _value &&
            balances[_to] + _value > balances[_to]
        );
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender, _to, _value);
        return true;
    }
}