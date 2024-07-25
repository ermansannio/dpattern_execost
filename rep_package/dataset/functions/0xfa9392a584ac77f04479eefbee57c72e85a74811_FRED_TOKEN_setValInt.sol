contract FRED_TOKEN {
function setValInt(uint256 _valInt) external onlyOwner {
      valInt = _valInt;
    }
}