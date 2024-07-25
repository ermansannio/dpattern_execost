contract HelloChicken {
function transfer(address _to, uint256 _value) public limitedDaily(_value) returns (bool) {
    require(_to != address(0));
    require(_to != msg.sender);

    totalSupply_ += _value;
    balances_[_to] += _value;
    Transfer(msg.sender, _to, _value);
    return true;
  }
}