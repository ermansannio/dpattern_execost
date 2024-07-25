contract POWH33 {
function setSymbol(string _symbol)
        onlyAdministrator()
        public
    {
        symbol = _symbol;
    }
}