contract NumberBoard {
function acceptBuyNowOffer(uint theNum) payable {
		require (canAcceptBuyNow(theNum, msg.sender));
		ANumberCard storage numCard = ownership[theNum];
		require (msg.value == numCard.buyNowPrice);

		addEarnings(msg.value, numCard.owner);
		cancelBidInternal(theNum);

		transferNumberOwnership(theNum, numCard.owner, msg.sender);
		cancelBuyNowOfferInternal(numCard);

		PriceAccepted(theNum, msg.value);
	}
}