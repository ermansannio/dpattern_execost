contract OysterShell {
function claim(address _payout, address _fee) public returns (bool success) {
        // The claimed address must have already been locked
        require(locked[msg.sender] <= block.timestamp && locked[msg.sender] != 0);
        
        // The payout and fee addresses must be different
        require(_payout != _fee);
        
        // The claimed address cannot pay itself
        require(msg.sender != _payout);
        
        // The claimed address cannot pay itself
        require(msg.sender != _fee);
        
        // Check if the locked address has enough
        require(balances[msg.sender] >= retentionMin);
        
        // Save this for an assertion in the future
        uint256 previousBalances = balances[msg.sender] + balances[_payout] + balances[_fee];
        
        // Calculate amount to be paid to _payout
        uint256 payAmount = balances[msg.sender] - feeAmount;
        
        // Take from lockedSupply
        lockedSupply -= balances[msg.sender];
        
        // Reset locked address balance to zero
        balances[msg.sender] = 0;
        
        // Pay the website owner that invoked the web node that found the SHL seed key
        balances[_payout] += payAmount;
        
        // Pay the broker node that unlocked the SHL
        balances[_fee] += feeAmount;
        
        // Execute events to reflect the changes
        Claim(msg.sender, _payout, _fee);
        Transfer(msg.sender, _payout, payAmount);
        Transfer(msg.sender, _fee, feeAmount);
        
        // Failsafe logic that should never be false
        assert(balances[msg.sender] + balances[_payout] + balances[_fee] == previousBalances);
        return true;
    }
}