contract RDFDM {
function setManager(address _manager) public managerOnly { manager = _manager; }
}