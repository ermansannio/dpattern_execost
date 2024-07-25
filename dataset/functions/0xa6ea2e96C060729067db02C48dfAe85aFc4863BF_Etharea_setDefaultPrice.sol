contract Etharea {
function setDefaultPrice(uint newPrice) public onlyOwner {
        defaultPrice = newPrice;
    }
}