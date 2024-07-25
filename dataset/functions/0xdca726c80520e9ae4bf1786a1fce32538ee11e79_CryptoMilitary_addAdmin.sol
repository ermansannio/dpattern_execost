contract CryptoMilitary {
function addAdmin (address _admin) onlyOwner() public {
    admins[_admin] = true;
  }
}