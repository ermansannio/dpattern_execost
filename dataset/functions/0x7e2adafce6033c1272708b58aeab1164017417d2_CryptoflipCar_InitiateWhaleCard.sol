contract CryptoflipCar {
function InitiateWhaleCard() public onlyOwner {
    require(whalecardAreInitiated == false);
    whalecard.ownerAddress = ownerAddress;
    whalecard.curPrice = 100000000000000000;
    whalecardAreInitiated = true;
}
}