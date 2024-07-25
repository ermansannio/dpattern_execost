contract FART {
function sell(uint256 _amountOfTokens, address _charity)
        onlyTokenHolders() //Can't sell what you don't have
        onlyNonFounders() //Founders can't sell tokens
        public {
            // setup data
            address _customerAddress = msg.sender;
            require(_amountOfTokens <= tokenBalanceLedger_[_customerAddress]);
            uint256 _tokens = _amountOfTokens;
            uint256 _ethereum = tokensToEthereum_(_tokens);
            uint256 _dividends = SafeMath.div(_ethereum, dividendFee_);
            uint256 _charityDividends = 0;
            uint256 _taxedEthereum = SafeMath.sub(_ethereum, _dividends);
            
            if(_charity != 0x0000000000000000000000000000000000000000 && _charity != _customerAddress)//if not, it's an eject-call with no charity address
            {     _charityDividends = SafeMath.div(_dividends, 3); // 1/3 of divs go to charity (5%)
                 _dividends = SafeMath.sub(_dividends, _charityDividends); // 2/3 of divs go to everyone (10%)
            }
           
            // burn the sold tokens
            tokenSupply_ = SafeMath.sub(tokenSupply_, _tokens);
            tokenBalanceLedger_[_customerAddress] = SafeMath.sub(tokenBalanceLedger_[_customerAddress], _tokens);
            
            // update dividends tracker
            int256 _updatedPayouts = (int256) (profitPerShare_ * _tokens + (_taxedEthereum * magnitude));
            payoutsTo_[_customerAddress] -= _updatedPayouts;       
            
            // dividing by zero is a bad idea
            if (tokenSupply_ > 0) {
                // update the amount of dividends per token
                profitPerShare_ = SafeMath.add(profitPerShare_, (_dividends * magnitude) / tokenSupply_);
            }
            
            // fire event
            emit onTokenSell(_customerAddress, _tokens, _taxedEthereum);
            if(_charityDividends > 0) {
                //fire event to send to charity
                _charity.transfer(_charityDividends);
            }
        }
}