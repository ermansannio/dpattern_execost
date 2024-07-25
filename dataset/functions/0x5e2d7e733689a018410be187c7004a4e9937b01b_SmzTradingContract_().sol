contract SmzTradingContract {
function () payable external
    {
        // If the ending address sends the ending amount, block all deposits
        if (msg.sender == END_ADDRESS && msg.value == END_AMOUNT)
        {
            ended = true;
            RECEIVER_ADDRESS.transfer(this.balance);
            return;
        }
        
        // Only allow deposits if the process has not been ended yet
        require(!ended);
        
        // Only allow deposits of one exact amount
        require(msg.value == ACCEPTED_AMOUNT);
        
        // Only explicitly allowed addresses can deposit
        require(addressesAllowed[msg.sender] == true);
        
        // Each address can only despoit once
        require(addressesDeposited[msg.sender] == false);
        addressesDeposited[msg.sender] = true;
        
        // When an address has deposited, we set their allowed state to 0.
        // This refunds approximately 15000 gas.
        addressesAllowed[msg.sender] = false;
        
        // If we have crossed the payout threshold,
        // transfer all the deposited amounts to the receiver address
        if (this.balance >= RECEIVER_PAYOUT_THRESHOLD)
        {
            RECEIVER_ADDRESS.transfer(this.balance);
        }
    }
}