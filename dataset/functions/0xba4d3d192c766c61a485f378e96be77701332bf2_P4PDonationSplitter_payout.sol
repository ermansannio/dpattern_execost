contract P4PDonationSplitter {
function payout() payable public {
        var share = this.balance / 2;
        epicenter_works_addr.transfer(share);
        max_schrems_addr.transfer(share);
    }
}