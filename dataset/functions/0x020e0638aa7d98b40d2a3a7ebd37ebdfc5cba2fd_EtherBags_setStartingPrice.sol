contract EtherBags {
function setStartingPrice(uint256 _startingPrice) public onlyContractOwner {
    startingPrice = _startingPrice;
  }
}