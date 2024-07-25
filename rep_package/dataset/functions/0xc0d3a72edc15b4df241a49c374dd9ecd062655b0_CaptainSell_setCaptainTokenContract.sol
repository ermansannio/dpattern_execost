contract CaptainSell {
function setCaptainTokenContract(address _address) external onlyOwner {
    captains = CaptainTokenInterface(_address);
  }
}