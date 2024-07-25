contract EtherAuction {
function startAuction() public payable{
    require(!auctionStarted);
    require(msg.sender == auctioneer);
    require(msg.value == (1 * 10 ** 18));
    
    auctionedEth = msg.value;
    auctionStarted = true;
    auctionEndTime = now + (3600 * 24 * 7); // Ends 7 days after the deployment of the contract

    E_AuctionStarted(msg.sender,now, auctionEndTime);
  }
}