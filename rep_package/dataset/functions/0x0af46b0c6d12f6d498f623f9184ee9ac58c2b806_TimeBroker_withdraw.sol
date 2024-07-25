contract TimeBroker {
function withdraw(uint256 index)
    {
        Auction storage auc = auctions[index];
        assert(auc.seller == msg.sender); // seller call function
        assert(now > auc.datetime + auc.duration); // meeting ended
        assert(auctionWithdrawDone[index] == false);
        auctionWithdrawDone[index] = true;
        uint256 payToSeller = auc.currentPrice * 95 / 100;
        assert(auc.currentPrice > payToSeller);
        auc.seller.transfer(payToSeller);               // 95% to seller
        owner.transfer(auc.currentPrice - payToSeller); // 5% to owner
        Withdraw(auc.seller, index, payToSeller);
    }
}