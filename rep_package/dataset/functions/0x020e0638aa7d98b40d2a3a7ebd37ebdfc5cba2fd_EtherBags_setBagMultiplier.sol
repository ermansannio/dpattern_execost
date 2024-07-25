contract EtherBags {
function setBagMultiplier(uint256 bagId, uint256 multiplier) public onlyContractOwner {
    Bag storage bag = bags[bagId];
    bag.multiplier = multiplier;
  }
}