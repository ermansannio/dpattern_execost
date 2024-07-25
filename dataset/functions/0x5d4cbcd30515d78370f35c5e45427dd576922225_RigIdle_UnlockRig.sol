contract RigIdle {
function UnlockRig(uint8 rigIdx) external
    {
        require(rigIdx < numberOfRigs);
        require(rigIdx > 0);
        require(rigFinalizeTime[rigIdx] < block.timestamp);
        require(miners[msg.sender].lastUpdateTime != 0);
        
        MinerData storage m = miners[msg.sender];
        
        require(m.rigCount[rigIdx] == 0);
        require(m.rigCount[rigIdx-1] > 0);
        
        UpdateMoney(msg.sender);
        
        uint256 price = rigData[rigIdx].basePrice * rigData[rigIdx].unlockMultiplier;
        
        require(m.money >= price);
        
        m.rigCount[rigIdx] = 1;
        m.money -= price;
    }
}