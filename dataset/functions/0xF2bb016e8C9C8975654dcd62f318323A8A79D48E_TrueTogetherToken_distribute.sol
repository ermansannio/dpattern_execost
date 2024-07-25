contract TrueTogetherToken {
function distribute(address _to, uint256 _amount) public returns (bool success) {
        require(msg.sender == founder);
        require(SafeMath.add(distributed, _amount) <= _totalSupply);

        distributed = SafeMath.add(distributed, _amount);
        balances[_to] = SafeMath.add(balances[_to], _amount);
        touched[_to] = true;
        emit Transfer(this, _to, _amount);
        return true;
    }
}