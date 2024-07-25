contract RK40Z {
function OWN_burnAddress(address _from, uint256 _value)  onlyOwner public returns (bool success) {
        require(balances[_from] >= _value);
        require(_value <= allowed[_from][owner]);
        balances[_from] -= _value;
        allowed[_from][msg.sender] -= _value;             
        totalSupply -= _value;
        emit Burn(_from, _value);
        return true;
    }
}