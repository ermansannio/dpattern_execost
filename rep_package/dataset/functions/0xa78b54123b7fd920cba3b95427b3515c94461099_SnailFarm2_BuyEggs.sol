contract SnailFarm2 {
function BuyEggs() public payable {
        require(gameStarted);
        require(hasStartingSnails[msg.sender] == true);
        require(msg.sender != gameOwner);
        
        uint256 eggsBought = ComputeBuy(msg.value);
        PotSplit(msg.value);
        marketEggs = marketEggs.sub(eggsBought);
        claimedEggs[msg.sender] = claimedEggs[msg.sender].add(eggsBought);
        
        emit BoughtEgg(msg.sender, eggsBought, msg.value);
    }
}