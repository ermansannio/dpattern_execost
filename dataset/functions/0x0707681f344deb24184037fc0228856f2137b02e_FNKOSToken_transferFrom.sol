contract FNKOSToken {
function transferFrom(address _from, address _to, uint256 _amount) isRunning onlyPayloadSize(3 * 32) public returns (bool   success) {
        require(_from   != address(0) && _to != address(0));
        require(_amount <= allowed[_from][msg.sender]);
        uint freezeAmount = freezeOf(_from);
        uint256 _balance = safeSub(balances[_from].balance, freezeAmount);
        require(_amount <= _balance);
        
        balances[_from].balance = safeSub(balances[_from].balance,_amount);
        allowed[_from][msg.sender] = safeSub(allowed[_from][msg.sender],_amount);
        balances[_to].balance = safeAdd(balances[_to].balance,_amount);
        emit Transfer(_from, _to, _amount);
        return true;
    }
}