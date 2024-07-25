contract QI {
function transferFrom(address _from, address _to, uint256 _value) public onlyUnFrezze onlyRuning returns (bool success) {
            
            assert(balanceOf[_from] >= _value);
            assert(allowance[_from][msg.sender] >= _value);
            balanceOf[_from] = balanceOf[_from].sub(_value);
            allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);
            balanceOf[_to] = balanceOf[_to].add(_value);
            emit Transfer(_from, _to, _value);
            return true;
    }
}