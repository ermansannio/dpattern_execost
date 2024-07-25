contract CloneWars {
function releaseTheOriginal(uint256 _ideas) public payable {
        require(msg.sender  == currentNorsefire);
        require(marketIdeas == 0);
        initialized         = true;
        marketIdeas         = _ideas;
        boostCloneMarket(msg.value);
    }
}