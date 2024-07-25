contract IBITCrowdsale {
function setPrice(uint256 _price) public isCreator {
        price = _price;
    }
}