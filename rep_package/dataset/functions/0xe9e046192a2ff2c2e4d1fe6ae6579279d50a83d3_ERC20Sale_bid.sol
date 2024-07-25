contract ERC20Sale {
function bid(address token, uint256 amount) payable public {
		
		// 구매 정보 생성
		uint256 bidId = bidInfos.push(BidInfo({
			bidder : msg.sender,
			token : token,
			amount : amount,
			price : msg.value
		})).sub(1);
		
		emit Bid(bidId);
	}
}