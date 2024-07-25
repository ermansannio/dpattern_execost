contract RigIdle {
function BuyBooster(uint256 idx) external payable 
    {
        require(miners[msg.sender].lastUpdateTime != 0);
        require(idx < numberOfBoosts);
        require(boostFinalizeTime[idx] < block.timestamp);
        
        BoostData storage b = boostData[idx];
        
        require(msg.value >= b.priceInWEI);
        
        for(uint i = 0; i < b.totalCount; ++i)
            if(b.boostHolders[i] == msg.sender)
                revert();
                
        address beneficiary = b.boostHolders[b.currentIndex];
        
        MinerData storage m = miners[beneficiary];
        MinerData storage m2 = miners[msg.sender];
        
        // distribute the ETH
        m.unclaimedPot += (msg.value * 9) / 10;
        honeyPotAmount += msg.value / 20;
        devFund += msg.value / 20;
        
        // increase price by X%
        b.priceInWEI += (b.priceInWEI * b.priceIncreasePct) / 100;
        
        UpdateMoney(msg.sender);
        UpdateMoney(beneficiary);
        
        // transfer ownership    
        b.boostHolders[b.currentIndex] = msg.sender;
        
        // handle booster bonuses
        if(m.rigFlatBonus[b.rigIndex] >= b.flatBonus){
            m.rigFlatBonus[b.rigIndex] -= b.flatBonus;
        } else {
            m.rigFlatBonus[b.rigIndex] = 0;
        }
        
        if(m.rigPctBonus[b.rigIndex] >= b.percentBonus) {
            m.rigPctBonus[b.rigIndex] -= b.percentBonus;
        } else {
            m.rigPctBonus[b.rigIndex] = 0;
        }
        
        m2.rigFlatBonus[b.rigIndex] += b.flatBonus;
        m2.rigPctBonus[b.rigIndex] += b.percentBonus;
        
        // increase booster index
        b.currentIndex += 1;
        if(b.currentIndex >= b.totalCount)
            b.currentIndex = 0;
    }
}