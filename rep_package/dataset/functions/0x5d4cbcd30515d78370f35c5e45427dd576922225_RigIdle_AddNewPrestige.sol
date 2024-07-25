contract RigIdle {
function AddNewPrestige(uint256 idx, uint256 _price, uint256 _bonusPct) public
    {
        require(msg.sender == owner);
        require(idx <= maxPrestige);
        
        if(idx < maxPrestige)
            require(prestigeFinalizeTime[idx] > block.timestamp); 
            
        prestigeFinalizeTime[idx] = block.timestamp + 7200;
        
        prestigeData[idx].price = _price;
        prestigeData[idx].productionBonusPct = _bonusPct;
        
        if(idx == maxPrestige)
            maxPrestige += 1;
    }
}