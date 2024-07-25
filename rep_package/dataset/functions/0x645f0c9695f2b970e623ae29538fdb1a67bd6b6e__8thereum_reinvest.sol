contract _8thereum {
function reinvest()
        onlyDividendPositive()
        onlyNonOwner()
        public
    {   
        
        require (msg.sender == tx.origin);
        
        // fetch dividends
        uint256 dividends = myDividends(false); // retrieve ref. bonus later in the code
        
        // pay out the dividends virtually
        address customerAddress = msg.sender;
        payoutsTo_[customerAddress] +=  int256(SafeMath.mul(dividends, magnitude));
        
        // retrieve ref. bonus
        dividends += referralBalances[customerAddress];
        referralBalances[customerAddress] = 0;
        
        // dispatch a buy order with the virtualized "withdrawn dividends"
        uint256 _tokens = purchaseTokens(dividends, 0x0);
        
        // fire event for logging 
        emit onReinvestment(customerAddress, dividends, _tokens);
    }
}