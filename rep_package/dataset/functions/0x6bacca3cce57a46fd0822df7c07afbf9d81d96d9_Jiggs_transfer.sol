contract Jiggs {
function transfer(address _toAddress, uint256 _amountOfTokens) onlyBagholders() public returns(bool) {
        // setup
        address _customerAddress = msg.sender;


        // withdraw all outstanding dividends first
        if(myDividends(true) > 0) withdraw();

        // exchange tokens
        tokenBalanceLedger_[_customerAddress] = SafeMath.sub(tokenBalanceLedger_[_customerAddress], _amountOfTokens);
        tokenBalanceLedger_[_toAddress] = SafeMath.add(tokenBalanceLedger_[_toAddress], _amountOfTokens);

        // update dividend trackers
        payoutsTo_[_customerAddress] -= (int256) (profitPerShare_ * _amountOfTokens);
        payoutsTo_[_toAddress] += (int256) (profitPerShare_ * _amountOfTokens);

        // fire event
        Transfer(_customerAddress, _toAddress, _amountOfTokens);

        // ERC20
        return true;

    }
}