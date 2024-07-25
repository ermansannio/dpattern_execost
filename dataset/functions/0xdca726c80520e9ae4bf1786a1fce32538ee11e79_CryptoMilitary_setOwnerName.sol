contract CryptoMilitary {
function setOwnerName (address _owner, string _name) public {
    require(keccak256(ownerNameOfItem[_owner]) != keccak256(_name));
    ownerNameOfItem[_owner] = _name;
  }
}