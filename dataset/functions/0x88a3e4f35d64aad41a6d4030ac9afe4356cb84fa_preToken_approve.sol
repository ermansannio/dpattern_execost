contract preToken {
function approve(address _spender, uint256 _value) public returns (bool success) {
    require(_spender != address(0));
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }
}