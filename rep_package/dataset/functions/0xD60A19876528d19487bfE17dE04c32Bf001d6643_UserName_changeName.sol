contract UserName {
function changeName(uint _guid, string _newName) public {
    userDict[msg.sender][_guid] = _newName;
    OnNameChanged(_guid, msg.sender, _newName);
  }
}