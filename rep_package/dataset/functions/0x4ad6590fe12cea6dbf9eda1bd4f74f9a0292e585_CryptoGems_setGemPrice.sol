contract CryptoGems {
function setGemPrice(uint256 _amount) onlyContractOwner public returns(bool) {
		gemPerEther = _amount;
		return true;
	}
}