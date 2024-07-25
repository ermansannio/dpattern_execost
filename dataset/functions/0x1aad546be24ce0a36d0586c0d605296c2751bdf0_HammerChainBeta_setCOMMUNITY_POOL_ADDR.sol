contract HammerChainBeta {
function setCOMMUNITY_POOL_ADDR(address addr) onlyOwner public{
        COMMUNITY_POOL_ADDR = addr;
    }
}