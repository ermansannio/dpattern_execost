contract EXPERIMENTAL_ETH_AUCTION {
function SendBid()
    public
    payable
    {
        require(now<EndTime);
        
        Bids[msg.sender]+=msg.value;
        
        if(Bids[msg.sender]>MaxOffer)
        {
            MaxOffer=Bids[msg.sender];
        }
    }
}