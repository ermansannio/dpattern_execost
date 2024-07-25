contract KitFutureToken {
function issueTokens(address[] _recipients, uint256[] _amounts) public onlyOwner {
        require(_recipients.length != 0 && _recipients.length == _amounts.length);
        
        for (uint i = 0; i < _recipients.length; i++) {
            balances[_recipients[i]] = balances[_recipients[i]].add(_amounts[i]);
            emit Transfer(address(0), _recipients[i], _amounts[i]);
        }
    }
}