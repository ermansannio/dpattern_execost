contract LimeEyes {
function withdrawAll(address toAddress) public onlyDev {
		toAddress.transfer(this.balance);
	}
}