contract EtherAuction {
function finalizeAuction() public {
    require (now > auctionEndTime);
    require (!auctionFinalized);
    auctionFinalized = true;

    if(highestBidder == address(0)){
      //If no one bid at the auction, auctioneer can withdraw the funds.
      balances[auctioneer] = auctionedEth;
    }else{
      // Second highest bidder gets nothing, his latest bid is lost and sent to the auctioneer
      balances[secondHighestBidder] -= secondHighestBid;
      balances[auctioneer] += secondHighestBid;

      //Auctioneer gets the highest bid from the highest bidder.
      balances[highestBidder] -= highestBid;
      balances[auctioneer] += highestBid;

      //winner gets the 1eth being auctioned.
      balances[highestBidder] += auctionedEth;
      auctionedEth = 0;
    }

    E_AuctionFinished(highestBidder,highestBid,secondHighestBidder,secondHighestBid,auctionEndTime);

  }
}