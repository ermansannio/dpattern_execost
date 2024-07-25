contract Pyrgressive {
function setJackpotFactor(uint _factor)
        onlyAdministrator()
        public
    {
        jackpotFactor = _factor;
    }
}