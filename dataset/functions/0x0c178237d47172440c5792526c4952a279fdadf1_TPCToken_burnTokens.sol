contract TPCToken {
function burnTokens(uint tokensAmount)
    isTokenTransfer
    external
    {
        require(_balances[msg.sender] >= tokensAmount);
        _balances[msg.sender] = _balances[msg.sender].sub(tokensAmount);
        _supply = _supply.sub(tokensAmount);
        emit TokenBurned(msg.sender, tokensAmount);
    }
}