contract ERC20Sale {
function buy(uint256 offerId, uint256 amount) payable public {
		
		OfferInfo storage offerInfo = offerInfos[offerId];
		ERC20 erc20 = ERC20(offerInfo.token);
		
		// 판매자가 가진 토큰의 양이 판매할 양보다 많아야 합니다.
		require(erc20.balanceOf(offerInfo.offeror) >= amount);
		
		// 거래소에 인출을 허락한 토큰의 양이 판매할 양보다 많아야 합니다.
		require(erc20.allowance(offerInfo.offeror, this) >= amount);
		
		// 판매하는 토큰의 양이 구매할 양보다 많아야 합니다.
		require(offerInfo.amount >= amount);
		
		// 토큰 가격이 제시한 가격과 동일해야합니다.
		require(offerInfo.price.mul(amount) == msg.value.mul(offerInfo.amount));
		
		// 토큰 구매자에게 토큰을 지급합니다.
		erc20.transferFrom(offerInfo.offeror, msg.sender, amount);
		
		// 가격을 내립니다.
		offerInfo.price = offerInfo.price.sub(msg.value);
		
		// 판매 토큰의 양을 줄입니다.
		offerInfo.amount = offerInfo.amount.sub(amount);
		
		// 토큰이 모두 팔렸으면 판매 정보 삭제
		if (offerInfo.amount == 0) {
			removeOffer(offerId);
		}
		
		// 판매자에게 이더를 지급합니다.
		offerInfo.offeror.transfer(msg.value);
		
		emit Buy(offerId, amount);
	}
}