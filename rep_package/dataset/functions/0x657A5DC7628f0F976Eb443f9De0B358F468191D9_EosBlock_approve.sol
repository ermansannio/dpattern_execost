contract EosBlock {
function approve(address _spender, uint256 _amount) public returns(bool success) {
        allowed[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }
}