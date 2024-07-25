contract CellTokens {
function withdrawAll () onlyOwner() public {
    owner.transfer(this.balance);
  }
}