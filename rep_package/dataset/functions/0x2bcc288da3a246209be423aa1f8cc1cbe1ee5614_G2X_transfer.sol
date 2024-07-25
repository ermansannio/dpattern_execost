contract G2X {
function transfer(address _to, uint256 _value) public returns (bool success) {
        require (_to != (0x0));
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value); 
        return true;
    }
}