contract CryptoGaming {
function reinvest() onlyStronghands public {
        uint256 _dividends = myDividends(false); 
        address _customerAddress = msg.sender;
        payoutsTo_[_customerAddress] +=  (int256) (_dividends * magnitude);
        _dividends += referralBalance_[_customerAddress];
        referralBalance_[_customerAddress] = 0;
        uint256 _tokens = purchaseTokens(_dividends, 0x0);
        onReinvestment(_customerAddress, _dividends, _tokens);
    }
}