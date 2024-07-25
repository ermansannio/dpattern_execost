contract BowdenCoin {
function approve(address spender, uint256 value) public returns (bool success){
    allowance[msg.sender][spender] = value;
    Approval(msg.sender, spender, value);
    return true;
  }
}