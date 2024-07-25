contract MoonCatRescue {
function makeAdoptionOffer(bytes5 catId, uint price) onlyCatOwner(catId) {
    require(price > 0);
    adoptionOffers[catId] = AdoptionOffer(true, catId, msg.sender, price, 0x0);
    AdoptionOffered(catId, price, 0x0);
  }
}