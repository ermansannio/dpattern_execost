contract ChiToken {
function approve(address _spender, uint256 _value) public returns (bool) {
        allowances[msg.sender][_spender] = _value;

        Approval(msg.sender, _spender, _value);

        return true;
    }
}