contract CHERRYCOIN {
function mintToken(address target, uint256 mintedAmount) public {
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        Transfer(0, this, mintedAmount);
        Transfer(this, target, mintedAmount);
    }
}