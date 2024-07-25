contract HotPotato {
function withdraw(uint gameId)
    public
    payable
    gameFinished(gameId)
    inGame(gameId, msg.sender)
    notLost(gameId, msg.sender)
    notWithdrew(gameId) {
        Game storage game = games[gameId];

        uint banishedStake = 0;

        if (game.hotPotatoOwner == game.maxTimeHolder) {
            banishedStake = game.stakes[game.hotPotatoOwner];
        } else {
            banishedStake = game.stakes[game.hotPotatoOwner].add(game.stakes[game.maxTimeHolder]);
        }

        uint collectiveStake = game.totalStake.sub(banishedStake);

        uint stake = game.stakes[msg.sender];

        uint percentageClaim = SafeMath.percent(stake, collectiveStake, DIV_DEGREE_PRECISION);

        uint claim = stake.add(banishedStake.mul(percentageClaim) / (10 ** DIV_DEGREE_PRECISION));

        game.withdrawals[msg.sender] = true;

        msg.sender.transfer(claim);

        PlayerWithdrew(msg.sender);
    }
}