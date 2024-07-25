contract ChiToken {
function transfer(address _to, uint256 _value) public returns (bool) {
        require(balances[msg.sender] >= _value);

        balances[msg.sender] -= _value;
        balances[_to] += _value;

        Transfer(msg.sender, _to, _value);

        return true;
    }
}