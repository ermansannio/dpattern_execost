contract HammerChainBeta {
function sendFounders() onlyOwner public{
        require(limitFounders < totalSupply/20);
        if (timeFounders== 0x0 || timeFounders < now){
            _transfer(owner,FOUNDERS_POOL_ADDR,totalSupply/100);
            timeFounders = now + 365 days;
            limitFounders += totalSupply/100;
        }
    }
}