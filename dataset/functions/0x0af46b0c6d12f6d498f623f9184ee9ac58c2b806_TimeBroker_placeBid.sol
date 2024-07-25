contract TimeBroker {
function placeBid(uint256 index) payable
    {
        Auction storage auc = auctions[index];
        assert(auc.seller != msg.sender);
        assert(now < auc.bidsAcceptedBefore);
        assert(auc.canceled == false);
        assert(msg.value > auc.currentPrice);
        if (auc.winner != 0)
        {
            auc.winner.transfer(auc.currentPrice);
        }
        auc.currentPrice = msg.value;
        auc.winner = msg.sender;
        Bid(auc.seller, index, msg.sender, msg.value);
    }
}