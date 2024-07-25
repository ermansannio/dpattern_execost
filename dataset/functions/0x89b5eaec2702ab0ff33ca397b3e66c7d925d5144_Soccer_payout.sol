contract Soccer {
function payout(address _to) public onlyCLevel {
    _payout(_to);
  }
}