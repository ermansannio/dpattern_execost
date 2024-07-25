contract RK40Z {
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // Only allow transfer once Locked
        // Once it is Locked, it is Locked forever and no one can lock again
        require(!SC_locked);
		require(!frozenAccount[_from]);
		require(!frozenAccount[_to]);
		
        // Protect against wrapping uints.
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value && balances[_to] + _value > balances[_to]);
        uint256 allowance = allowed[_from][owner];
        require(balances[_from] >= _value && allowance >= _value);
        balances[_to] = safeAdd(balanceOf(_to), _value);
        balances[_from] = safeSub(balanceOf(_from), _value);
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] = safeSub(allowed[_from][msg.sender], _value);
        }
        emit Transfer(_from, _to, _value);
        return true;
    }
}