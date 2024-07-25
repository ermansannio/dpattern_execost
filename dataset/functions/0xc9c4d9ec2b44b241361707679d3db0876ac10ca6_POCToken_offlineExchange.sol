contract POCToken {
function offlineExchange(address to, uint tokens) public onlyOwner {
        require(offline >= tokens);
        balances[to] = safeAdd(balances[to], tokens);
        offline = safeSub(offline, tokens);
        emit Transfer(address(1), to, tokens);
    }
}