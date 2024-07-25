contract CryptoflipCar {
function InitiateMakes() public onlyOwner {
  require(makesAreInitiated == false);
  addMake('DB5',ownerAddress,0,10000000000000000);
  addMake('DB6',ownerAddress,0,10000000000000000);
  addMake('DB9',ownerAddress,0,10000000000000000);
  addMake('One-77',ownerAddress,0,10000000000000000);
  makesAreInitiated = true;
}
}