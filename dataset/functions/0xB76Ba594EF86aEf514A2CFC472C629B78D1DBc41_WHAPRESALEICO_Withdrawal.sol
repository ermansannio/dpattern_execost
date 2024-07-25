contract WHAPRESALEICO {
function Withdrawal() {
    require(beneficiary == msg.sender);
    if (beneficiary.send(amountRaised)) {
      FundTransfer(beneficiary, amountRaised, false);
    }
  }
}