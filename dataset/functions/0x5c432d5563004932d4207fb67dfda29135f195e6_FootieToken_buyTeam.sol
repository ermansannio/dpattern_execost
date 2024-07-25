contract FootieToken {
function buyTeam(uint256 _index) public payable {
		address oldOwner = teamIndexToOwner[_index];
		address newOwner = msg.sender;

		uint256 sellingPrice = teamIndexToPrice[_index];

		// Making sure token owner is not sending to self
		require(oldOwner != newOwner);

		// Safety check to prevent against an unexpected 0x0 default.
		require(_addressNotNull(newOwner));

		// Making sure sent amount is greater than or equal to the sellingPrice
		require(msg.value >= sellingPrice);


		// 96% goes to old owner
		uint256 payment = uint256(SafeMath.div(SafeMath.mul(sellingPrice, 96), 100));

		// 4% goes to the contract creator address
		uint256 fee = uint256(SafeMath.div(SafeMath.mul(sellingPrice, 4), 100));
		
		// any excess (the new owner payed more than needed) will be refunded to the new owner
		uint256 purchaseExcess = SafeMath.sub(msg.value, sellingPrice);

		// Update price
		teamIndexToPrice[_index] = sellingPrice + SafeMath.div(SafeMath.mul(sellingPrice, princeIncreasePercentage), 100);

		//Update transaction count
		teamIndexToGoals[_index] = teamIndexToGoals[_index] + 1;

		// send the money to the previous owner
		oldOwner.transfer(payment);
		// pay fee
		creatorAddress.transfer(fee);

		// store the transfer
		_transfer(oldOwner, newOwner, _index);

		TeamSold(_index, sellingPrice, teamIndexToPrice[_index], oldOwner, newOwner, teams[_index].name);

		msg.sender.transfer(purchaseExcess);
	}
}