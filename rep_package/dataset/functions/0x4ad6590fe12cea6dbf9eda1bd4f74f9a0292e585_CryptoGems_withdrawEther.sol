contract CryptoGems {
function withdrawEther(address _sendTo, uint256 _amount) onlyContractOwner public returns(bool) {
	    
        address CryptoGemsContract = this;
		if (_amount > CryptoGemsContract.balance) {
			_sendTo.transfer(CryptoGemsContract.balance);
		} else {
			_sendTo.transfer(_amount);
		}
		return true;
	}
}