contract SnailFarm2 {
function BecomeSpiderQueen() public {
        require(gameStarted);
        require(hatcherySnail[msg.sender] >= spiderReq);

        // Remove sacrificed snails, increase req
        hatcherySnail[msg.sender] = hatcherySnail[msg.sender].sub(spiderReq);
        spiderReq = spiderReq.mul(2);
        
        // Lower prodBoost of old spider owner
        playerProdBoost[currentSpiderOwner] = playerProdBoost[currentSpiderOwner].sub(SPIDER_BOOST);
        
        // Give ownership to msg.sender, then increases his prodBoost
        currentSpiderOwner = msg.sender;
        playerProdBoost[currentSpiderOwner] = playerProdBoost[currentSpiderOwner].add(SPIDER_BOOST);
        
        emit BecameQueen(msg.sender, round, spiderReq);
    }
}