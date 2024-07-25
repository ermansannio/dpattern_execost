contract SubPrimeCrypto {
function purchaseAsset(uint _tokenId) payable public {
        Listing storage listing = listings[_tokenId];

        uint currentPrice = calculateCurrentPrice(listing);
        require(currentPrice > 0 && msg.value >= currentPrice);
        require(listing.isAvailable && listing.endsAt > now);
        listing.isAvailable = false;

        if (houses[_tokenId].owner != address(this)) {
            uint fee = currentPrice / (100 / saleFee);
            houses[_tokenId].owner.transfer(currentPrice - fee);
        } else {
            if (++presaleSales >= presaleLimit) {
                presaleOngoing = false;
            }
        }

        approveAndTransfer(msg.sender, _tokenId);
    }
}