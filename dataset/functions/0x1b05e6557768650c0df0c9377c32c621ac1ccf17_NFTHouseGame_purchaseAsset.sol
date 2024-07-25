contract NFTHouseGame {
function purchaseAsset(uint _tokenId) payable public {
        Listing storage listing = listings[_tokenId];

        uint currentPrice = calculateCurrentPrice(listing);
        require(msg.value >= currentPrice);

        require(listing.isAvailable && listing.endsAt > now);
        listing.isAvailable = false;

        if (presaleOngoing && (++presaleSales >= presaleLimit)) {
          presaleOngoing = false;
        }

        if (houses[_tokenId].owner != address(this)) {
            uint fee = currentPrice / (100 / saleFee);
            uint sellerProceeds = currentPrice - fee;
            presaleProceeds += (msg.value - sellerProceeds);
            houses[_tokenId].owner.transfer(sellerProceeds);
        } else {
            presaleProceeds += msg.value;
        }

        approveAndTransfer(msg.sender, _tokenId);
    }
}