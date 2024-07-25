contract ThreeQueens {
function spawn()
    external {
        uint8 playerID = checkAndGetSendersID();
        
        uint numBlocksPassed = block.number - colonies[playerID].lastSpawnBN;
        uint maxSpawnTimeConstraint = numBlocksPassed; // Could change this in the future
        
        uint maxSpawnFoodConstraint = colonies[playerID].food / getAntCost(colonies[playerID].spawningType);
        
        uint spawnNumber;
        if (maxSpawnTimeConstraint < maxSpawnFoodConstraint) spawnNumber = maxSpawnTimeConstraint;
        else spawnNumber = maxSpawnFoodConstraint;
        
        spawnAnts(playerID, spawnNumber, colonies[playerID].spawningType);
    }
}