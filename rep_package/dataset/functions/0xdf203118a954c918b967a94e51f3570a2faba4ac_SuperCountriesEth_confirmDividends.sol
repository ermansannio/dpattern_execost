contract SuperCountriesEth {
function confirmDividends() public onlyRealAddress {
		require(playerScore[msg.sender] > 0);/// the player exists
		require (dividendsScore >= handicap[potVersion][msg.sender]);
		require (dividendsScore >= 0);
		
		address _playerAddress = msg.sender;
		uint256 playerSc = playerScore[_playerAddress];
		uint256 handicap_ = handicap[potVersion][_playerAddress];
		
		uint256 refbonus = pendingBalance[potVersion][_playerAddress];
		uint256 divs = playerSc.mul(dividendsScore.sub(handicap_)).div(HUGE);
		uint256 totalPending = refbonus.add(divs);	
						
		/// Reset the values
		pendingBalance[potVersion][_playerAddress] = 0; /// Reset the pending balance
		handicap[potVersion][_playerAddress] = dividendsScore;
		
		/// Now the player is ready to withdraw ///
		balanceToWithdraw[potVersion][_playerAddress] += totalPending;
		
		// fire event
		emit ConfirmWithdraw(_playerAddress, refbonus, divs, totalPending, playerSc, handicap_);
		
	}
}