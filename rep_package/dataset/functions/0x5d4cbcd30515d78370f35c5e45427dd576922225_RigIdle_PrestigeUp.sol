contract RigIdle {
function PrestigeUp() external
    {
        require(miners[msg.sender].lastUpdateTime != 0);
        require(prestigeFinalizeTime[m.prestigeLevel] < block.timestamp);
        
        MinerData storage m = miners[msg.sender];
        
        require(m.prestigeLevel < maxPrestige);
        
        UpdateMoney(msg.sender);
        
        require(m.money >= prestigeData[m.prestigeLevel].price);
        
        if(referrals[msg.sender] != 0)
        {
            miners[referrals[msg.sender]].money += prestigeData[m.prestigeLevel].price / 2;
        }
        
        for(uint256 i = 0; i < numberOfRigs; ++i)
        {
            if(m.rigCount[i] > 1)
                m.rigCount[i] = m.rigCount[i] / 2; 
        }
        
        m.money = 0;
        m.prestigeBonusPct += prestigeData[m.prestigeLevel].productionBonusPct;
        m.prestigeLevel += 1;
    }
}