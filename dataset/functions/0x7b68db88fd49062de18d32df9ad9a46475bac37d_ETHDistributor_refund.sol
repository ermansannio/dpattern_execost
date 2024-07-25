contract ETHDistributor {
function refund() public {
    require(msg.sender == owner);      
    owner.transfer(this.balance);
  }
}