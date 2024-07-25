contract LimeEyes {
function withdrawAmount(uint256 amount, address toAddress) public onlyDev {

		require(amount != 0);
		require(amount <= this.balance);
		toAddress.transfer(amount);

	}
}