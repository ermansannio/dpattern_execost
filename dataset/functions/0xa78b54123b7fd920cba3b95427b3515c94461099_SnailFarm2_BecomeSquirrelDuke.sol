contract SnailFarm2 {
function BecomeSquirrelDuke() public {
        require(gameStarted);
        require(hasStartingSnails[msg.sender] == true);
        require(playerAcorns[msg.sender] >= squirrelReq);
        
        // Remove sacrificed acorns, change totalAcorns in consequence, increase req
        playerAcorns[msg.sender] = playerAcorns[msg.sender].sub(squirrelReq);
		totalAcorns = totalAcorns.sub(squirrelReq);
        squirrelReq = squirrelReq.mul(2);
        
        // Lower prodBoost of old squirrel owner
        playerProdBoost[currentSquirrelOwner] = playerProdBoost[currentSquirrelOwner].sub(SQUIRREL_BOOST);
        
        // Give ownership to msg.sender, then increases his prodBoost
        currentSquirrelOwner = msg.sender;
        playerProdBoost[currentSquirrelOwner] = playerProdBoost[currentSquirrelOwner].add(SQUIRREL_BOOST);
        
        emit BecameDuke(msg.sender, round, squirrelReq);
    }
}