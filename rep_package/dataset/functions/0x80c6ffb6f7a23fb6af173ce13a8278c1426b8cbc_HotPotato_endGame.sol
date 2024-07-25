contract HotPotato {
function endGame()
    public
    payable
    gameRunning(currentGameId)
    inGame(currentGameId, msg.sender)
    gameTerminable(currentGameId) {
        Game storage game = games[currentGameId];

        game.running = false;
        game.finished = true;

        uint timeHeld = block.timestamp.sub(game.hotPotatoReceiveTime);
        game.holdTimes[game.hotPotatoOwner] = game.holdTimes[game.hotPotatoOwner].add(timeHeld);
        AddressHeldFor(currentGameId, game.hotPotatoOwner, game.holdTimes[msg.sender]);

        if (game.holdTimes[game.hotPotatoOwner] > game.holdTimes[game.maxTimeHolder]) {
            game.maxTimeHolder = game.hotPotatoOwner;
            NewMaxTimeHolder(currentGameId, game.maxTimeHolder);
        }

        GameEnded(currentGameId);

        currentGameId = currentGameId.add(1);
        games[currentGameId].blockCreated = block.number;
    }
}