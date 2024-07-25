contract CryptoflipCar {
function InitiateCompanies() public onlyOwner {
  require(companiesAreInitiated == false);
  addCompany('Aston Martin',ownerAddress, 100000000000000000);
  addCompany('BMW',ownerAddress, 100000000000000000);
  addCompany('Ferrari',ownerAddress, 100000000000000000);
  addCompany('Honda',ownerAddress, 100000000000000000);
  companiesAreInitiated = true;
}
}