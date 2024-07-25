contract Profile {
function set (string _username, string _agenda) public {
    require(bytes(_username).length > 2);
    require(bytes(_agenda).length > 2);
    require(ownerOf(_username) == address(0) || ownerOf(_username) == msg.sender);
    address owner = msg.sender;
    string storage oldUsername = usernameOfOwner[owner];
    string storage oldAgenda = agendaOfOwner[owner];
    if (bytes(oldUsername).length > 0 && bytes(oldAgenda).length > 0) {
      Unset(oldUsername, oldAgenda, owner);
      delete ownerOfUsername[oldUsername];
    }
    usernameOfOwner[owner] = _username;
    agendaOfOwner[owner] = _agenda;
    ownerOfUsername[_username] = owner;
    Set(_username, _agenda, owner);
  }
}