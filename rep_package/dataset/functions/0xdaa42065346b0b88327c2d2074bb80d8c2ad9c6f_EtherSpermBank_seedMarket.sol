contract EtherSpermBank {
function seedMarket(uint256 cells) public payable {
        require(marketCells == 0);

        initialized = true;
        marketCells = cells;
    }
}