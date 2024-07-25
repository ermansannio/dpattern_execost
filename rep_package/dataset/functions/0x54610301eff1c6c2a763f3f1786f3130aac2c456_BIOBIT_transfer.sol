contract BIOBIT {
function transfer(address _to, uint256 _value)  public
    {       // Add the same to the recipient
            require(_to != 0x0);                               // Prevent transfer to 0x0 address. Use burn() instead
            require(balanceOf[msg.sender] >= _value);                // Check if the sender has enough
            require(balanceOf[_to] + _value > balanceOf[_to]); // Check for overflows
            balanceOf[msg.sender] -= _value;                         // Subtract from the sender
            balanceOf[_to] += _value;                           // Add the same to the recipient
            Transfer(msg.sender, _to, _value);
    }
}