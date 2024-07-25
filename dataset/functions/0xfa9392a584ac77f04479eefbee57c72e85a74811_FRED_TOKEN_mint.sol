contract FRED_TOKEN {
function mint(address _user, uint256 _tokensAmount) public onlyOwner returns(bool) {
        uint256 newSupply = totalSupply.add(_tokensAmount);
        require(
            _user != address(0) &&
            _tokensAmount > 0 &&
             newSupply < hardCap
        );
        balances[_user] = balances[_user].add(_tokensAmount);
        totalSupply = newSupply;
        Transfer(0x0, _user, _tokensAmount);
        return true;
    }
}