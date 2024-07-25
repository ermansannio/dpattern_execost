contract TokenCity {
function cancelOfferForCity(uint256 _offerId) public {
		// fetch
		offer memory offerFetched = offers[_offerId];
		// requires
		require(offerFetched.from == msg.sender);
		// refund
		msg.sender.transfer(offerFetched.price);
		// remove offer
		offers[_offerId].cityId = 0;
		offers[_offerId].price = 0;
		offers[_offerId].from = 0x0;
		// event
		CancelOfferForCity(_offerId);
	}
}