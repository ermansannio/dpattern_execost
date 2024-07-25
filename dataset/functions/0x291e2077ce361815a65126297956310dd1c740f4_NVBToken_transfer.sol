contract NVBToken {
function transfer (address _to, uint256 _value)
    public returns (bool success) {
    if (frozen) return false;
    else return AbstractToken.transfer (_to, _value);
  }
}