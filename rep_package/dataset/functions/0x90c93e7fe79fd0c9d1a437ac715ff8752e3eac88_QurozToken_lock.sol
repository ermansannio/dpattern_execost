contract QurozToken {
function lock(address _lockAddress) public onlyOwner returns (bool) {  // stop _lockAddress's transfer
    require(_lockAddress != address(0));
    require(_lockAddress != owner);
    require(locked[_lockAddress] != true);
    locked[_lockAddress] = true;
    emit Lock(_lockAddress);
    return true;
  }
}