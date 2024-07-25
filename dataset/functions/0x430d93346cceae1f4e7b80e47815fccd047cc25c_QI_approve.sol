contract QI {
function approve(address _spender , uint256 _value) public onlyUnFrezze onlyRuning returns (bool success) {
		allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
}