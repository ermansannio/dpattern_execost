contract NumberBoard {
function cancelBuyNowOffer(uint theNum) {
		require(isOwner(msg.sender, theNum));
		cancelBuyNowOfferInternal(ownership[theNum]);
	}
}