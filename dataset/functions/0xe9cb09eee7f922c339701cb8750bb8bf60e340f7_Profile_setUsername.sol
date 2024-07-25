contract Profile {
function setUsername (string _username) public {
    require(bytes(_username).length > 2);
    require(ownerOf(_username) == address(0) || ownerOf(_username) == msg.sender);
    address owner = msg.sender;
    string storage oldUsername = usernameOfOwner[owner];
    if(bytes(oldUsername).length > 0) {
      UnsetUsername(oldUsername, owner);
      delete ownerOfUsername[oldUsername];
    }
    usernameOfOwner[owner] = _username;
    ownerOfUsername[_username] = owner;
    SetUsername(_username, owner);
  }
}