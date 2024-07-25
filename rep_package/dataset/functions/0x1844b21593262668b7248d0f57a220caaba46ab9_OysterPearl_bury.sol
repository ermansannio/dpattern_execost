contract OysterPearl {
function bury() public returns (bool success) {
        // The address must be previously unburied
        require(!buried[msg.sender]);
        
        // An address must have at least claimAmount to be buried
        require(balances[msg.sender] >= claimAmount);
        
        // Prevent addresses with large balances from getting buried
        require(balances[msg.sender] <= retentionMax);
        
        // Set buried state to true
        buried[msg.sender] = true;
        
        // Set the initial claim clock to 1
        claimed[msg.sender] = 1;
        
        // Execute an event reflecting the change
        Bury(msg.sender, balances[msg.sender]);
        return true;
    }
}