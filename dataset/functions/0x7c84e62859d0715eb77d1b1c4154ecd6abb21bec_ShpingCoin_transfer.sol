contract ShpingCoin {
function transfer(address to, uint256 value) public returns (bool) {
        require(msg.sender == owner || msg.sender == operator || now > coinsaleDeadline);
        require(balances[msg.sender] - budgets[msg.sender] >= value);
        require(balances[to] + value >= balances[to]);
        
        balances[msg.sender] -= value;
        balances[to] += value;
        Transfer(msg.sender, to, value);
        return true;
    }
}