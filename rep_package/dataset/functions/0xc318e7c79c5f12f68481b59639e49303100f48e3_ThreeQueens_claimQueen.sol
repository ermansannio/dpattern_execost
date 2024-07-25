contract ThreeQueens {
function claimQueen(uint8 playerID)
    external {
        require(Queens[playerID] == 0x0);
        
        Queens[playerID] = msg.sender;
        
        colonies[playerID].food = 100;
        
        colonies[playerID].spawningType = AntType.Worker;
        colonies[playerID].lastSpawnBN = block.number;
    }
}