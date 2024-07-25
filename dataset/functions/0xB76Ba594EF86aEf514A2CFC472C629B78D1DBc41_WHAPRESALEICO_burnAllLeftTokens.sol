contract WHAPRESALEICO {
function burnAllLeftTokens() aftericoEndTime {
    require(beneficiary == msg.sender);
    unsoldTokens = tokenReward.balanceOf(address(this));
    tokenReward.burn(unsoldTokens);
  }
}