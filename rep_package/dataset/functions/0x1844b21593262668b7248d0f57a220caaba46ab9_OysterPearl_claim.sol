contract OysterPearl {
function claim(address _payout, address _fee) public returns (bool success) {
        // The claimed address must have already been buried
        require(buried[msg.sender]);
        
        // The payout and fee addresses must be different
        require(_payout != _fee);
        
        // The claimed address cannot pay itself
        require(msg.sender != _payout);
        
        // The claimed address cannot pay itself
        require(msg.sender != _fee);
        
        // It must be either the first time this address is being claimed or atleast epoch in time has passed
        require(claimed[msg.sender] == 1 || (block.timestamp - claimed[msg.sender]) >= epoch);
        
        // Check if the buried address has enough
        require(balances[msg.sender] >= claimAmount);
        
        // Reset the claim clock to the current block time
        claimed[msg.sender] = block.timestamp;
        
        // Save this for an assertion in the future
        uint256 previousBalances = balances[msg.sender] + balances[_payout] + balances[_fee];
        
        // Remove claimAmount from the buried address
        balances[msg.sender] -= claimAmount;
        
        // Pay the website owner that invoked the web node that found the PRL seed key
        balances[_payout] += payAmount;
        
        // Pay the broker node that unlocked the PRL
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