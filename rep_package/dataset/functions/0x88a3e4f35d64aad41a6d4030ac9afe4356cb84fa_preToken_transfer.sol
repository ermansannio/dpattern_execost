contract preToken {
function transfer(address _to, uint256 _value) public onlyPayloadSize(2 * 32) tradable returns (bool success) {
    require(_to != address(0));
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }
}