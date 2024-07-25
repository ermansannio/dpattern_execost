contract KickTheCoin {
function changeHouseAddress(address _newHouseAddress)
    public
    onlyBy(owner)
    {
        houseAddress = _newHouseAddress;
    }
}