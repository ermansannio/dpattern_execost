contract MyEtherCityGame {
function createCity(uint _landId) public {
        require(lands[_landId].isOccupied == false);

        // Create the city
        uint cityId = cities.push(City(_landId, msg.sender, 0, 0, false, 0, 0)) - 1;

        lands[_landId].landForSale == false;
        lands[_landId].landForRent == false;
        lands[_landId].cityRentingId = cityId;
        lands[_landId].isOccupied = true;
    }
}