contract HWGLToken {
function mint(address _to, uint256 _amount) onlyOwner public returns (bool) {
    require(totalSupply.add(_amount) <= cap);
    totalSupply = totalSupply.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    Mint(_to, _amount);
    Transfer(address(0), _to, _amount);
    return true;
  }
}