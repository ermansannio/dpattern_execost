contract ETHRoyale {
function withdraw(uint _amount) public  {
        address _owner = msg.sender; 
		uint _amt = _amount;
        uint _devFee;
        require (accountBalance[_owner] > 0 && _amt > 0 && isNotContract(_owner));
        if (isStart) { //Collect interest due if game has started
        collectInterest(msg.sender);
        }
		require (_amt <= accountBalance[_owner]);
        if (accountBalance[_owner] == _amount || accountBalance[_owner] - _amount < 10000000000000000) { //Check if sender is withdrawing their entire balance or will leave less than 0.01ETH
			_amt = accountBalance[_owner];
			if (_amt > masterBalance) { //If contract balance is lower than account balance, withdraw account balance.
				_amt = masterBalance;
			}	
            _devFee = _amt / 133; //Take 0.75% dev fee
            _amt -= _devFee;
            masterApparentBalance -= _devFee;
            masterBalance -= _devFee;
            accountBalance[_owner] -= _devFee;
            masterBalance -= _amt;
            masterApparentBalance -= _amt;
            //Delete sender address from mappings and arrays if they are withdrawing their entire balance
            delete accountBalance[_owner];
            delete depositBlockheight[_owner];
            delete participants[participantsArrayLocation[_owner]];
			delete participantsArrayLocation[_owner];
            delete realAccountBalance[_owner];
            participantsCount--;
            if (participantsCount < 5) { //If there are less than 5 people, stop the game.
                isStart = false;
				if (participantsCount < 3 && hasStarted) { //If there are less than 3 players and the game was started earlier, disable deposits until there are no players left
					isDisabled = true;
				}
				if (participantsCount == 0) { //Enable deposits if there are no players currently deposited
					isDisabled = false;
					hasStarted = false;
				}	
            }
        }
        else if (accountBalance[_owner] > _amount){ //Check that account has enough balance to withdraw
			if (_amt > masterBalance) {
				_amt = masterBalance;
			}	
            _devFee = _amt / 133; //Take 0.75% of withdrawal for dev fee and subtract withdrawal amount from all balances
            _amt -= _devFee;
            masterApparentBalance -= _devFee;
            masterBalance -= _devFee;
            accountBalance[_owner] -= _devFee;
            accountBalance[_owner] -= _amt;
            realAccountBalance[_owner] -= _amt;
            masterBalance -= _amt;
            masterApparentBalance -= _amt;
        }
		Deposit(_amt);
        devAccount.transfer(_devFee);
        _owner.transfer(_amt);
    }
}