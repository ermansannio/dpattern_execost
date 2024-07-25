contract CaptainSell {
function withdraw() external onlyOwner {
    require(this.balance>0);
    msg.sender.transfer(this.balance);
  }
}