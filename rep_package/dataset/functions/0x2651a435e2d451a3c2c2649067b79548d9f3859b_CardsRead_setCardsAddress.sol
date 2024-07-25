contract CardsRead {
function setCardsAddress(address _address) external onlyOwner {
    cards = CardsInterface(_address);
  }
}