contract CityMayor {
function makeOfferForCity(uint16 _cityId, uint256 _price) public payable {
		// requires
		require(cities[_cityId].owner != 0x0);
		require(_price > 0);
		require(msg.value >= _price);
		require(cities[_cityId].owner != msg.sender);
		// add the offer
		uint256 lastId = offers.push(offer(_cityId, _price, msg.sender)) - 1;
		// increment totalOffer
		totalOffer = totalOffer.add(_price);
		// event
		OfferForCity(lastId, _cityId, _price, msg.sender, cities[_cityId].owner);
	}
}