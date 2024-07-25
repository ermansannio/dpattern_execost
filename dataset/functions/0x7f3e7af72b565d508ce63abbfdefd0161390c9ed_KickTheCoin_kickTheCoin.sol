contract KickTheCoin {
function kickTheCoin()
    public
    payable
    onlyDuringNormalOperations()
    {
        require(msg.value == costToKickTheCoin);

        if (hasWinner()) {
            storeWinnerShare();
            initGame();
        }

        kickerCount += 1;
        processKick();
        lastPlayerToKickTheCoin = msg.sender;
        targetBlockNumber = block.number + numberOfBlocksPerKick;

        LatestKicker(gameIndex, msg.sender, currentValue, targetBlockNumber);
    }
}