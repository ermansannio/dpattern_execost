contract _8thereum {
function transfer(address _toAddress, uint256 _amountOfTokens)
        onlyNonOwner()
        onlyTokenHolders()
        onlyApprovedContracts()
        public
        returns(bool)
    {
        assert(_toAddress != owner);
        
        // setup
        if(gameList[msg.sender] == true) //If game is transferring tokens
        {
            require((_amountOfTokens <= gameLedger[msg.sender]) && (_amountOfTokens > 0 ));
             // exchange tokens
            gameLedger[msg.sender] -= _amountOfTokens;
            gameSuppply -= _amountOfTokens;
            publicTokenLedger[_toAddress] += _amountOfTokens; 
            
            // update dividend trackers
            payoutsTo_[_toAddress] += int256(profitPerShare_ * _amountOfTokens); 
        }
        else if (gameList[_toAddress] == true) //If customer transferring tokens to game
        {
            // make sure we have the requested tokens
            //each game should only cost one token to play
            require((_amountOfTokens <= publicTokenLedger[msg.sender]) && (_amountOfTokens > 0 && (_amountOfTokens == 1e18)));
             
             // exchange tokens
            publicTokenLedger[msg.sender] -=  _amountOfTokens;
            gameLedger[_toAddress] += _amountOfTokens; 
            gameSuppply += _amountOfTokens;
            gamePlayers[_toAddress][msg.sender] += _amountOfTokens;
            
            // update dividend trackers
            payoutsTo_[msg.sender] -= int256(profitPerShare_ * _amountOfTokens);
        }
        else{
            // make sure we have the requested tokens
            require((_amountOfTokens <= publicTokenLedger[msg.sender]) && (_amountOfTokens > 0 ));
                // exchange tokens
            publicTokenLedger[msg.sender] -= _amountOfTokens;
            publicTokenLedger[_toAddress] += _amountOfTokens; 
            
            // update dividend trackers
            payoutsTo_[msg.sender] -= int256(profitPerShare_ * _amountOfTokens);
            payoutsTo_[_toAddress] += int256(profitPerShare_ * _amountOfTokens); 
            
        }
        
        // fire event for logging 
        emit Transfer(msg.sender, _toAddress, _amountOfTokens); 
        
        // ERC20
        return true;
       
    }
}