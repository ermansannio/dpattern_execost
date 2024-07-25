contract dappVolumeAd {
function updateInvestor() public payable {
		require(msg.value >= investmentMin);
		theInvestor.transfer(msg.value.div(100).mul(60)); // send 60% to last investor (120% of original purchase)
		theInvestor = msg.sender; // set new investor
		investmentMin = investmentMin.mul(2); // double the price to become the investor
	}
}