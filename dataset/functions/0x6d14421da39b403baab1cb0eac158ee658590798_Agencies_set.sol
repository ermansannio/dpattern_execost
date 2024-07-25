contract Agencies {
function set (string _agency) public {
    require(bytes(_agency).length > 2);
    require(ownerOf(_agency) == address(0));

    address owner = msg.sender;
    string storage oldAgency = agencyOfOwner[owner];

    if (bytes(oldAgency).length > 0) {
      Unset(oldAgency, owner);
      delete ownerOfAgency[oldAgency];
    }

    agencyOfOwner[owner] = _agency;
    ownerOfAgency[_agency] = owner;
    Set(_agency, owner);
  }
}