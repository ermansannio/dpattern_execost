contract DAppTest {
function changeBoolean() public returns (bool success) {
    _is = !_is;
    return true;
  }
}