contract CryptoflipCar {
function purchaseWhaleCard() public payable {
    require(msg.value >= whalecard.curPrice);
    require(isPaused == false);
    require(whalecardAreInitiated == true);
    uint256 totalpercent = 155;
    uint256 commission5percent = div(mul(msg.value, 5) , totalpercent);
    foundTeamAddress.transfer(commission5percent);    
    uint256 commissionOwner = msg.value - commission5percent;
    whalecard.ownerAddress.transfer(commissionOwner);    
    whalecard.ownerAddress = msg.sender;
    whalecard.curPrice = div(mul(whalecard.curPrice, totalpercent), 100);
}
}