contract QurozToken {
function multiTransfer(address[] _to, uint256[] _amount) whenNotPaused public returns (bool) {
    require(locked[msg.sender] != true);
    require(_to.length == _amount.length);
    uint256 i;
    uint256 amountSum = 0;
    for (i=0; i < _amount.length; i++){
      require(_amount[i] > 0);
      require(_to[i] != address(0));
      require(locked[_to[i]] != true);                                                            
      amountSum = amountSum.add(_amount[i]);
    }
    require(amountSum <= balances[msg.sender]);
    for (i=0; i < _to.length; i++){
      balances[_to[i]] = balances[_to[i]].add(_amount[i]);
      emit Transfer(msg.sender, _to[i], _amount[i]);
    }
    balances[msg.sender] = balances[msg.sender].sub(amountSum);
    return true;
  }
}