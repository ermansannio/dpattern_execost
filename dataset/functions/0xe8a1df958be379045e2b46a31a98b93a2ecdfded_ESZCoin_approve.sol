contract ESZCoin {
function approve(
        address _spender,
        uint256 _amount
    )
        public
        returns (bool)
    {
        allowed[msg.sender][_spender] = _amount;
        Approval(msg.sender, _spender, _amount);
        return true;
    }
}