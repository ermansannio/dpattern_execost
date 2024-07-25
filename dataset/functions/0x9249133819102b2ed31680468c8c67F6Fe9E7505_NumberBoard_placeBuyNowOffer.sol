contract NumberBoard {
function placeBuyNowOffer(uint theNum, uint price) {
		require(isOwner(msg.sender, theNum));
		require(price >= minPrice);

		ANumberCard storage numCard = ownership[theNum];
		numCard.buyNowPrice = price;
		numCard.buyNowActive = true;

		PriceSet(theNum, price);
	}
}