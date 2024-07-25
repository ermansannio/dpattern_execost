contract FART {
function transfer(address _toAddress, uint256 _amountOfTokens)
        onlyTokenHolders() // Can't tranfer what you don't have
        onlyNonFounders() // Founders cannot transfer their tokens to be able to sell them
        public
        returns(bool) {
        
            // setup
            address _customerAddress = msg.sender;
            
            // make sure we have the requested tokens
            // also disables transfers until ambassador phase is over
            // ( we dont want whale premines )
            require(!onlyFounders && _amountOfTokens <= tokenBalanceLedger_[_customerAddress]);
            
            // withdraw all outstanding dividends first
            if(myDividends(true) > 0) withdraw();
    
            // exchange tokens
            tokenBalanceLedger_[_customerAddress] = SafeMath.sub(tokenBalanceLedger_[_customerAddress], _amountOfTokens);
            tokenBalanceLedger_[_toAddress] = SafeMath.add(tokenBalanceLedger_[_toAddress], _amountOfTokens);
            
            // fire event
            emit Transfer(_customerAddress, _toAddress, _amountOfTokens);
            
            // ERC20
            return true;
           
        }
}