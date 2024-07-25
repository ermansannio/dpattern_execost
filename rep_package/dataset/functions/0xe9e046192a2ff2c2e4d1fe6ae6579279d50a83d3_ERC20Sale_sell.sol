contract ERC20Sale {
function sell(uint256 bidId, uint256 amount) public {
		
		BidInfo storage bidInfo = bidInfos[bidId];
		ERC20 erc20 = ERC20(bidInfo.token);
		
		// 판매자가 가진 토큰의 양이 판매할 양보다 많아야 합니다.
		require(erc20.balanceOf(msg.sender) >= amount);
		
		// 거래소에 인출을 허락한 토큰의 양이 판매할 양보다 많아야 합니다.
		require(erc20.allowance(msg.sender, this) >= amount);
		
		// 구매하는 토큰의 양이 판매할 양보다 많아야 합니다.
		require(bidInfo.amount >= amount);
		
		uint256 realPrice = amount.mul(bidInfo.price).div(bidInfo.amount);
		
		// 가격 계산에 문제가 없어야 합니다.
		require(realPrice.mul(bidInfo.amount) == amount.mul(bidInfo.price));
		
		// 토큰 구매자에게 토큰을 지급합니다.
		erc20.transferFrom(msg.sender, bidInfo.bidder, amount);
		
		// 가격을 내립니다.
		bidInfo.price = bidInfo.price.sub(realPrice);
		
		// 구매할 토큰의 양을 줄입니다.
		bidInfo.amount = bidInfo.amount.sub(amount);
		
		// 토큰을 모두 구매하였으면 구매 정보 삭제
		if (bidInfo.amount == 0) {
			removeBid(bidId);
		}
		
		// 판매자에게 이더를 지급합니다.
		msg.sender.transfer(realPrice);
		
		emit Sell(bidId, amount);
	}
}