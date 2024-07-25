contract GameConfig {
function setAllowedAddress(address _address) external onlyOwner {
    require(_address != address(0));
    allowed = _address;
  }
}