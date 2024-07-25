contract BankOfEth {
function p_setDevPercent_out(uint num, uint dem) public onlyOwner {
        m_devPercent_out = Percent.percent(num, dem);
    }
}