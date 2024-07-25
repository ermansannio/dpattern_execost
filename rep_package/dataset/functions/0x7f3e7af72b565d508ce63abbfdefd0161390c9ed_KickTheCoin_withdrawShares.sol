contract KickTheCoin {
function withdrawShares()
    public
    {
        if (hasWinner()) {
            storeWinnerShare();
            initGame();
        }
        pullShares(msg.sender);
    }
}