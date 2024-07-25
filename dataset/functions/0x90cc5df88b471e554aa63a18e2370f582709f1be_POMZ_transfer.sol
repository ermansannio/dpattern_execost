contract POMZ {
function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0));
        require(balances[msg.sender] >= _value);
        require(balances[_to] + _value >= balances[_to]);

        uint256 previousBalances = balances[_to];
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        assert(balances[_to].sub(_value) == previousBalances);
        return true;
    }
}