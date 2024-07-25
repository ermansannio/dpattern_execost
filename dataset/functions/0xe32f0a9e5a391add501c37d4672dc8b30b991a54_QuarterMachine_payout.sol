contract QuarterMachine {
function payout() public onlyContractOwner {
    contractOwner.transfer(this.balance);
  }
}