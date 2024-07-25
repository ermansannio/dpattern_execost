contract HammerChainBeta {
function sendIncentive() onlyOwner public{
        require(limitIncentive < totalSupply/2);
        if (timeIncentive < now){
            if (timeIncentive == 0x0){
                _transfer(owner,INCENTIVE_POOL_ADDR,totalSupply/10);
                limitIncentive += totalSupply/10;
            }
            else{
                _transfer(owner,INCENTIVE_POOL_ADDR,totalSupply/20);
                limitIncentive += totalSupply/20;
            }
            timeIncentive = now + 365 days;
        }
    }
}