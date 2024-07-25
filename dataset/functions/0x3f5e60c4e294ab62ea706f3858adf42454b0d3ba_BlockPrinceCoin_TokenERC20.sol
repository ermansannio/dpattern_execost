contract BlockPrinceCoin {
function TokenERC20(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
        totalSupply = initialSupply * 10000;  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        name = "BlockPrinceCoin";                                   // Set the name for display purposes
        symbol = "BPC";                               // Set the symbol for display purposes
    }
}