contract RiceFarmer {
function seedMarket(uint256 eggs) public payable{
        require(marketSeeds==0);
        initialized=true;
        marketSeeds=eggs;
    }
}