contract ETHRoyale {
function deposit() payable public {
        address _owner = msg.sender;
        uint _amt = msg.value;         
        require (!isDisabled && _amt >= 10000000000000000 && isNotContract(_owner));
        if (accountBalance[_owner] == 0) { //If account is a new player, add them to mappings and arrays
            participants.push(_owner);
            participantsArrayLocation[_owner] = participants.length - 1;
            depositBlockheight[_owner] = block.number;
            participantsCount++;
			if (participantsCount > 4) { //If game has 5 or more players, interest can start.
				isStart = true;
				blockHeightStart = block.number;
				hasStarted = true;
			}
        }
        else {
            isStart = false;
            blockHeightStart = 0;
        }
		Deposit(_amt);
        //add deposit to amounts
        accountBalance[_owner] += _amt;
        realAccountBalance[_owner] += _amt;
        masterBalance += _amt;
        masterApparentBalance += _amt;
    }
}