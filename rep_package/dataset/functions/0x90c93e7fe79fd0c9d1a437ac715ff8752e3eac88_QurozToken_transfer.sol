contract QurozToken {
function transfer(address _to, uint256 _value) public whenNotPaused returns (bool) {//BasicToken.sol, PausableToken.sol
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    require(locked[msg.sender] != true);                                                             // new
    require(locked[_to] != true);                                                                    // new
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}