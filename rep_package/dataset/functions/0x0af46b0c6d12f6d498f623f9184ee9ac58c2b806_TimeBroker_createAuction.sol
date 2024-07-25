contract TimeBroker {
function createAuction(uint256 bidsAcceptedBefore, uint256 datetime, uint64 duration, uint256 minPrice)
    {
        assert(bytes(sellers[msg.sender].FirstName).length > 0);
        assert(datetime > bidsAcceptedBefore);
        assert(datetime > now);
        assert(duration > 0);
        auctions.push(Auction(msg.sender, bidsAcceptedBefore, datetime, duration, minPrice, 0x0, false));
        NewAuction(msg.sender, auctions.length - 1, bidsAcceptedBefore, datetime, duration, minPrice);
    }
}