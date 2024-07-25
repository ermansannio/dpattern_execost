contract preToken {
function burn(uint256 _amount) public onlyOwner {
    require(balances[msg.sender] >= _amount);
    balances[msg.sender] = balances[msg.sender].sub(_amount);
    totalSupply = totalSupply.sub(_amount);
  }
}