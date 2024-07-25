contract EtherAuction {
function bid() public payable {
    require(auctionStarted);
    require(now < auctionEndTime);
    require(msg.sender != auctioneer);
    require(highestBidder != msg.sender); //If sender is already the highest bidder, reject it.

    address _newBidder = msg.sender;

    uint previousBid = balances[_newBidder];
    uint _newBid = msg.value + previousBid;

    require (_newBid  == highestBid + (5 * 10 ** 16)); //Each bid has to be 0.05 eth higher

    // The highest bidder is now the second highest bidder
    secondHighestBid = highestBid;
    secondHighestBidder = highestBidder;

    highestBid = _newBid;
    highestBidder = _newBidder;

    latestBidTime = now;
    //Update the bidder's balance so they can later withdraw any pending balance
    balances[_newBidder] = _newBid;

    //If there's less than an hour remaining and someone bids, extend end time.
    if(auctionEndTime - now < 3600)
      auctionEndTime += 3600; // Each bid extends the auctionEndTime by 1 hour

    E_Bid(highestBidder, highestBid);

  }
}