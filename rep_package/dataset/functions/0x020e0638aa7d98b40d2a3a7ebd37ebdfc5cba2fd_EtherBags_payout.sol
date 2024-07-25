contract EtherBags {
function payout() public onlyContractOwner {
    contractOwner.transfer(this.balance);
  }
}