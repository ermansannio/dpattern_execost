contract EtherCartel {
function seedMarket(uint256 drugs) public payable{
        require(marketDrugs==0);
        initialized=true;
        marketDrugs=drugs;
    }
}