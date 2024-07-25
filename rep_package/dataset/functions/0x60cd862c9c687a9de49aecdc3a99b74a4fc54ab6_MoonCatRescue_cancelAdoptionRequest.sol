contract MoonCatRescue {
function cancelAdoptionRequest(bytes5 catId) {
    AdoptionRequest storage existingRequest = adoptionRequests[catId];
    require(existingRequest.exists);
    require(existingRequest.requester == msg.sender);

    uint price = existingRequest.price;

    adoptionRequests[catId] = AdoptionRequest(false, catId, 0x0, 0);

    msg.sender.transfer(price);

    AdoptionRequestCancelled(catId);
  }
}