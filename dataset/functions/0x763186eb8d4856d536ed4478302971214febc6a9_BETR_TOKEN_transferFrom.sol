contract BETR_TOKEN {
function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require (
          _from != address(0) &&
          _to != address(0) &&
          balances[_from] >= _value &&
          allowed[_from][msg.sender] >= _value &&
          balances[_to] + _value > balances[_to]
        );
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        Transfer(_from, _to, _value);
        return true;
    }
}