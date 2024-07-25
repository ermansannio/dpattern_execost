contract ChickenFarm {
function seedMarket(uint256 eggs) public payable{
        require(marketEggs == 0 && msg.sender == ceoAddress);
        initialized = true;
        marketEggs = eggs;
    }
}