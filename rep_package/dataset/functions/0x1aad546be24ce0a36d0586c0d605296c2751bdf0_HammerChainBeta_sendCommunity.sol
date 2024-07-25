contract HammerChainBeta {
function sendCommunity() onlyOwner public{
        require(releasedCommunity == false);
        _transfer(owner,COMMUNITY_POOL_ADDR,totalSupply/5);
        releasedCommunity = true;
    }
}