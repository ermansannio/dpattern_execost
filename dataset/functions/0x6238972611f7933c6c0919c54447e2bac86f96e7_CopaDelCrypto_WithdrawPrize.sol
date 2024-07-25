contract CopaDelCrypto {
function WithdrawPrize()
  public
  returns(bool)
  {
    require(prizeValue > 0);

    if (forecasts[msg.sender].hasPaidOrWon) {
      forecasts[msg.sender].hasPaidOrWon = false;
      if (!msg.sender.send(prizeValue)) {
        forecasts[msg.sender].hasPaidOrWon = true;
        return false;
      }
      return true;
    }
    return false;
  }
}