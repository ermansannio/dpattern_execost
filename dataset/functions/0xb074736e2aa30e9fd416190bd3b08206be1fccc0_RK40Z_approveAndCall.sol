contract RK40Z {
function approveAndCall(address _spender, uint256 _value) public returns (bool success) {
        require(!SC_locked);
		require(!frozenAccount[msg.sender]);
		require(!frozenAccount[_spender]);
		
        if (approve(_spender, _value)) {
            return true;
        }
    }
}