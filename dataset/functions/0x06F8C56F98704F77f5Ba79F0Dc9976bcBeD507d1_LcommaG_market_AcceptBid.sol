contract LcommaG {
function market_AcceptBid(uint256 _tokenId, uint256 minPrice) 
            external returns(bool){
        require (_tokenId < listTINAmotleyTotalSupply);
        address seller = listTINAmotleyIndexToAddress[_tokenId];
        require (seller == msg.sender);
        bidInfo storage existingBid = info_BidInfoByIndex[_tokenId];
        require (existingBid.hasBid);
        //Bid must be larger than minPrice
        require (existingBid.value > minPrice);
        address buyer = existingBid.bidder;
        // Remove for sale.
        market_WithdrawForSale(_tokenId);
        rawTransfer (seller, buyer, _tokenId);
        uint256 amount = existingBid.value;
        // Remove bid.
        info_BidInfoByIndex[_tokenId] = bidInfo(false, _tokenId, address(0),0);
        info_PendingWithdrawals[seller] += amount;
        emit BidAccepted(_tokenId, amount, seller, buyer);
        return true;
    }
}