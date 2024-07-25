contract Nickelcoin {
function transfer(address _to, uint256 _value) public returns (bool success) {
   
    require(funds[msg.sender] >= _value && funds[_to].add(_value) >= funds[_to]);

    
    funds[msg.sender] = funds[msg.sender].sub(_value); 
    funds[_to] = funds[_to].add(_value);       
  
    Transfer(msg.sender, _to, _value); 
    return true;
    }
}