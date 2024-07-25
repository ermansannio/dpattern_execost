contract FarmChain {
function transfer(address _to, uint256 _value) public onlyRuning onlyUnFrezze onlyPayloadSize(32 * 2) returns (bool success){
        require(_to != 0x0);
        require( balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]); 
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);                     
        balanceOf[_to] = balanceOf[_to].add(_value);                            
        emit Transfer(msg.sender, _to, _value); 
        return true;
    }
}