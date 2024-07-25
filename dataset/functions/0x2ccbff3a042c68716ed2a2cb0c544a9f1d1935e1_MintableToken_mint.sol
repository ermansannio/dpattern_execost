contract MintableToken {
function mint(address _to, uint256 _amount) onlyOwner canMint public returns (bool) {
        require(_amount < hardCap);
        totalSupply = totalSupply.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        Mint(_to, _amount);
        Transfer(0x0, _to, _amount);
        return true;
    }
}