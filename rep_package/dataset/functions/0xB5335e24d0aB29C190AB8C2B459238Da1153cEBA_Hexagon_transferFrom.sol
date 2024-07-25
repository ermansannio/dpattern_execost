contract Hexagon {
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    /* Prevent transfer of not allowed tokens */
    require(allowance[_from][msg.sender] >= _value);
    /* Remove tokens from allowance */
    allowance[_from][msg.sender] -= _value;

    _transfer(_from, _to, _value);

    return true;
  }
}