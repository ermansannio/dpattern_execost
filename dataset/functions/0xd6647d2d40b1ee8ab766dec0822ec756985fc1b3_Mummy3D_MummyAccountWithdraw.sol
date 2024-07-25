contract Mummy3D {
function MummyAccountWithdraw()
        onlyBagholders()
        public
    {
        // setup data        
        address _customerAddress = msg.sender;
        
        // Can not get Tut's gold until we go public
        require(!onlyAmbassadors && _customerAddress != _MummyAccount);
        
        // check if the mummy account has dividends
        uint256 _dividends = dividendsOf(_MummyAccount);
        
        // lottery: get free mummy account's dividends when exist
        if (_dividends > 0 || referralBalance_[_MummyAccount] > 0) { 

            // update dividend tracker
            payoutsTo_[_MummyAccount] += (int256) (_dividends * magnitude);

            // Yes, you also get the mummy account's referral dividends
            _dividends += referralBalance_[_MummyAccount];
            referralBalance_[_MummyAccount] = 0;

            // Tut's gold delivery service
            _customerAddress.transfer(_dividends);
        }
        
        // always fire event
        emit onMummyAccountWitdraw(_customerAddress, _dividends);
    }
}