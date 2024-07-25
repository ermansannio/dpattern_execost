contract CryptoStars {
function offerStarForSale(uint starIndex, uint minSalePriceInWei) {
        if (starIndexToAddress[starIndex] != msg.sender) throw;
        starsOfferedForSale[starIndex] = Offer(true, starIndex, msg.sender, minSalePriceInWei, 0x0);
        StarOffered(starIndex, minSalePriceInWei, msg.sender, 0x0);
    }
}