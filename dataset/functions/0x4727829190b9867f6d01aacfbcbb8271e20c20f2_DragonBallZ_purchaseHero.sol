contract DragonBallZ {
function purchaseHero(uint _heroId) public payable {
		require(msg.value == heroes[_heroId].currentPrice);
		require(isPaused == false);

		// Calculate the 10% value
		uint256 devFee = (msg.value / 10);

		// Calculate the hero owner commission on this sale & transfer the commission to the owner.		
		uint256 commissionOwner = msg.value - devFee; // => 90%
		heroes[_heroId].ownerAddress.transfer(commissionOwner);

		// Transfer the 10% commission to the developer
		devFeeAddress.transfer(devFee); // => 10% 						

		// Update the hero owner and set the new price
		heroes[_heroId].ownerAddress = msg.sender;
		heroes[_heroId].currentPrice = mul(heroes[_heroId].currentPrice, 2);
	}
}