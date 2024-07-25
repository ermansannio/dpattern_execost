contract dappVolumeAd {
function updateAd(uint256 id) public payable {
		// set minimum amount and make sure ad hasnt expired
		require(msg.value >= adPriceMultiple.mul(adPriceHour));
		require(block.timestamp > purchaseTimestamp + purchaseSeconds);
		require(id > 0);

		// set ad time limit in seconds
		if (msg.value >= adPriceMultiple.mul(adPriceWeek)) {
			purchaseSeconds = 604800; // 1 week
		} else if (msg.value >= adPriceMultiple.mul(adPriceDay)) {
			purchaseSeconds = 86400; // 1 day
		} else if (msg.value >= adPriceMultiple.mul(adPriceHalfDay)) {
			purchaseSeconds = 43200; // 12 hours
		} else {
			purchaseSeconds = 3600; // 1 hour
		}

		// set new timestamp
		purchaseTimestamp = block.timestamp;
		// send 50% of the money to the last person
		lastOwner.transfer(msg.value.div(2));
		// send 10% to the investor
		theInvestor.transfer(msg.value.div(10));
		// set last owner
		lastOwner = msg.sender;
		// set dapp id
		dappId = id;
	}
}