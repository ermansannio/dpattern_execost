contract Transfiere2018Database {
function destroy() public {
      require(msg.sender == owner);
      selfdestruct(owner);
  }
}