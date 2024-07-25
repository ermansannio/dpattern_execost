contract OCW {
function transfer(address _to, uint256 _value) public returns (bool) {
    require(_value + marked[msg.sender] <= balances[msg.sender]);
    require(_value <= balances[msg.sender]);
    require(_value != 0);
    require(_to != address(0));

    balances[msg.sender] = balances[msg.sender] - _value;
    balances[_to] = balances[_to] + _value;
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}