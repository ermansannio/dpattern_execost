contract SnailFarm2 {
function BecomeTadpolePrince() public payable {
        require(gameStarted);
        require(hasStartingSnails[msg.sender] == true);
        require(msg.value >= tadpoleReq);
        
        // If player sent more ETH than needed, refund excess to playerEarnings
        if (msg.value > tadpoleReq) {
            uint _excess = msg.value.sub(tadpoleReq);
            playerEarnings[msg.sender] = playerEarnings[msg.sender].add(_excess);
        }  
        
        // Calculate +10% from previous price
        // Give result to the potsplit
        uint _extra = tadpoleReq.div(12); 
        PotSplit(_extra);
        
        // Calculate 110% of previous price
        // Give result to the previous owner
        uint _previousFlip = tadpoleReq.mul(11).div(12);
        playerEarnings[currentTadpoleOwner] = playerEarnings[currentTadpoleOwner].add(_previousFlip);
        
        // Increase ETH required for next buy by 20%
        tadpoleReq = (tadpoleReq.mul(6)).div(5); 
        
        // Lower prodBoost of old tadpole owner
        playerProdBoost[currentTadpoleOwner] = playerProdBoost[currentTadpoleOwner].sub(TADPOLE_BOOST);
        
        // Give ownership to msg.sender, then increase his prodBoost
        currentTadpoleOwner = msg.sender;
        playerProdBoost[currentTadpoleOwner] = playerProdBoost[currentTadpoleOwner].add(TADPOLE_BOOST);
        
        emit BecamePrince(msg.sender, round, tadpoleReq);
    }
}