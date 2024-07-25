contract CityMayor {
function adminAddCountry(string _name) public returns (uint256) {
		// requires
		require(msg.sender == unitedNations);
		// add country
		uint256 lastId = countries.push(country(_name, new uint16[](0))) - 1; 
		//
		return lastId;
	}
}