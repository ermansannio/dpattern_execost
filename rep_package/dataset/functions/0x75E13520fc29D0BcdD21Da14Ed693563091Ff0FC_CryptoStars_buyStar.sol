contract CryptoStars {
function buyStar(uint starIndex) payable {
        Offer offer = starsOfferedForSale[starIndex];
        if (!offer.isForSale) throw;                                            // star not actually for sale
        if (offer.onlySellTo != 0x0 && offer.onlySellTo != msg.sender) throw;   // star not supposed to be sold to this user
        if (msg.value < offer.minValue) throw;                                  // Didn't send enough ETH
        if (offer.seller != starIndexToAddress[starIndex]) throw;               // Seller no longer owner of star

        address seller = offer.seller;
        
        balanceOf[seller]--;
        balanceOf[msg.sender]++;

        Assign(msg.sender, starIndex,starIndexToSTRZName[starIndex], starIndexToSTRZMasterName[starIndex]);

        uint amountseller = msg.value*97/100;
        uint amountowner = msg.value*3/100;           //Owner of contract receives 3% registration fee

        pendingWithdrawals[owner] += amountowner;    
        pendingWithdrawals[seller] += amountseller;

        starIndexToAddress[starIndex] = msg.sender;
 
        starNoLongerForSale(starIndex);
    
        string STRZName = starIndexToSTRZName[starIndex];
        string STRZMasterName = starIndexToSTRZMasterName[starIndex];

        StarBought(starIndex, msg.value, offer.seller, msg.sender, STRZName, STRZMasterName, MinStarIndexAvailable, MaxStarIndexAvailable);

        Bid bid = starBids[starIndex];
        if (bid.bidder == msg.sender) {
            // Kill bid and refund value
            pendingWithdrawals[msg.sender] += bid.value;
            starBids[starIndex] = Bid(false, starIndex, 0x0, 0);
            StarBidWithdrawn(starIndex, bid.value, msg.sender);
        }

    }
}