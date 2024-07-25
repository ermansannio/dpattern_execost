contract KickTheCoin {
function changeGameParameters(uint _costToKickTheCoin, uint _numberOfBlocksPerKick)
    public
    onlyByOwnerAndOnlyIfGameIsNotActive()
    {
        costToKickTheCoin = _costToKickTheCoin;
        numberOfBlocksPerKick = _numberOfBlocksPerKick;
    }
}