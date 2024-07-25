contract OysterShell {
function lock(uint256 _duration) public returns (bool success) {
        // The address must be previously unlocked
        require(locked[msg.sender] == 0);
        
        // An address must have at least retentionMin to be locked
        require(balances[msg.sender] >= retentionMin);
        
        // Prevent addresses with large balances from getting locked
        require(balances[msg.sender] <= retentionMax);
        
        // Enforce minimum lock duration
        require(_duration >= lockMin);
        
        // Enforce maximum lock duration
        require(_duration <= lockMax);
        
        // Set locked state to true
        locked[msg.sender] = block.timestamp + _duration;
        
        // Add to lockedSupply
        lockedSupply += balances[msg.sender];
        
        // Execute an event reflecting the change
        Lock(msg.sender, balances[msg.sender], locked[msg.sender]);
        return true;
    }
}