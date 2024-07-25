contract ASIToken {
function transfer(address _to, uint256 _value) public returns (bool success){
        if (_to == 0x0) revert(); 
        if (_value <= 0) revert(); 
        if (balanceOf[msg.sender] < _value) revert();
        if (balanceOf[_to] + _value < balanceOf[_to]) revert();
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}