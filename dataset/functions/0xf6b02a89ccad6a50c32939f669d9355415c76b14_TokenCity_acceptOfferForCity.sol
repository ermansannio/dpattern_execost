contract TokenCity {
function acceptOfferForCity(uint256 _offerId, uint16 _cityId, uint256 _price) public {
		// fetch
		city memory fetchedCity = cities[_cityId];
		offer memory offerFetched = offers[_offerId];
		// requires
		require(offerFetched.cityId == _cityId);
		require(offerFetched.from != 0x0);
		require(offerFetched.from != msg.sender);
		require(offerFetched.price == _price);
		require(fetchedCity.owner == msg.sender);
		// compute the fee
		uint256 fee = BUY_CITY_FEE.mul(_price) / 100;
		// transfer the escrowed money
		cities[_cityId].owner.transfer(_price.sub(fee));
		// transfer of ownership
		cities[_cityId].owner = offerFetched.from;
		// update metadata
		cities[_cityId].last_purchase_price = _price;
		cities[_cityId].buyable = false; // in case it was also set to be purchasable
		// increase economy of region 
		economyBoost(fetchedCity.countryId, _cityId);
		// event
		CitySold(_cityId, _price, msg.sender, offerFetched.from, _offerId);
		// remove offer
		offers[_offerId].cityId = 0;
		offers[_offerId].price = 0;
		offers[_offerId].from = 0x0;
	}
}