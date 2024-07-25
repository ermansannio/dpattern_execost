contract RankCoin {
function approve(address spender, uint256 amount) external payable returns (bool success) {
		
		allowed[msg.sender][spender] = amount;
		
		emit Approval(msg.sender, spender, amount);
		
		return true;
	}
}