contract OnePercentGift {
function reclaimUnwantedGift() public{
		owner.transfer(address(this).balance);
	}
}