contract DRSCoin {
function approve(address _spender, uint256 _value) public returns(bool success) {
        allowance[msg.sender][_spender] = _value;                 // Set allowance
        emit Approval(msg.sender, _spender, _value);              // Raise Approval event
        return true;
    }
}