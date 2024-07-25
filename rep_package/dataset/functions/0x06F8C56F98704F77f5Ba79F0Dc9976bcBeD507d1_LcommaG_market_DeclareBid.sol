contract LcommaG {
function market_DeclareBid(uint256 _tokenId) payable external returns(bool){
        require (_tokenId < listTINAmotleyTotalSupply);
        require (listTINAmotleyIndexToAddress[_tokenId] != address(0));
        require (listTINAmotleyIndexToAddress[_tokenId] != msg.sender);
        require (msg.value > 0);
        bidInfo storage existingBid = info_BidInfoByIndex[_tokenId];
        // Keep only the highest bid.
        require (msg.value > existingBid.value);
        if (existingBid.value > 0){
            info_PendingWithdrawals[existingBid.bidder] += existingBid.value;
        }
        info_BidInfoByIndex[_tokenId] = bidInfo(true, _tokenId, 
            msg.sender, msg.value);
        emit BidDeclared(_tokenId, msg.value, msg.sender);
        return true;
    }
}