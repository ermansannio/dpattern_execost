contract EtherKebab {
function seedMarket(uint256 kebab) public payable
    {
        require(marketKebabs==0);
        initialized=true;
        marketKebabs=kebab;
    }
}