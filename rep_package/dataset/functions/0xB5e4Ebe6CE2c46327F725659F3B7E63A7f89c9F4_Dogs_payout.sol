contract Dogs {
function payout(address _to) public onlyCLevel {
    _payout(_to);
  }
}