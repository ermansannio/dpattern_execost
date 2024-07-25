contract ToyCo {
function seedMarket(uint256 stores) public payable{
        require(marketStores==0);
        initialized=true;
        marketStores=stores;
    }
}