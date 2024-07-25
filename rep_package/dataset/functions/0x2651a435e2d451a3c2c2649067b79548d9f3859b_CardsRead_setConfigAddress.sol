contract CardsRead {
function setConfigAddress(address _address) external onlyOwner {
    schema = GameConfigInterface(_address);
  }
}