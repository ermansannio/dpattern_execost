contract YourCustomTokenJABACO {
function transfer(address _to, uint256 _amount) public returns (bool success) {
    balances[msg.sender] = balances[msg.sender].sub(_amount);
    balances[_to] = balances[_to].add(_amount);
    Transfer(msg.sender,_to,_amount);
    return true;
  }
}