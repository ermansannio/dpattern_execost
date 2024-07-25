contract PlumberCollector {
function seedMarket(uint256 poohs) public payable
    {
        require(marketPoohs==0);
        initialized=true;
        marketPoohs=poohs;
    }
}