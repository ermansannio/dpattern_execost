contract NumberBoard {
function acceptBid(uint theNum) {
		require(isOwner(msg.sender, theNum));

		ANumberCard storage numCard = ownership[theNum];
		require(numCard.currentBid > 0);
		require(numCard.currentBidder != 0);

		uint amount = numCard.currentBid;
		addEarnings(amount, numCard.owner);
		transferNumberOwnership(theNum, numCard.owner, numCard.currentBidder);

		numCard.currentBidder = 0;
		numCard.currentBid = 0;

		BidAccepted(theNum, amount);
	}
}