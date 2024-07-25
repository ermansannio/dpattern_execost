contract LcommaG {
function gift_Transfer(address _to, uint256 _tokenId) public returns(bool) {
        address initialOwner = listTINAmotleyIndexToAddress[_tokenId];
        require (initialOwner == msg.sender);
        require (_tokenId < listTINAmotleyTotalSupply);
        // Remove for sale.
        market_WithdrawForSale(_tokenId);
        rawTransfer (initialOwner, _to, _tokenId);
        // Remove new owner's bid, if it exists.
        clearNewOwnerBid(_to, _tokenId);
        return true;
    }
}