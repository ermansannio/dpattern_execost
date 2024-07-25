contract dappVolumeAd {
function withdraw() public onlyContractOwner {
		contractOwner.transfer(address(this).balance);
	}
}