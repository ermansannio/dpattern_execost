contract NVBToken {
function burnTokens (uint256 _value) public returns (bool success) {
    if (_value > accounts [msg.sender]) return false;
    else if (_value > 0) {
      accounts [msg.sender] = safeSub (accounts [msg.sender], _value);
      tokenCount = safeSub (tokenCount, _value);

      Transfer (msg.sender, address (0), _value);
      return true;
    } else return true;
  }
}