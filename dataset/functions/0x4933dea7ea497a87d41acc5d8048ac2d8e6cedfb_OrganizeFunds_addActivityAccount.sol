contract OrganizeFunds {
function addActivityAccount(address _addr, uint256 _pctx10, string _name) public ownerOnly unlockedOnly {
    if (activityCount >= MAX_ACCOUNTS) {
      MessageEvent("err: max accounts");
      return;
    }
    activityAccounts[activityCount].addr = _addr;
    activityAccounts[activityCount].pctx10 = _pctx10;
    activityAccounts[activityCount].credited = 0;
    activityAccounts[activityCount].balance = 0;
    activityAccounts[activityCount].name = _name;
    ++activityCount;
    MessageEvent("ok: acct added");
  }
}