contract Hexagon {
function burn(uint256 _value) public returns (bool success) {
    /* Check if the sender has enough */
    require(balanceOf[msg.sender] >= _value);
    /* Subtract from the sender */
    balanceOf[msg.sender] -= _value;
    /* Send to the black hole */
    balanceOf[0x0] += _value;
    /* Update current supply */
    currentSupply -= _value;
    /* Notify network */
    Burn(msg.sender, _value);

    return true;
  }
}