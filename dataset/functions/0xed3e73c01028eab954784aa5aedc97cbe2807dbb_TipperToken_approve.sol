contract TipperToken {
function approve(address _spender, uint256 _value) public returns (bool) {
    require(_value>0);
    require(balances[msg.sender]>_value);
    allowed[msg.sender][_spender] = 0;
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }
}