contract RigIdle {
function AddNewBooster(uint256 idx, int256 _rigType, uint256 _flatBonus, uint256 _pctBonus, 
      uint256 _ETHPrice, uint256 _priceIncreasePct, uint256 _totalCount) external
    {
        require(msg.sender == owner);
        require(idx <= numberOfBoosts);
        
        if(idx < numberOfBoosts)
            require(boostFinalizeTime[idx] > block.timestamp); 
            
        boostFinalizeTime[idx] = block.timestamp + 7200;
        
        boostData[idx].rigIndex = _rigType;
        boostData[idx].flatBonus = _flatBonus;
        boostData[idx].percentBonus = _pctBonus;
        
        boostData[idx].priceInWEI = _ETHPrice;
        boostData[idx].priceIncreasePct = _priceIncreasePct;
        boostData[idx].totalCount = _totalCount;
        boostData[idx].currentIndex = 0;
        
        boostData[idx].boostHolders = new address[](_totalCount);
        
        for(uint256 i = 0; i < _totalCount; ++i)
            boostData[idx].boostHolders[i] = owner;
        
        if(idx == numberOfBoosts)    
            numberOfBoosts += 1;
    }
}