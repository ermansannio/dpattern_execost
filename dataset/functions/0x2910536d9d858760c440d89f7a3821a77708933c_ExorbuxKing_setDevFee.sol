contract ExorbuxKing {
function setDevFee (uint256 _n) onlyOwner() public {
	  require(_n >= 0 && _n <= 90);
    devFeePercent = _n;
  }
}