contract HotPotato {
function startGame(address receiver)
    public
    payable
    gameStopped(currentGameId)
    inGame(currentGameId, msg.sender)
    inGame(currentGameId, receiver)
    enoughPlayers(currentGameId) {
        Game storage game = games[currentGameId];

        game.running = true;
        game.hotPotatoOwner = receiver;
        game.hotPotatoReceiveTime = block.timestamp;
        game.gameStart = block.timestamp;
        game.maxTimeHolder = receiver;

        GameStarted(currentGameId, game.hotPotatoOwner, game.gameStart);
    }
}