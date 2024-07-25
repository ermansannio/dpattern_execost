contract QurozToken {
function unlock(address _lockAddress) public onlyOwner returns (bool) {
    require(_lockAddress != address(0));
    require(_lockAddress != owner);
    require(locked[_lockAddress] ==  true);
    locked[_lockAddress] = false;
    emit Unlock(_lockAddress);
    return true;
  }
}