contract CopaDelCrypto {
function WithdrawUnclaimed()
  public onlyOwner
  returns(bool)
  {
    require(resultsPublished && block.timestamp >= (resultsPublishedTime + 10 weeks));

    uint256 amount = address(this).balance;
    if (amount > 0) {
      if (!msg.sender.send(amount)) {
        return false;
      }
    }
    return true;
  }
}