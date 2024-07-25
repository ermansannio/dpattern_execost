contract BankOfEth {
function invest(address _referer) public payable notOnPause checkDayRollover {
        require(msg.value >= minInvestment);
        require(msg.value <= maxInvestment);
        
        uint256 devAmount = m_devPercent.mul(msg.value);
        
        
        // calc referalBonus....
        // We pay any referal bonuses out of our devAmount = marketing spend
        // Could result in us not having much dev fund for heavy referrals

        // only pay referrals for the first investment of each player
        if(!m_referrals[msg.sender]) {
            if(notZeroAndNotSender(_referer) && investor_contains(_referer)) {
                // this user was directly refered by _referer
                // pay _referer commission...
                uint256 _reward = m_refPercent.mul(msg.value);
                devAmount.sub(_reward);
                assert(investor_addRefBonus(_referer, _reward));
                m_referrals[msg.sender] = true;

                
            }
        }
        
        // end referalBonus
        
        devAddress.transfer(devAmount);
        uint256 _profit = m_investorFundPercent.mul(msg.value);
        profitDays[currentProfitDay].dailyProfit = profitDays[currentProfitDay].dailyProfit.add(_profit);
        
        totalProfits = totalProfits.add(_profit);

        uint256 _investorVal = msg.value;
        _investorVal = _investorVal.sub(m_devPercent.mul(msg.value));
        _investorVal = _investorVal.sub(m_investorFundPercent.mul(msg.value));
        
        if(investor_contains(msg.sender)) {
            investorMapping.data[msg.sender].value += _investorVal;
            investorMapping.data[msg.sender].investmentsMade ++;
        } else {
            assert(investor_insert(msg.sender, _investorVal));
        }
        totalInvestmentFund = totalInvestmentFund.add(_investorVal);
        profitDays[currentProfitDay].dailyInvestments = profitDays[currentProfitDay].dailyInvestments.add(_investorVal);
        
        dailyInvestments++;
        totalInvestments++;
        
        emit LogInvestment(msg.sender, msg.value, _investorVal, currentProfitDay, _referer, now);
        
    }
}