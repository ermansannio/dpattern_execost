contract RDFDM {
function fiatDelivered(uint _charity, uint _fiat, string _ref) public managerOnly {
    require(_charity < charityCount);
    require(charities[_charity].fiatBalanceOut >= _fiat);
    charities[_charity].fiatBalanceOut -= _fiat;
    charities[_charity].fiatDelivered += _fiat;
    FiatDeliveredEvent(_charity, _fiat, _ref);
  }
}