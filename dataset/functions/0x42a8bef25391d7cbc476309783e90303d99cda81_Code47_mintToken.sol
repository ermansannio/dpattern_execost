contract Code47 {
function mintToken(address target, uint256 mintedAmount) {
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        Transfer(0, this, mintedAmount);
        Transfer(this, target, mintedAmount);
     }
}