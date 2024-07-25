contract RDFDM {
function haraKiri() public ownerOnly unlockedOnly {
    selfdestruct(owner);
  }
}