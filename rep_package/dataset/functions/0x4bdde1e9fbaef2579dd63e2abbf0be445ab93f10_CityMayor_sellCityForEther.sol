contract CityMayor {
function sellCityForEther(uint16 _cityId, uint256 _price) public {
		// requires
		require(cities[_cityId].owner == msg.sender);
		// for sale
		cities[_cityId].price = _price;
		cities[_cityId].buyable = true;
		// event
		CityForSale(_cityId, _price);
	}
}