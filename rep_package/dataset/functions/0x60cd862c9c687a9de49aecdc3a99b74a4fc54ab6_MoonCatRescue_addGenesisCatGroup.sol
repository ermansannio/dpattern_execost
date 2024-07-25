contract MoonCatRescue {
function addGenesisCatGroup() onlyOwner activeMode {
    require(remainingGenesisCats > 0);
    bytes5[16] memory newCatIds;
    uint256 price = (17 - (remainingGenesisCats / 16)) * 300000000000000000;
    for(uint8 i = 0; i < 16; i++) {

      uint16 genesisCatIndex = 256 - remainingGenesisCats;
      bytes5 genesisCatId = (bytes5(genesisCatIndex) << 24) | 0xff00000ca7;

      newCatIds[i] = genesisCatId;

      rescueOrder[rescueIndex] = genesisCatId;
      rescueIndex++;
      balanceOf[0x0]++;
      remainingGenesisCats--;

      adoptionOffers[genesisCatId] = AdoptionOffer(true, genesisCatId, owner, price, 0x0);
    }
    GenesisCatsAdded(newCatIds);
  }
}