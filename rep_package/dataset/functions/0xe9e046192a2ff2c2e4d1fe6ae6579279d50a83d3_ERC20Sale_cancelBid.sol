contract ERC20Sale {
function cancelBid(uint256 bidId) public {
		
		BidInfo memory bidInfo = bidInfos[bidId];
		
		// 구매자인지 확인합니다.
		require(bidInfo.bidder == msg.sender);
		
		// 구매 정보 삭제
		removeBid(bidId);
		
		// 이더를 환불합니다.
		bidInfo.bidder.transfer(bidInfo.price);
		
		emit CancelBid(bidId);
	}
}