contract TestSale {
function setActive(bool _active) public ownerOnly {
    active = _active;
  }
}