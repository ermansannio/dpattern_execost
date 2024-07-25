contract ERC20Sale {
function offer(address token, uint256 amount, uint256 price) public {
		ERC20 erc20 = ERC20(token);
		
		// 판매자가 가진 토큰의 양이 판매할 양보다 많아야 합니다.
		require(erc20.balanceOf(msg.sender) >= amount);
		
		// 거래소에 인출을 허락한 토큰의 양이 판매할 양보다 많아야 합니다.
		require(erc20.allowance(msg.sender, this) >= amount);
		
		// 판매 정보 생성
		uint256 offerId = offerInfos.push(OfferInfo({
			offeror : msg.sender,
			token : token,
			amount : amount,
			price : price
		})).sub(1);
		
		emit Offer(offerId);
	}
}