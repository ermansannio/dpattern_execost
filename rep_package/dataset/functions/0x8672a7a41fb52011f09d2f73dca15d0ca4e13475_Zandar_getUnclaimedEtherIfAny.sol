contract Zandar {
function getUnclaimedEtherIfAny(uint _gameID) adminOnly external {
        require(now >= games[_gameID].claimingPhaseEnd);
        require(games[_gameID].balance > 0);
        msg.sender.transfer(games[_gameID].balance);
        games[_gameID].balance = 0;
    }
}