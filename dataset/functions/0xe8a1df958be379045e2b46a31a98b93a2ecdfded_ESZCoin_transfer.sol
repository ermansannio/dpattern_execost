contract ESZCoin {
function transfer(
        address _recipient,
        uint256 _amount
    )
        public
        returns (bool)
    {
        require(accountLock[msg.sender] == false);
        require(transferCheck(msg.sender, _recipient, _amount));
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        balances[_recipient] = balances[_recipient].add(_amount);
        Transfer(msg.sender, _recipient, _amount);
        return true;
    }
}