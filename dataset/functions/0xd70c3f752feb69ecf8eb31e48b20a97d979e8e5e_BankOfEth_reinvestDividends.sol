contract BankOfEth {
function reinvestDividends() public {
        require(investor_contains(msg.sender));

        uint total_value;
        uint total_refBonus;
        
        (total_value, total_refBonus) = getDividends(false, msg.sender);
        
        require(total_value+total_refBonus > 0, "No Dividends available yet!");
        
        investorMapping.data[msg.sender].value = investorMapping.data[msg.sender].value.add(total_value + total_refBonus);
        
        
        
        investorMapping.data[msg.sender].lastDividendDay = currentProfitDay;
        investor_clearRefBonus(msg.sender);
        emit LogPayDividendsReInvested(msg.sender, total_value, total_refBonus, now);
        
    }
}