contract MyEtherCityGame {
function updateBusiness(uint _businessId, uint256 _itemPrice) public {
        // We check if the user is the owner of the business
        require(cities[businesses[_businessId].cityId].ownerAddress == msg.sender);

        // We check if the price of the item sold is enough regarding the current price of the metal
        require(_itemPrice >= BuildingTypeMetalNeeded[businesses[_businessId].itemToProduce] * priceMetal);

        businesses[_businessId].itemPrice = _itemPrice;
    }
}