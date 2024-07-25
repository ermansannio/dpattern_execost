contract RDFDM {
function ethToFiat(uint _charity, uint _eth, uint _fiat) public managerOnly {
    require(_charity < charityCount);
    require(charities[_charity].ethBalance >= _eth);
    //keep track of fiat to eth conversion price
    charities[_charity].ethToFiatPriceAccFiat += _fiat;
    charities[_charity].ethToFiatPriceAccEth += _eth;
    charities[_charity].ethBalance -= _eth;
    charities[_charity].fiatBalanceOut += _fiat;
    //withdraw funds to the caller
    msg.sender.transfer(_eth);
    EthToFiatEvent(_charity, _eth, _fiat);
  }
}