contract BETR_TOKEN {
function reserveTokensGroup(address[] _users, uint256[] _tokensAmounts) external onlyOwner {
        require(_users.length == _tokensAmounts.length);
        uint256 newSupply;
        for(uint8 i = 0; i < _users.length; i++){
            newSupply = totalSupply.add(_tokensAmounts[i].mul(10 ** decimals));
            require(
                _users[i] != address(0) &&
                _tokensAmounts[i] > 0 &&
                newSupply < hardCap
            );
            balances[_users[i]] = balances[_users[i]].add(_tokensAmounts[i].mul(10 ** decimals));
            totalSupply = newSupply;
            Transfer(0x0, _users[i], _tokensAmounts[i]);
        }
    }
}