contract CryptoBeautyVoting {
function startVoting() onlyOwner() public {
    votingStart = true;
  }
}