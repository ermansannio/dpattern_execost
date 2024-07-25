contract WalesaToken {
function transfer(address to, uint256 value) public returns (bool) {
        walesaDawajNaszeStoMilionow(msg.sender);
        walesaDawajNaszeStoMilionow(to);
        require(balances[msg.sender] >= value);
        balances[msg.sender] -= value;
        balances[to] += value;
        Transfer(msg.sender, to, value);
        return true;
    }
}