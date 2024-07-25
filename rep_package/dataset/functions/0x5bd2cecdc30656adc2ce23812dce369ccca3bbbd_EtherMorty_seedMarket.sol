contract EtherMorty {
function seedMarket(uint256 eggs) public payable {
        require(marketEggs==0);
        initialized=true;
        marketEggs=eggs;
        contractStarted = now;
    }
}