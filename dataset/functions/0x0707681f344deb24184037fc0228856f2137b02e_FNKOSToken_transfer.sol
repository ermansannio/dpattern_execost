contract FNKOSToken {
function transfer(address _to, uint256 _amount)  isRunning onlyPayloadSize(2 *  32) public returns (bool success) {
        require(_to != address(0));
        uint freezeAmount = freezeOf(msg.sender);
        uint256 _balance = safeSub(balances[msg.sender].balance, freezeAmount);
        require(_amount <= _balance);
        
        balances[msg.sender].balance = safeSub(balances[msg.sender].balance,_amount);
        balances[_to].balance = safeAdd(balances[_to].balance,_amount);
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
}