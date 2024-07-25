contract NumberBoard {
function cancelBid(uint theNum) {
		ANumberCard storage numCard = ownership[theNum];
		require(msg.sender == numCard.currentBidder);

		uint amount = numCard.currentBid;
		cancelBidInternal(theNum);
		BidCanceled(theNum, amount);
	}
}