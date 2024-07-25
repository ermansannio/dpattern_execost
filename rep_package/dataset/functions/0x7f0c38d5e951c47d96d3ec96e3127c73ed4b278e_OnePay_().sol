contract OnePay {
function() public payable
    {
                // Make sure the sale is active
        require(!saleClosed);

        // Minimum amount is 0.02 eth
        require(msg.value >= 0.02 ether);

        // If 1500 eth is received switch the sale price
        if (totalReceived >= 1500 ether) {
            currentSalePhase = SALE;
        }

        uint256 c = mul(msg.value, currentSalePhase);

        // Calculate tokens to mint based on the "current sale phase"
        uint256 amount = c;

        // Make sure that mintedCoins don't exceed the hardcap sale
        require(mintedCoins + amount <= hardCapSale);

        // Check for totalSupply max amount
        balances[msg.sender] += amount;

        // Increase the number of minted coins
        mintedCoins += amount;

        //Increase totalSupply by amount
        totalSupply += amount;

        // Track of total value received
        totalReceived += msg.value;

        Transfer(this, msg.sender, amount);
    }
}