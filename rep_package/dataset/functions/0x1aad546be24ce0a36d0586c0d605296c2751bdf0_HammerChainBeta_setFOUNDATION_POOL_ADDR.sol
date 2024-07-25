contract HammerChainBeta {
function setFOUNDATION_POOL_ADDR(address addr) onlyOwner public{
        FOUNDATION_POOL_ADDR = addr;
    }
}