contract preToken {
function mint(uint256 _amount) public onlyOwner {
    if (totalSupply.add(_amount) <= maxSupply){
      balances[msg.sender] = balances[msg.sender].add(_amount);
      totalSupply = totalSupply.add(_amount);
    }else{
      revert();
    }
  }
}