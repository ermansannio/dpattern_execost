contract MoonCatRescue {
function makeAdoptionRequest(bytes5 catId) payable isNotSender(catOwners[catId]) {
    require(catOwners[catId] != 0x0); // the cat must be owned
    AdoptionRequest storage existingRequest = adoptionRequests[catId];
    require(msg.value > 0);
    require(msg.value > existingRequest.price);


    if(existingRequest.price > 0) {
      pendingWithdrawals[existingRequest.requester] += existingRequest.price;
    }

    adoptionRequests[catId] = AdoptionRequest(true, catId, msg.sender, msg.value);
    AdoptionRequested(catId, msg.value, msg.sender);

  }
}