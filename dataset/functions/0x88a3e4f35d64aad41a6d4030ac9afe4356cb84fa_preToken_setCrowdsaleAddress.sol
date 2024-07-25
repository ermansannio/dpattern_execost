contract preToken {
function setCrowdsaleAddress(address newCrowdsaleAddress) public onlyOwner {
    require(newCrowdsaleAddress != address(0));
    crowdsaleAddress = newCrowdsaleAddress;
  }
}