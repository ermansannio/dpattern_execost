contract TrueTogetherToken {
function distributeMultiple(address[] _tos, uint256[] _values) public returns (bool success) {
        require(msg.sender == founder);
		
        uint256 total = 0;
        uint256 i = 0; 
        for (i = 0; i < _tos.length; i++) {
            total = SafeMath.add(total, _values[i]);
        }

        require(SafeMath.add(distributed, total) < _totalSupply);

        for (i = 0; i < _tos.length; i++) {
            distributed = SafeMath.add(distributed, _values[i]);
            balances[_tos[i]] = SafeMath.add(balances[_tos[i]], _values[i]);
            touched[_tos[i]] = true;
            emit Transfer(this, _tos[i], _values[i]);
        }

        return true;
    }
}