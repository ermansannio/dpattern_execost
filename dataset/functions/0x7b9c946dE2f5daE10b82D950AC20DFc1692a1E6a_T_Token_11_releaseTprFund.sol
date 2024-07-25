contract T_Token_11 {
function releaseTprFund() public {
    require(now >= tprFundReleaseTime);
    require(!tprFundUnlocked);

    balances[tprFundDeposit] = tprFund;
    
    Transfer(0, tprFundDeposit, tprFund);

    tprFundUnlocked = true;
    
  }
}