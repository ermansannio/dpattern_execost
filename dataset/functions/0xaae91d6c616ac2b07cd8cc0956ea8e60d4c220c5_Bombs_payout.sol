contract Bombs {
function payout() public onlyCEO {
    ceoAddress.transfer(this.balance);
  }
}