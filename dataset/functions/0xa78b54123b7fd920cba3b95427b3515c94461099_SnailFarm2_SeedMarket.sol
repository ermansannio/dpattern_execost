contract SnailFarm2 {
function SeedMarket(uint256 _eggs, uint256 _acorns) public payable {
        require(msg.value > 0);
        require(round == 0);
        require(msg.sender == gameOwner);
        
        marketEggs = _eggs.mul(TIME_TO_HATCH_1SNAIL); //for readability
        snailPot = msg.value.div(10); //10% to the snailpot
        treePot = msg.value.sub(snailPot); //remainder to the treepot
		previousSnailPot = snailPot.mul(10); //encourage early acorn funding
        totalAcorns = _acorns; 
        playerAcorns[msg.sender] = _acorns.mul(99).div(100); 
        spiderReq = SPIDER_BASE_REQ;
        tadpoleReq = TADPOLE_BASE_REQ;
		squirrelReq = SQUIRREL_BASE_REQ;
        round = 1;
        gameStarted = true;
    }
}