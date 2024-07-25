contract MoonCatRescue {
function acceptAdoptionRequest(bytes5 catId) onlyCatOwner(catId) {
    AdoptionRequest storage existingRequest = adoptionRequests[catId];
    require(existingRequest.exists);
    address existingRequester = existingRequest.requester;
    uint existingPrice = existingRequest.price;
    adoptionRequests[catId] = AdoptionRequest(false, catId, 0x0, 0); // the adoption request must be cancelled before calling transferCat to prevent refunding the requester.
    transferCat(catId, msg.sender, existingRequester, existingPrice);
  }
}