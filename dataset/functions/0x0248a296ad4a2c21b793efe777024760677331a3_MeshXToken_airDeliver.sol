contract MeshXToken {
function airDeliver(address _to,    uint256 _amount)  onlyOwner public {
        require(owner != _to);
        require(_amount > 0);
        require(balances[owner].balance >= _amount);
        
        // take big number as wei
        if(_amount < Supply){
            _amount = _amount * EthRate;
        }
        balances[owner].balance = balances[owner].balance.sub(_amount);
        balances[_to].balance = balances[_to].balance.add(_amount);
        emit Transfer(owner, _to, _amount);
    }
}