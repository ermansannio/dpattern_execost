contract BurnTokens {
function destroy() public {
      assert(msg.sender == owner);
      selfdestruct(this);
  }
}