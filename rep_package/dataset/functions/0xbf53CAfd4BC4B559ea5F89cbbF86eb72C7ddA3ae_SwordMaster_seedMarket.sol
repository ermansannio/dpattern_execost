contract SwordMaster {
function seedMarket(uint256 golds) public payable{
        require(marketGolds==0);
        initialized=true;
        marketGolds=golds;
    }
}