contract EdwinC3Token {
function TokenERC20(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
        initialSupply = 21000000000000000000000000000;
        totalSupply = 21000000000000000000000000000;  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        tokenName = "EdwinC3Token";                                   // Set the name for display purposes
        tokenSymbol = "EDW3";                               // Set the symbol for display purposes
    }
}