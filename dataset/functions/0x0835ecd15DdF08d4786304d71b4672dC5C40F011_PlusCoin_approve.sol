contract PlusCoin {
function approve(address _spender, uint256 _value) 
        onlyOwnerBeforeFree
        returns (bool success)
    {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
}