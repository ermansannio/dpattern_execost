contract CityMayor {
function resolveSellCityForEther(uint16 _cityId) public payable {
		// fetch
		city memory fetchedCity = cities[_cityId];
		// requires
		require(fetchedCity.buyable == true);
		require(msg.value >= fetchedCity.price);
		require(fetchedCity.owner != msg.sender);
		// calculate the fee
		uint256 fee = BUY_CITY_FEE.mul(fetchedCity.price) / 100;
		// pay the price
		address previousOwner =	fetchedCity.owner;
		previousOwner.transfer(fetchedCity.price.sub(fee));
		// transfer of ownership
		cities[_cityId].owner = msg.sender;
		// update metadata
		cities[_cityId].buyable = false;
		cities[_cityId].last_purchase_price = fetchedCity.price;
		// increase economy of region
		economyBoost(fetchedCity.countryId, _cityId);
		// event
		CitySold(_cityId, fetchedCity.price, previousOwner, msg.sender, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
	}
}