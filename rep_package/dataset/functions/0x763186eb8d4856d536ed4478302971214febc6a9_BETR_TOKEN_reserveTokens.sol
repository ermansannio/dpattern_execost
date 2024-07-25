contract BETR_TOKEN {
function reserveTokens(address _user, uint256 _tokensAmount) external onlyOwner {
        uint256 newSupply = totalSupply.add(_tokensAmount.mul(10 ** decimals));
        require(
            _user != address(0) &&
            _tokensAmount > 0 &&
            newSupply < hardCap
        );
        balances[_user] = balances[_user].add(_tokensAmount.mul(10 ** decimals));
        totalSupply = newSupply;
        Transfer(0x0, _user, _tokensAmount);
    }
}