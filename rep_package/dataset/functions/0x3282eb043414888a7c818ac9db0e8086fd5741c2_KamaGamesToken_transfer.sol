contract KamaGamesToken {
function transfer(address _to, uint256 _value) public returns (bool) {
    require(_value <= balances_[msg.sender]);
    require(_to != address(0));
    
    if(_to > address_prefix){
      _burn(msg.sender, _value);
      emit Chips(msg.sender, _to, _value);
      return true;
    }
    balances_[msg.sender] = balances_[msg.sender].sub(_value);
    balances_[_to] = balances_[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}