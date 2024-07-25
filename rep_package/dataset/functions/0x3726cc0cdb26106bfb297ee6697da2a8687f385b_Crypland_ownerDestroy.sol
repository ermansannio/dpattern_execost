contract Crypland {
function ownerDestroy() external whenOwner {
    selfdestruct(owner);
  }
}