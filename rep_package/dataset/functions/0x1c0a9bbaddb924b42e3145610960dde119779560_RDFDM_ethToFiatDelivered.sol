contract RDFDM {
function ethToFiatDelivered(uint _charity, uint _eth, uint _fiat, string _ref) public managerOnly {
    require(_charity < charityCount);
    require(charities[_charity].ethBalance >= _eth);
    //keep track of fiat to eth conversion price
    charities[_charity].ethToFiatPriceAccFiat += _fiat;
    charities[_charity].ethToFiatPriceAccEth += _eth;
    charities[_charity].ethBalance -= _eth;
    //charities[_charity].fiatBalanceOut does not change, since we immediately deliver
    //withdraw funds to the caller
    msg.sender.transfer(_eth);
    EthToFiatEvent(_charity, _eth, _fiat);
    charities[_charity].fiatDelivered += _fiat;
    FiatDeliveredEvent(_charity, _fiat, _ref);
  }
}