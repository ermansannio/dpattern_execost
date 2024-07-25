contract CryptoMilitary {
function setOwner (address _owner) onlyOwner() public {
    owner = _owner;
  }
}