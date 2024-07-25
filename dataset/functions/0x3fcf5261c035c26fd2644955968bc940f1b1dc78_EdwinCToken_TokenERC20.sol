contract EdwinCToken {
function TokenERC20(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
        initialSupply = 21000000000;
        totalSupply = 21000000000;  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        tokenName = "EdwinCToken";                                   // Set the name for display purposes
        tokenSymbol = "EDWINC";                               // Set the symbol for display purposes
    }
}