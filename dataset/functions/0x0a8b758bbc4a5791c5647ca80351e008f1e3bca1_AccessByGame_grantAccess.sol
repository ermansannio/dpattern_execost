contract AccessByGame {
function grantAccess(address _address)
    onlyOwner
    public
  {
    contractAccess[_address] = true;
  }
}