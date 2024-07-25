contract MyEtherCityGame {
function createBusiness(uint _itemId, uint256 _itemPrice, uint _cityId) public {
        // We check if the price of the item sold is enough regarding the current price of the metal
        require(_itemPrice >= BuildingTypeMetalNeeded[_itemId] * priceMetal);

        // We verifiy that the sender is the owner of the city
        require(cities[_cityId].ownerAddress == msg.sender);

        // We check that the city has enough squares to host this new building
        require((cities[_cityId].squaresOccupied + BuildingTypeSquaresOccupied[4]) <= 100);
        
        // We check if the city has enough population to create this business (1 building / 25 citizens)
        require(CityBusinessCount[_cityId] < getMaxBusinessesPerCity(_cityId));

        // We create the business
        businesses.push(Business(_itemId, _itemPrice, _cityId, 0));

        // We increment the businesses count for this type and city
        CountBusinessesPerType[_itemId]++;

        // We increment the count of businesses for this city
        CityBusinessCount[_cityId]++;

        // Increment the squares used in this land
        cities[_cityId].squaresOccupied = cities[_cityId].squaresOccupied + BuildingTypeSquaresOccupied[4];
    }
}