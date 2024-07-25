contract Hexagon {
function approve(address _spender, uint256 _value) public returns (bool success) {
    /* Check if the sender has already  */
    require(_value == 0 || allowance[msg.sender][_spender] == 0);
    /* Add to allowance  */
    allowance[msg.sender][_spender] = _value;
    /* Notify network */
    Approval(msg.sender, _spender, _value);

    return true;
  }
}