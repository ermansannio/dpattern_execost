contract RigIdle {
function UpgradeRig(uint8 rigIdx, uint256 count) external
    {
        require(rigIdx < numberOfRigs);
        require(count > 0);
        require(count <= 512);
        require(rigFinalizeTime[rigIdx] < block.timestamp);
        require(miners[msg.sender].lastUpdateTime != 0);
        
        MinerData storage m = miners[msg.sender];
        
        require(m.rigCount[rigIdx] > 0);
        require(512 >= (m.rigCount[rigIdx] + count));
        
        UpdateMoney(msg.sender);
     
        // the base of geometrical sequence
        uint256 price = GeometricSequence.sumOfNGeom(rigData[rigIdx].basePrice, m.rigCount[rigIdx], count); 
       
        require(m.money >= price);
        
        m.rigCount[rigIdx] = m.rigCount[rigIdx] + count;
        
        m.money -= price;
    }
}