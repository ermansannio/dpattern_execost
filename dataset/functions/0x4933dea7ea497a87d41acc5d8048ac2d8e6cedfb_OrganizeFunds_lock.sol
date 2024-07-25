contract OrganizeFunds {
function lock() public ownerOnly {
    isLocked = true;
  }
}