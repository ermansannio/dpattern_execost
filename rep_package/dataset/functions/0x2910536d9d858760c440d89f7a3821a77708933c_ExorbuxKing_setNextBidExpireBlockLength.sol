contract ExorbuxKing {
function setNextBidExpireBlockLength (uint256 _n) onlyOwner() public {
	  require(_n >= 10 && _n <= 10000);
    nextBidExpireBlockLength = _n;
  }
}