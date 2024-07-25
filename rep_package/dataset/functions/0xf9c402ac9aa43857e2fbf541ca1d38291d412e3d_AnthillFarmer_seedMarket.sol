contract AnthillFarmer {
function seedMarket(uint256 ants) public payable{
        require(marketAnts==0);
        initialized=true;
        marketAnts=ants;
    }
}