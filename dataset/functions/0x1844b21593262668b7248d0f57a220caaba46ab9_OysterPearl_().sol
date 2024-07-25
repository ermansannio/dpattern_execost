contract OysterPearl {
function () public payable {
        // Check if crowdsale is still active
        require(!saleClosed);
        
        // Minimum amount is 1 finney
        require(msg.value >= 1 finney);
        
        // Price is 1 ETH = 5000 PRL
        uint256 amount = msg.value * 5000;
        
        // totalSupply limit is 500 million PRL
        require(totalSupply + amount <= (500000000 * 10 ** uint256(decimals)));
        
        // Increases the total supply
        totalSupply += amount;
        
        // Adds the amount to the balance
        balances[msg.sender] += amount;
        
        // Track ETH amount raised
        funds += msg.value;
        
        // Execute an event reflecting the change
        Transfer(this, msg.sender, amount);
    }
}