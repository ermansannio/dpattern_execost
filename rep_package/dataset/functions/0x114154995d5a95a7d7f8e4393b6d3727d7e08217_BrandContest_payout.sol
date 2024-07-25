contract BrandContest {
function payout() public onlyCEO {
        ceoAddress.transfer(this.balance);
    }
}