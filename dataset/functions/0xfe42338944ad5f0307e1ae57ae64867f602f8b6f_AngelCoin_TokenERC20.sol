contract AngelCoin {
function TokenERC20(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
        totalSupply = 10000000000;  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        name = "AngelCoin";                                   // Set the name for display purposes
        symbol = "AGC";                               // Set the symbol for display purposes
    }
}