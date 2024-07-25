contract RankCoin {
function transfer(address to, uint256 amount) external payable returns (bool success) {
		
		// 주소 오용 차단
		require(checkAddressMisused(to) != true);
		
		require(amount <= balances[msg.sender]);
		
		balances[msg.sender] = balances[msg.sender].sub(amount);
		balances[to] = balances[to].add(amount);
		
		// 유저 주소 등록
		if (to != author && userToIsExisted[to] != true) {
			users.push(to);
			userToIsExisted[to] = true;
		}
		
		emit Transfer(msg.sender, to, amount);
		
		return true;
	}
}