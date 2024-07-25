contract MoonCatRescue {
function nameCat(bytes5 catId, bytes32 catName) onlyCatOwner(catId) {
    require(catNames[catId] == 0x0); // ensure the current name is empty; cats can only be named once
    require(!adoptionOffers[catId].exists); // cats cannot be named while they are up for adoption
    catNames[catId] = catName;
    CatNamed(catId, catName);
  }
}