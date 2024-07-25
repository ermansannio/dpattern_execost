contract testeot {
function setPrice(uint256 newSellPrice) onlyOwner {
        crowdsalePrice = newSellPrice;
    }
}