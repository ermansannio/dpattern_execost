contract KamaGamesToken {
function approve(address _spender, uint256 _value) public returns (bool) {
    require(_spender != address(0));

    allowed_[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }
}