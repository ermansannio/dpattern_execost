contract SMINT {
function transferAndFreeze(address _to, uint _value) onlyOwner external {
        require(_to != 0x0);
        require(balanceOf[owner] >= _value);
        require(frozenBalanceOf[_to] + _value > frozenBalanceOf[_to]);
        balanceOf[owner] -= _value;
        frozenBalanceOf[_to] += _value;
        Transfer(owner, this, _value);
    }
}