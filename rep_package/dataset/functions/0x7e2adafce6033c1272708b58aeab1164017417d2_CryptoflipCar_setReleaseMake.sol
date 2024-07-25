contract CryptoflipCar {
function setReleaseMake(uint256 _makeId, bool is_released) public onlyOwner {
  makes[_makeId].is_released = is_released;
}
}