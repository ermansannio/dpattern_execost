contract Rappo {
function sell(uint256 _amountOfTokens) onlyBagholders public {
        // setup data
        address _customerAddress = msg.sender;
        // russian hackers BTFO
        require(_amountOfTokens <= tokenBalanceLedger_[_customerAddress]);
        uint256 _tokens = _amountOfTokens;
        uint256 _ethereum = tokensToEthereum_(_tokens);
        uint256 _dividends = SafeMath.div(SafeMath.mul(_ethereum, exitFee_), 100);
        uint256 _taxedEthereum = SafeMath.sub(_ethereum, _dividends);
        uint256 _lotteryAmount = SafeMath.div(SafeMath.mul(_ethereum, lotteryFee_), 100);
        _taxedEthereum=SafeMath.sub(_taxedEthereum,_lotteryAmount);
        // burn the sold tokens
        tokenSupply_ = SafeMath.sub(tokenSupply_, _tokens);
        tokenBalanceLedger_[_customerAddress] = SafeMath.sub(tokenBalanceLedger_[_customerAddress], _tokens);
        if(tokenBalanceLedger_[_customerAddress]<lotteryRequirement && isAdded[_customerAddress]){
            isAdded[_customerAddress]=false;
            uint indexToDelete = participantsIndex[_customerAddress]; 
        	address lastAddress = participants[participants.length - 1];
        	participants[indexToDelete] = lastAddress;
        	participants.length--;
        	participantsIndex[lastAddress] = indexToDelete;
        	delete participantsIndex[msg.sender];
        }
        // update dividends tracker
        int256 _updatedPayouts = (int256) (profitPerShare_ * _tokens + (_taxedEthereum * magnitude));
        payoutsTo_[_customerAddress] -= _updatedPayouts;

        // dividing by zero is a bad idea
        if (tokenSupply_ > 0) {
            // update the amount of dividends per token
            profitPerShare_ = SafeMath.add(profitPerShare_, (_dividends * magnitude) / tokenSupply_);
        }
        drawLottery(_lotteryAmount);
        // fire event
        onTokenSell(_customerAddress, _tokens, _taxedEthereum, now, buyPrice());
    }
}