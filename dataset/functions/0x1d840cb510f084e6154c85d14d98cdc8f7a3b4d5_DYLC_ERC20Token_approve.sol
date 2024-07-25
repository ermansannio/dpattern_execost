contract DYLC_ERC20Token {
function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        //Approval(msg.sender, _spender, _value);
        return true;
    }
}