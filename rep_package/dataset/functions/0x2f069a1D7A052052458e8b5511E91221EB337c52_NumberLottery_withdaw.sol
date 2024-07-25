contract NumberLottery {
function withdaw(uint256 _am) 
  public 
  onlyOwner 
  {
    owner.transfer(_am);
  }
}