contract OdinToken {
function burn(uint  _value) onlyOwner public returns (bool) {
        require((balances[owner].balance -  _value) >= 0);
        balances[owner].balance = balances[owner].balance.sub( _value);
        totalSupply = totalSupply.sub( _value);
        emit Burn( _value);
        return true;
    }
}