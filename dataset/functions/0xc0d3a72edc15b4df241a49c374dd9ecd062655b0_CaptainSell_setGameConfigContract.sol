contract CaptainSell {
function setGameConfigContract(address _address) external onlyOwner {
    config = CaptainGameConfigInterface(_address);
  }
}