contract IRideICO {
function setPrice(uint256 _price) isCreator public {
        price = _price;      
    }
}