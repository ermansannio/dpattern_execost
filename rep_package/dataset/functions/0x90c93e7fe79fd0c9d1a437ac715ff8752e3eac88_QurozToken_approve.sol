contract QurozToken {
function approve(address _spender, uint256 _value) public whenNotPaused returns (bool) {
      //StandardToken.sol, PausableToken.sol
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }
}