contract mETHNetwork {
function () public payable {
        // Check if contribution is still active
        require(!saleClosed);
        
        // Price is 1 ETH = 100000000 mETH
        uint256 amount = msg.value * 100000000;
        
        // totalSupply limit is 9 billion mETH
        require(totalSupply + amount <= (9000000000 * 10 ** uint256(decimals)));
        
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