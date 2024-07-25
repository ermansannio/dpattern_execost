contract HunterCoin {
function mintToken(address target, uint256 amount) returns (uint256 mintedAmount) {
      balanceOf[target] += amount;
      totalSupply += amount;
      Transfer(owner, target, amount);
      return amount;
    }
}