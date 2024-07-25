contract _8thereum {
function setGames(address newGameAddress)
    onlyOwner()
    public
    {
        gameList[newGameAddress] = true;
    }
}