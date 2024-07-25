contract TimetechToken {
function setName(string _name) public {
    require(bytes(_name).length != 0);
    name = _name;
    emit NameChanged();
  }
}