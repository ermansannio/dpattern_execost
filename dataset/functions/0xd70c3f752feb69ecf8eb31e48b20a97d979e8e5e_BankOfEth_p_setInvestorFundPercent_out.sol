contract BankOfEth {
function p_setInvestorFundPercent_out(uint num, uint dem) public onlyOwner {
        m_investorFundPercent_out = Percent.percent(num, dem);
    }
}