contract PresidentElections {
function setCreatePrice(uint _price) public onlyOwner {
    create_price = _price;
  }
}