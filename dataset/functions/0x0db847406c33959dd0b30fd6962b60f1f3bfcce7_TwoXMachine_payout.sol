contract TwoXMachine {
function payout() onlyOwner() public {
    owner.transfer(this.balance);
  }
}