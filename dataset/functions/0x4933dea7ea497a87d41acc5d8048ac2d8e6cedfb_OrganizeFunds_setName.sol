contract OrganizeFunds {
function setName(string _name) public ownerOnly {
    name = _name;
  }
}