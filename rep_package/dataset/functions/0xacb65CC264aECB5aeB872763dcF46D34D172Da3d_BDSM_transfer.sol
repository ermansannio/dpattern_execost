contract BDSM {
function transfer(address _to, uint256 _value) returns (bool) {
		require (_to != 0x0);
		balances[msg.sender] = sub(balances[msg.sender], _value);
		balances[_to] = add(balances[_to], _value);
		Transfer(msg.sender, _to, _value);
		return true;
	}
}