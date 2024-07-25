contract CityMayor {
function makeOfferForCityForSomeone(uint16 _cityId, uint256 _price, address from) public payable {
		// only for admins
		require(msg.sender == unitedNations);
		// requires
		require(cities[_cityId].owner != 0x0);
		require(_price > 0);
		require(msg.value >= _price);
		require(cities[_cityId].owner != from);
		// add the offer
		uint256 lastId = offers.push(offer(_cityId, _price, from)) - 1;
		// increment totalOffer
		totalOffer = totalOffer.add(_price);
		// event
		OfferForCity(lastId, _cityId, _price, from, cities[_cityId].owner);
	}
}