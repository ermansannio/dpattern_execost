contract SnailFarm2 {
function BuyStartingSnails() public payable {
        require(gameStarted);
        require(tx.origin == msg.sender);
        require(hasStartingSnails[msg.sender] == false);
        require(msg.value == STARTING_SNAIL_COST); 

        PotSplit(msg.value);
		hasStartingSnails[msg.sender] = true;
        lastHatch[msg.sender] = now;
		playerProdBoost[msg.sender] = 1;
        hatcherySnail[msg.sender] = startingSnailAmount;
        
        emit StartedSnailing(msg.sender, round);
    }
}