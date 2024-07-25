contract TestPausedToken {
function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {
    if (_to == address(0)) {
      return false;
    }
    if (_value > balances[msg.sender]) {
      return false;
    }
    
    balances[msg.sender] = balances[msg.sender] - _value;
    balances[_to] = balances[_to] + _value;
    Transfer(msg.sender, _to, _value);
    return true;
  }
}