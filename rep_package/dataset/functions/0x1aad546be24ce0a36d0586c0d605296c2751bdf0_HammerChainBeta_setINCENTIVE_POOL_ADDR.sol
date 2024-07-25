contract HammerChainBeta {
function setINCENTIVE_POOL_ADDR(address addr) onlyOwner public{
        INCENTIVE_POOL_ADDR = addr;
    }
}