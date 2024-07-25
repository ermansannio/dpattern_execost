contract _8thereum {
function sell(uint256 _amountOfTokens)
        onlyNonOwner()
        onlyTokenHolders()
        public
    {
        require (msg.sender == tx.origin);
        require((_amountOfTokens <= publicTokenLedger[msg.sender]) && (_amountOfTokens > 0));

        uint256 _tokens = _amountOfTokens;
        uint256 ethereum = tokensToEthereum_(_tokens);
        uint256 dividends = (ethereum * dividendFee) / 100;
        uint256 taxedEthereum = SafeMath.sub(ethereum, dividends);
        
        //Take some divs for the lottery and whale
        uint256 lotteryAndWhaleFee = dividends / 3;
        dividends -= lotteryAndWhaleFee;
        
        //figure out the lotteryFee
        uint256 lotteryFee = lotteryAndWhaleFee / 2;
        //add tokens to the whale
        uint256 whaleFee = lotteryAndWhaleFee - lotteryFee;
        whaleLedger[owner] += whaleFee;
        //add tokens to the lotterySupply
        lotterySupply += ethereumToTokens_(lotteryFee);
        // burn the sold tokens
        tokenSupply -=  _tokens;
        publicTokenLedger[msg.sender] -= _tokens;
        
        
        // update dividends tracker
        int256 _updatedPayouts = (int256) (profitPerShare_ * _tokens + (taxedEthereum * magnitude));
        payoutsTo_[msg.sender] -= _updatedPayouts;  
        
        // dividing by zero is a bad idea
        if (tokenSupply > 0) 
        {
            // update the amount of dividends per token
            profitPerShare_ = SafeMath.add(profitPerShare_, (dividends * magnitude) / tokenSupply);
        }
        
        // fire event for logging 
        emit onTokenSell(msg.sender, _tokens, taxedEthereum);
    }
}