contract BankOfEth {
function p_setRefPercent(uint num, uint dem) public onlyOwner {
        m_refPercent = Percent.percent(num, dem);
    }
}