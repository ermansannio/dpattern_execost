contract FLEBToken {
function mint(address _to, uint256 _amount) public returns (bool) {
 
     require(msg.sender == owner);
     
     totalSupply = totalSupply + _amount;
     balances[_to] = balances[_to] + _amount;
     
     emit Mint(_to, _amount);
     emit Transfer(address(0), _to, _amount);
     
     return true;
 }
}