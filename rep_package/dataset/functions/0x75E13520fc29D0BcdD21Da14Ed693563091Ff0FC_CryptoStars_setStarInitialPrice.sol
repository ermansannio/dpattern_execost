contract CryptoStars {
function setStarInitialPrice(uint256 initialPriceHolder) {
        if (msg.sender != owner) throw;
        initialPrice = initialPriceHolder;
        StarMinMax(MinStarIndexAvailable,MaxStarIndexAvailable, initialPrice);
    }
}