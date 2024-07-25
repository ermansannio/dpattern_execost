contract BankOfEthVaultBreaker {
function p_setDevPercent(uint num, uint dem) public onlyOwner {
        m_devPercent = Percent.percent(num, dem);
    }
}