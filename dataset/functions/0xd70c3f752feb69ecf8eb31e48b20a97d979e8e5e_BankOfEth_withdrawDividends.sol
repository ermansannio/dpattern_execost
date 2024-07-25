contract BankOfEth {
function withdrawDividends() public {
        require(investor_contains(msg.sender));

        uint total_value;
        uint total_refBonus;
        
        (total_value, total_refBonus) = getDividends(false, msg.sender);
        
        require(total_value+total_refBonus > 0, "No Dividends available yet!");
        
        uint16 _origLastDividendDay = investorMapping.data[msg.sender].lastDividendDay;
        
        investorMapping.data[msg.sender].lastDividendDay = currentProfitDay;
        investor_clearRefBonus(msg.sender);
        
        if(total_refBonus > 0) {
            investorMapping.data[msg.sender].refBonus = 0;
            if (msg.sender.send(total_value+total_refBonus)) {
                emit LogPayDividendsSuccess(msg.sender, total_value, total_refBonus, now);
            } else {
                investorMapping.data[msg.sender].lastDividendDay = _origLastDividendDay;
                investor_addRefBonus(msg.sender, total_refBonus);
            }
        } else {
            if (msg.sender.send(total_value)) {
                emit LogPayDividendsSuccess(msg.sender, total_value, 0, now);
            } else {
                investorMapping.data[msg.sender].lastDividendDay = _origLastDividendDay;
                investor_addRefBonus(msg.sender, total_refBonus);
            }
        }
    }
}