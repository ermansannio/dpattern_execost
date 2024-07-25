contract CryptoDivert {
function Retrieve(string _password, address _originAddress) external 
    isAddress(_originAddress) 
    onlyPayloadSize(2*32)
    returns(bool)
    {
        
        // Re-create the _originAddressHash that was given when transferring to this contract.
        // Either the sender's address was hashed (and allows to retrieve from any address) or 
        // the receiver's address was hashed (more private, but only allows to retrieve from that address).
        bytes20 _addressHash = _getOriginAddressHash(_originAddress, _password); 
        bytes20 _senderHash = _getOriginAddressHash(msg.sender, _password); 
        bytes20 _transactionHash;
        uint256 _randomPercentage; // used to make a receiver hashed transaction more private.
        uint256 _month = 30 * 24 * 60 * 60;
        
        // Check if the given '_originAddress' is the same as the address that transferred to this contract.
        // We do this to prevent people simply giving any hash.
        if (_originAddress == senders[_addressHash]) { // Public Transaction, hashed with originating address.
            
            // Anybody with the password and the sender's address
            _transactionHash = _addressHash;
            
        } 
        else if (msg.sender == senders[_addressHash] && timers[_addressHash].add(_month) < now ) { // Private transaction, retrieve by sender after a month delay. 
            
            // Allow a sender to retrieve his transfer, only a month after the timelock expired 
            _transactionHash = _addressHash;
            
        }
        else { // Private transaction, hashed with receivers address
            
            // Allow a pre-defined receiver to retrieve.
            _transactionHash = _senderHash;
        }
        
        // Check if the _transactionHash exists and this balance hasn't been received already.
        // We would normally do this with a require(), but to keep it more private we need the 
        // method to be executed also if it will not result.
        if (balances[_transactionHash] == 0) {
            emit RetrieveSuccess(0);
            return false;    
        }
        
        // Check if this SafeGuard has a timelock and if it already has expired.
        // In case the transaction was sent to a pre-defined address, the sender can retrieve the transaction 1 month after it expired.
        // We would normally do this with a require(), but to keep it more private we need the 
        // method to be executed also if it will not result.
        if (timers[_transactionHash] > now ) {
            emit RetrieveSuccess(0);
            return false;
        }
        
        // Prepare to transfer the balance out.
        uint256 _balance = balances[_transactionHash];
        balances[_transactionHash] = 0;
        
        // Check if the sender allowed for a deviation (up or down) of the value to make tracking harder.
        // To do this we need to randomize the balance a little so it
        // become less traceable: To make the tracement harder, we will calculate an 
        // additional random commission between 0 and the allowed deviation which can be added to or substracted from 
        // this transfer's balance so the outgoing value is randomized.
        if (privacyDeviation[_transactionHash] > 0) {
             _randomPercentage = _randomize(now, privacyDeviation[_transactionHash]);
        }
        
        if(_randomPercentage > 0) {
            // Calculate the privacy commissions amount in wei.
            uint256 _privacyCommission = _balance.div(10000).mul(_randomPercentage);
            
            // Check integrity of privacyFund
            if (userBalance.add(privacyFund) > address(this).balance) {
                privacyFund = 0;
            }
            
            // Check if we have enough availability in the privacy fund to add to this Retrieve
            if (_privacyCommission <= privacyFund) {
                // we have enough funds to add
                 privacyFund = privacyFund.sub(_privacyCommission);
                 userBalance = userBalance.add(_privacyCommission);
                _balance = _balance.add(_privacyCommission);
               
            } else {
                // the privacy fund is not filled enough, you will contribute to it.
                _balance = _balance.sub(_privacyCommission);
                userBalance = userBalance.sub(_privacyCommission);
                privacyFund = privacyFund.add(_privacyCommission);
            }
        }
        
        // Keep score of total user balance 
        userBalance = userBalance.sub(_balance);
        
        // Transfer the value.
        msg.sender.transfer(_balance);
        
        // Double check that our admin is correct. If not then revert this transaction.
        assert(address(this).balance >= userBalance);
        
        emit RetrieveSuccess(_balance);
        
        return true;
    }
}