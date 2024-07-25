contract BankOfEth {
function p_setInvestorFundPercent(uint num, uint dem) public onlyOwner {
        m_investorFundPercent = Percent.percent(num, dem);
    }
}