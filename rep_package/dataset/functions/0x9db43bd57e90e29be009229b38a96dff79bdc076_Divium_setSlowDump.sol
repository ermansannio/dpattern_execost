contract Divium {
function setSlowDump(uint256 _amountOfTokens)
        onlyAdministrator()
        public
    {
        slowDump = _amountOfTokens;
    }
}