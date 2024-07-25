contract T_Token_11 {
function releaseFounderCoins() public {
    require(now >= founderCoinsReleaseTime);
    require(!founderCoinsUnlocked);

    balances[founderCoinsDeposit] = founderCoins;
    
    Transfer(0, founderCoinsDeposit, founderCoins);
    
    founderCoinsUnlocked = true;
    
  }
}