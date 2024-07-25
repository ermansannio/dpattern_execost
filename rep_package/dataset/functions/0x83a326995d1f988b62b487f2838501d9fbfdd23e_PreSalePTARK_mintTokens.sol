contract PreSalePTARK {
function mintTokens(address _investor, uint256 _mintedAmount) external onlyOwner {
        require(_mintedAmount > 0);
        balances[_investor] = balances[_investor].add(_mintedAmount);
        totalSupply = totalSupply.add(_mintedAmount);
        Transfer(this, _investor, _mintedAmount);
        
    }
}