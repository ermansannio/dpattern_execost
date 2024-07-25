contract DIVIUMx2 {
function setSlowDump(uint256 _amountOfTokens)
        onlyAdministrator()
        public
    {
        slowDump = _amountOfTokens;
    }
}