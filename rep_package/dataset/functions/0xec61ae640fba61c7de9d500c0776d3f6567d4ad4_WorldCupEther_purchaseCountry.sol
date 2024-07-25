contract WorldCupEther {
function purchaseCountry(uint _countryId) public payable {
		require(msg.value == teams[_countryId].curPrice);
		require(isPaused == false);

		// Calculate the 5% value
		uint256 commission5percent = (msg.value / 10);

		// Calculate the owner commission on this sale & transfer the commission to the owner.		
		uint256 commissionOwner = msg.value - commission5percent; // => 95%
		teams[_countryId].ownerAddress.transfer(commissionOwner);

		// Transfer the 5% commission to the developer
		cfoAddress.transfer(commission5percent); // => 5% (25% remains in the Jackpot)						

		// Update the team owner and set the new price
		teams[_countryId].ownerAddress = msg.sender;
		teams[_countryId].curPrice = mul(teams[_countryId].curPrice, 2);
	}
}