contract MyEtherCityGame {
function removeTenant(uint _landId) public {
        require(lands[_landId].ownerAddress == msg.sender);
        lands[_landId].landForRent = false;
        lands[_landId].isOccupied = false;
        cities[lands[_landId].cityRentingId].landId = 0;
        lands[_landId].cityRentingId = 0;
    }
}