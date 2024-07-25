contract MiCarsICO {
function safeWithdrawal(uint _amounty) isOwner public {
			uint amounted = _amounty;
            
            if (beneficiary.send(amounted)) {
                FundTransfer(beneficiary, amounted, false);
            }
    }
}