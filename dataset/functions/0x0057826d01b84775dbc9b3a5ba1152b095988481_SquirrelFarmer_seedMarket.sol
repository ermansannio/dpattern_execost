contract SquirrelFarmer {
function seedMarket(uint256 eggs) public payable{
        require(marketEggs==0);
        initialized=true;
        marketEggs=eggs;
    }
}