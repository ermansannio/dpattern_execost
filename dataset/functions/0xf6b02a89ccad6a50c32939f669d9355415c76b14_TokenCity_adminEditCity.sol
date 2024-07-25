contract TokenCity {
function adminEditCity(uint16 _cityId, string _name, uint256 _price, address _owner) public {
		// requires
		require(msg.sender == unitedNations);
		require(cities[_cityId].owner == 0x0);
		//
		cities[_cityId].name = _name;
		cities[_cityId].price = _price;
		cities[_cityId].owner = _owner;
	}
}