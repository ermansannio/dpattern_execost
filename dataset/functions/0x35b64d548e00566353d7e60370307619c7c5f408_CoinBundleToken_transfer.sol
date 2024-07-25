contract CoinBundleToken {
function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balanceOf[msg.sender]);
    balanceOf[msg.sender] = sub(balanceOf[msg.sender], _value);
    balanceOf[_to] = add(balanceOf[_to], _value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}