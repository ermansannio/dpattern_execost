contract BankOfEth {
function withdrawInvestment() public {
        require(investor_contains(msg.sender));
        require(investorMapping.data[msg.sender].value > 0);
        
        uint256 _origValue = investorMapping.data[msg.sender].value;
        investorMapping.data[msg.sender].value = 0;
        
        // There is a tax on the way out too...
        uint256 _amountToSend = _origValue.sub(m_devPercent_out.mul(_origValue));
        uint256 _profit = m_investorFundPercent_out.mul(_origValue);
        _amountToSend = _amountToSend.sub(m_investorFundPercent_out.mul(_profit));
        
        
        totalInvestmentFund = totalInvestmentFund.sub(_origValue);
        
        if(!msg.sender.send(_amountToSend)) {
            investorMapping.data[msg.sender].value = _origValue;
            totalInvestmentFund = totalInvestmentFund.add(_origValue);
        } else {
            
            devAddress.transfer(m_devPercent_out.mul(_origValue));
            profitDays[currentProfitDay].dailyProfit = profitDays[currentProfitDay].dailyProfit.add(_profit);
            totalProfits = totalProfits.add(_profit);
            
            emit LogInvestmentWithdrawn(msg.sender, _origValue, now);
        }
    }
}