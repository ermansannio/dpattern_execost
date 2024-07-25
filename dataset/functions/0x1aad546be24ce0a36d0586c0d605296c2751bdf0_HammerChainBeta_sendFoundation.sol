contract HammerChainBeta {
function sendFoundation() onlyOwner public{
        require(releasedFoundation == false);
        _transfer(owner,FOUNDATION_POOL_ADDR,totalSupply/4);
        releasedFoundation = true;
    }
}