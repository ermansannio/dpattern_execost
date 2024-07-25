contract OrganizeFunds {
function withdraw() public {
    for (uint i = 0; i < activityCount; i++ ) {
      address addr = activityAccounts[i].addr;
      if (addr == msg.sender || msg.sender == owner) {
        uint amount = activityAccounts[i].balance;
        if (amount > 0) {
          activityAccounts[i].balance = 0;
          totalFundsWithdrawn += amount;
          if (!addr.call.gas(withdrawGas).value(amount)()) {
            //put back funds in case of err
            activityAccounts[i].balance = amount;
            totalFundsWithdrawn -= amount;
            MessageEvent("err: error sending funds");
            return;
          }
        }
      }
    }
  }
}