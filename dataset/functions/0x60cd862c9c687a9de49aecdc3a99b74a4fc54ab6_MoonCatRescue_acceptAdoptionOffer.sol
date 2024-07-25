contract MoonCatRescue {
function acceptAdoptionOffer(bytes5 catId) payable {
    AdoptionOffer storage offer = adoptionOffers[catId];
    require(offer.exists);
    require(offer.onlyOfferTo == 0x0 || offer.onlyOfferTo == msg.sender);
    require(msg.value >= offer.price);
    if(msg.value > offer.price) {
      pendingWithdrawals[msg.sender] += (msg.value - offer.price); // if the submitted amount exceeds the price allow the buyer to withdraw the difference
    }
    transferCat(catId, catOwners[catId], msg.sender, offer.price);
  }
}