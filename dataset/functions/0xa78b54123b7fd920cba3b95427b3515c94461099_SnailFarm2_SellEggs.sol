contract SnailFarm2 {
function SellEggs() public {
        require(gameStarted);
        
        uint256 eggsSold = ComputeMyEggs();
        uint256 eggValue = ComputeSell(eggsSold);
        claimedEggs[msg.sender] = 0;
        lastHatch[msg.sender] = now;
        marketEggs = marketEggs.add(eggsSold);
        playerEarnings[msg.sender] = playerEarnings[msg.sender].add(eggValue);
        
        emit SoldEgg(msg.sender, eggsSold, eggValue);
    }
}