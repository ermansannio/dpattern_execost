contract TrueTogetherToken {
function transfer(address _to, uint256 _value) public returns (bool success) {
        require (_to != 0x0);

        if (now > voteEndTime) {
            require((balances[msg.sender] >= _value));
            balances[msg.sender] = SafeMath.sub(balances[msg.sender], _value);
            balances[_to] = SafeMath.add(balances[_to], _value);
            emit Transfer(msg.sender, _to, _value);
            return true;	 
        } else {
            require(balances[msg.sender] >= SafeMath.add(frozen[msg.sender], _value));
            balances[msg.sender] = SafeMath.sub(balances[msg.sender], _value);
            balances[_to] = SafeMath.add(balances[_to], _value);
            emit Transfer(msg.sender, _to, _value);
            return true;	 
        }
    }
}