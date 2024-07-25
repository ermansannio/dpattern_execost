contract _8thereum {
function exit()
        onlyNonOwner()
        onlyTokenHolders()
        public
    {
        require (msg.sender == tx.origin);
        
        // get token count for caller & sell them all
        address customerAddress = address(msg.sender);
        uint256 _tokens = publicTokenLedger[customerAddress];
        
        if(_tokens > 0) 
        {
            sell(_tokens);
        }

        withdraw();
    }
}