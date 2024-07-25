contract MoonCatRescue {
function cancelAdoptionOffer(bytes5 catId) onlyCatOwner(catId) {
    adoptionOffers[catId] = AdoptionOffer(false, catId, 0x0, 0, 0x0);
    AdoptionOfferCancelled(catId);
  }
}