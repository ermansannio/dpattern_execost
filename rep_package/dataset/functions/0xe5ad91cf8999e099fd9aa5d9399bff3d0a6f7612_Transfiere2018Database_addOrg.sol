contract Transfiere2018Database {
function addOrg(string _codigo, string _nombre, string _tipo) public {
    require(msg.sender == owner);
    availableOrgs.push(Organization(_codigo, _nombre, _tipo));
  }
}