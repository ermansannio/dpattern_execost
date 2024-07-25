contract SnailFarm2 {
function HatchEggs() public payable {
        require(gameStarted);
        require(msg.value == HATCHING_COST);		
        
        PotSplit(msg.value);
        uint256 eggsUsed = ComputeMyEggs();
        uint256 newSnail = (eggsUsed.div(TIME_TO_HATCH_1SNAIL)).mul(playerProdBoost[msg.sender]);
        claimedEggs[msg.sender]= 0;
        lastHatch[msg.sender]= now;
        hatcherySnail[msg.sender] = hatcherySnail[msg.sender].add(newSnail);
        
        emit Hatched(msg.sender, eggsUsed, newSnail);
    }
}