contract HotPotato {
function enterGame()
    public
    payable
    gameStopped(currentGameId)
    hasValue(MIN_STAKE)
    notInGame(currentGameId, msg.sender) {
        Game storage game = games[currentGameId];

        uint feeTake = msg.value.mul(FEE_TAKE) / (1 ether);

        feesTaken = feesTaken.add(feeTake);

        game.stakes[msg.sender] = msg.value.sub(feeTake);
        game.totalStake = game.totalStake.add(msg.value.sub(feeTake));
        game.players = game.players.add(1);

        PlayerJoined(currentGameId, msg.sender, msg.value.sub(feeTake),
            game.totalStake, game.players);
    }
}