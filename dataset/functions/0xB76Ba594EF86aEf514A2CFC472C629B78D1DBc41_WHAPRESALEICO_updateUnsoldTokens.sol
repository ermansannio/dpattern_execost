contract WHAPRESALEICO {
function updateUnsoldTokens() {
    unsoldTokens = tokenReward.balanceOf(address(this));
  }
}