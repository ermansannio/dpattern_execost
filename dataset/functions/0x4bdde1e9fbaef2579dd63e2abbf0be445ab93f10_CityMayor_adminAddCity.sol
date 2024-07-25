contract CityMayor {
function adminAddCity(string _name, uint256 _price, uint16 _countryId) public returns (uint256) {
		// requires
		require(msg.sender == unitedNations);
		require(cities.length < MAX_CITIES);
		// add city
		uint256 lastId = cities.push(city(_name, _price, 0, _countryId, new uint256[](0), true, 0)) - 1;
		countries[_countryId].cities.push(uint16(lastId));
		// event
		NewCity(lastId, _name, _price, _countryId);
		//
		return lastId;
	}
}