contract CryptoflipCar {
function InitiateCars() public onlyOwner {
  require(carsAreInitiated == false);
  addCar('1964 DB5 James Bond Edition',ownerAddress, 0, 0, 5000000000000000);
  addCar('Blue 1965 ',ownerAddress, 0, 0, 5000000000000000);
  addCar('1964 DB5 James Bond Edition',ownerAddress,0,0,5000000000000000);
  addCar('Blue 1965 ',ownerAddress,0,0,5000000000000000);
  carsAreInitiated = true;
}
}