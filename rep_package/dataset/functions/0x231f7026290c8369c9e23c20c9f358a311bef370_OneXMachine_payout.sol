contract OneXMachine {
function payout() public onlyContractOwner {
    contractOwner.transfer(this.balance);
  }
}