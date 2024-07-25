contract CityMayor {
function AdminBuyForSomeone(uint16 _cityId, address _owner) public {
   		// admin only
   		require(msg.sender == unitedNations);
	   	// fetch
	   	city memory fetchedCity = cities[_cityId];
	   	// requires
		require(fetchedCity.buyable == true);
		require(fetchedCity.owner == 0x0); 
	   	// transfer ownership
	   	cities[_cityId].owner = _owner;
	   	// update city metadata
	   	cities[_cityId].buyable = false;
	   	cities[_cityId].last_purchase_price = fetchedCity.price;
	   	// increase economy of region according to ECONOMY_BOOST
	   	uint16[] memory fetchedCities = countries[fetchedCity.countryId].cities;
	   	uint256 perCityBoost = ECONOMY_BOOST / fetchedCities.length;
	   	for(uint16 ii = 0; ii < fetchedCities.length; ii++){
	   		address _to = cities[fetchedCities[ii]].owner;
	   		if(_to != 0x0) { // MINT only if address exists
	   			balances[_to] = balances[_to].add(perCityBoost);
	   			totalSupply_ += perCityBoost; // update the total supply
	   		}
	   	}
	   	// event
	   	CitySold(_cityId, fetchedCity.price, 0x0, _owner, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);	
   	}
}