contract ThreeXMachine {
function payout() public onlyContractOwner {
    contractOwner.transfer(this.balance);
  }
}