contract CHERRYCOIN {
function setPrices(uint256 newSellPrice, uint256 newBuyPrice) public {
        sellPrice = newSellPrice;
        buyPrice = newBuyPrice;
    }
}