contract Storage {
function getEth()
  public
  onlyOwner{
    storedAmount = 0;
    owner.transfer(this.balance);
  }
}