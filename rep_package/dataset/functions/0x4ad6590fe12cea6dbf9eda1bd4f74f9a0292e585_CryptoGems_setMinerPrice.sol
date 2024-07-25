contract CryptoGems {
function setMinerPrice(uint256 _amount) onlyContractOwner public returns(bool) {
		etherPerMiner = _amount;
		return true;
	}
}