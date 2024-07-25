contract DonateDust {
function withdraw() public onlyOwner {
		owner.transfer(address(this).balance);
	}
}