contract NumberBoard {
function placeNewBid(uint theNum) payable {
		require(hasOwner(theNum));
		require(!isOwner(msg.sender, theNum));
		require(msg.value >= minPrice);

		ANumberCard storage numCard = ownership[theNum];
		require(msg.value > numCard.currentBid + minPrice);

		deadbids[numCard.currentBidder] += numCard.currentBid;

		numCard.currentBid = msg.value;
		numCard.currentBidder = msg.sender;

		BidPlaced(theNum, msg.value);
	}
}