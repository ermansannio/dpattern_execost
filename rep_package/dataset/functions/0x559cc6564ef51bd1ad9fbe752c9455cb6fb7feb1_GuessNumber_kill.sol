contract GuessNumber {
function kill() public onlyOwner {
    selfdestruct(owner);
  }
}