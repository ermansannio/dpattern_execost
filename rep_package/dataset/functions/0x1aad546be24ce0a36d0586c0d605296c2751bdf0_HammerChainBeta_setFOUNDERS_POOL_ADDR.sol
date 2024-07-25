contract HammerChainBeta {
function setFOUNDERS_POOL_ADDR(address addr) onlyOwner public{
        FOUNDERS_POOL_ADDR = addr;
    }
}