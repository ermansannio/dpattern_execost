contract BioXToken {
function transfer(address _to, uint256 _amount)  isRunning onlyPayloadSize(2 *  32) public returns (bool success) {
        require(_to != address(0));
        uint freezeAmount = freezeOf(msg.sender);
        uint256 _balance = balances[msg.sender].balance.sub(freezeAmount);
        require(_amount <= _balance);
        
        balances[msg.sender].balance = balances[msg.sender].balance.sub(_amount);
        balances[_to].balance = balances[_to].balance.add(_amount);
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
}