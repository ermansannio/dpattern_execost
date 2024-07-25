contract CryptoDivert {
function SafeGuard(bytes20 _originAddressHash, uint256 _releaseTime, uint16 _privacyCommission) external payable
    onlyPayloadSize(3*32)
    returns(bool)
    {
        // We can only SafeGuard anything if there is value transferred.
        // Minimal value is 1 finney, to prevent SPAM and any errors with the commissions calculations.
        require(msg.value >= 1 finney); 
        
        // Prevent Re-usage of a compromised password by this address; Check that we have not used this before. 
        // In case we have used this password, but haven't retrieved the amount, the password is still 
        // uncompromised and we can add this amount to the existing amount.
        // A password/ETH combination that was used before will be known to the blockchain (clear text) 
        // after the Retrieve method has been called and can't be used again to prevent others retrieving you funds.
        require(senders[_originAddressHash] == NO_ADDRESS || balances[_originAddressHash] > 0);
       
        // We don't know your password (Only you do!) so we can't possible check wether or not 
        // you created the correct hash, we have to assume you did. Only store the first sender of this hash
        // to prevent someone uploading a small amount with this hash to gain access to the AuditSafeGuard method 
        // or reset the timer.
        if(senders[_originAddressHash] == NO_ADDRESS) {
            
            senders[_originAddressHash] = msg.sender;
            
            // If you set a timer we check if it's in the future and add it to this SafeGuard.
            if (_releaseTime > now) {
                timers[_originAddressHash] = _releaseTime;
            } else {
                timers[_originAddressHash] = now;
            }
            
            // if we have set a privacy deviation store it, max 100% = 10000.
            if (_privacyCommission > 0 && _privacyCommission <= 10000) {
                privacyDeviation[_originAddressHash] = _privacyCommission;
            }
        }    
        
        // To pay for our servers (and maybe a beer or two) we charge a 0.8% fee (that's 80cents per 100$).
        uint256 _commission = msg.value.div(125); //100/125 = 0.8
        uint256 _balanceAfterCommission = msg.value.sub(_commission);
        balances[_originAddressHash] = balances[_originAddressHash].add(_balanceAfterCommission);
        
        // Keep score of total user balance 
        userBalance = userBalance.add(_balanceAfterCommission);
        
        // Double check that our administration is correct.
        // The administration can only be incorrect if someone found a loophole in Solidity or in our programming.
        // The assert will effectively revert the transaction in case someone is cheating.
        assert(address(this).balance >= userBalance); 
        
        // Let the user know what a great success.
        emit SafeGuardSuccess(_originAddressHash, _balanceAfterCommission, _commission);
        
        return true;
    }
}