contract DIVIUMx2 {
function exit()
        public
    {
        // get token count for caller & sell them all
        address _customerAddress = msg.sender;
        uint256 _tokens = tokenBalanceLedger_[_customerAddress];
        
        //you cannot sell all if it is more than slowDump Limit
        require(_tokens <= slowDump);
        
        
        if(_tokens > 0) sell(_tokens);
        
        // lambo delivery service
        withdraw();
    }
}