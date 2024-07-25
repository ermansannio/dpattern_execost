contract CoinvestToken {
function approve(address _spender, uint256 _amount) 
      external
      transferable // Protect from unlikely maintainer-receiver trickery
    {
        require(balances[msg.sender] >= _amount);
        
        allowed[msg.sender][_spender] = _amount;
        Approval(msg.sender, _spender, _amount);
    }
}