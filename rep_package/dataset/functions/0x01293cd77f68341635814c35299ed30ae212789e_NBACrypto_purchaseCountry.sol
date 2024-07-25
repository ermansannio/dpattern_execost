contract NBACrypto {
function purchaseCountry(uint _countryId) public payable {
		require(msg.value == teams[_countryId].curPrice);
		require(isPaused == false);


		uint256 commission5percent = (msg.value / 10);


		uint256 commissionOwner = msg.value - commission5percent; // => 95%
		teams[_countryId].ownerAddress.transfer(commissionOwner);


		cfoAddress.transfer(commission5percent);

		// Update the team owner and set the new price
		teams[_countryId].ownerAddress = msg.sender;
		teams[_countryId].curPrice = mul(teams[_countryId].curPrice, 2);
	}
}