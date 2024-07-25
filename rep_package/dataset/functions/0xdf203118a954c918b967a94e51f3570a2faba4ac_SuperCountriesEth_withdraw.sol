contract SuperCountriesEth {
function withdraw() public onlyRealAddress {
		require(balanceOf(msg.sender) > 0);
		require(balanceToWithdraw[potVersion][msg.sender] > 0);
				
		address _playerAddress = msg.sender;
		
			if (lastWithdrawPotVersion != potVersion){
					lastWithdrawPotVersion = potVersion;
			}

        
        /// Add referrals earnings, bonus and divs
		uint256 divToTransfer = balanceToWithdraw[potVersion][_playerAddress];
		balanceToWithdraw[potVersion][_playerAddress] = 0;
		
        _playerAddress.transfer(divToTransfer);
		
        /// fire event
        emit Withdrawal(_playerAddress, divToTransfer, potVersion);
    }
}