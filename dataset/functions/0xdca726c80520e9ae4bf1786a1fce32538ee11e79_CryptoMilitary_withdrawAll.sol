contract CryptoMilitary {
function withdrawAll () onlyOwner() public {
    owner.transfer(this.balance);
  }
}