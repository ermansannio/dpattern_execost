contract CityMayor {
function cancelSellCityForEther(uint16 _cityId) public {
		// requires
		require(cities[_cityId].owner == msg.sender);
		//
		cities[_cityId].buyable = false;
		// event
		CityNotForSale(_cityId);
	}
}