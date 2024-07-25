contract OrganizeFunds {
function distribute() public {
    //only payout if we have more than 1000 wei
    if (this.balance < TENHUNDWEI) {
      return;
    }
    //each account gets their prescribed percentage of this holdover.
    uint i;
    uint pctx10;
    uint acctDist;
    for (i = 0; i < activityCount; i++ ) {
      pctx10 = activityAccounts[i].pctx10;
      acctDist = totalFundsReceived * pctx10 / TENHUNDWEI;
      //we also double check to ensure that the amount credited cannot exceed the total amount due to this acct
      if (activityAccounts[i].credited >= acctDist) {
        acctDist = 0;
      } else {
        acctDist = acctDist - activityAccounts[i].credited;
      }
      activityAccounts[i].credited += acctDist;
      activityAccounts[i].balance += acctDist;
      totalFundsDistributed += acctDist;
    }
    MessageEvent("ok: distributed funds");
  }
}