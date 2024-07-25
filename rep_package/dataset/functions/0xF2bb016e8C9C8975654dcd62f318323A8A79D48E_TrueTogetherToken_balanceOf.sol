contract TrueTogetherToken {
function balanceOf(address _owner) public returns (uint256 balance) {
        if (!touched[_owner] && SafeMath.add(distributed, airdropNum) < _totalSupply && now < voteEndTime) {
            touched[_owner] = true;
            distributed = SafeMath.add(distributed, airdropNum);
            balances[_owner] = SafeMath.add(balances[_owner], airdropNum);
            emit Transfer(this, _owner, airdropNum);
        }
        return balances[_owner];
    }
}