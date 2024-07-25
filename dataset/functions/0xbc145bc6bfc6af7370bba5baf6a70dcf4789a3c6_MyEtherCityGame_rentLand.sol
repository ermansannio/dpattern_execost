contract MyEtherCityGame {
function rentLand(uint _landId, bool _createCity, uint _cityId) public {
        // The owner can rent the land even if it's not marked forRent
        if(lands[_landId].ownerAddress != msg.sender) {
            require(lands[_landId].landForRent == true);
        }

        // Cities can't rent a land if it's already occupied
        require(lands[_landId].isOccupied == false);
                    
        if(_createCity == true) {
            // We create the city if the user is renting this land for a new city
            createCity(_landId);
        } else {
            // Cities can't rent a land if they are already landing one
            require(cities[_cityId].landId == 0);
        
            // We update the land and city if the user is renting the land for an existing city
            cities[_cityId].landId = _landId;
            lands[_landId].cityRentingId = _cityId;
            lands[_landId].landForSale == false;
            lands[_landId].landForRent == true;
            lands[_landId].isOccupied = true;
        }
    }
}