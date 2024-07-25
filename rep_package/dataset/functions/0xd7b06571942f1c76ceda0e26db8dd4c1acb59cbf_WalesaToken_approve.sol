contract WalesaToken {
function approve(address spender, uint256 value) public returns (bool) {
        require(allowed[msg.sender][spender] == 0 || value == 0);
        allowed[msg.sender][spender] = value;
        Approval(msg.sender, spender, value);
        return true;
    }
}