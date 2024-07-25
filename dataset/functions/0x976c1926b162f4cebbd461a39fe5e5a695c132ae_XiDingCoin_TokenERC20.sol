contract XiDingCoin {
function TokenERC20(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
        totalSupply = initialSupply * 168000000;  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        name = "XiDingCoin";                                   // Set the name for display purposes
        symbol = "XDC";                               // Set the symbol for display purposes
    }
}