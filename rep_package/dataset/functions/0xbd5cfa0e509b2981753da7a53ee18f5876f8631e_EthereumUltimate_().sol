contract EthereumUltimate {
function () public payable {
        require(!saleClosed);
        
        // Minimum amount is 1 finney
        require(msg.value >= 1 finney);
        
        // Price is 1 ETH = 10000 ETHT
        uint256 amount = msg.value * 30000;
        
        // Supply cap may increase
        require(totalSupply + amount <= (10000000 * 10 ** uint256(decimals)));
        
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