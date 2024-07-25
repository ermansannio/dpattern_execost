contract WalesaToken {
function transferFrom(address from, address to, uint256 value) public returns (bool) {
        require(allowed[from][msg.sender] >= value);
        if (allowed[from][msg.sender] < MAX_UINT256) {
            allowed[from][msg.sender] -= value;
        }
        walesaDawajNaszeStoMilionow(from);
        walesaDawajNaszeStoMilionow(to);
        require(balances[from] >= value);
        balances[from] -= value;
        balances[to] += value;
        Transfer(from, to, value);
        return true;
    }
}