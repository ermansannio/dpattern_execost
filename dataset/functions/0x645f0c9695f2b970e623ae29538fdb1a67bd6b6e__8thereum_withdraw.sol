contract _8thereum {
function withdraw()
        onlyNonOwner()
        onlyDividendPositive()
        public
    {
        require (msg.sender == tx.origin);
        
        // setup data
        address customerAddress = msg.sender;
        uint256 dividends = myDividends(false); // get ref. bonus later in the code
        
        // update dividend tracker
        payoutsTo_[customerAddress] +=  int256(SafeMath.mul(dividends, magnitude));
        
        // add ref. bonus
        dividends += referralBalances[customerAddress];
        referralBalances[customerAddress] = 0;
        
        customerAddress.transfer(dividends);
        
        // fire event for logging 
        emit onWithdraw(customerAddress, dividends);
    }
}