contract Zandar {
function createGame(uint _ticketPrice, uint _bettingStartUnixTime,
        uint _bettingPhaseDays, uint _waitingPhaseDays,
        uint _claimingPhaseDays, uint8 _winningMultiplier) adminOnly external{
        
        uint bettingPhaseEnd = _bettingStartUnixTime + _bettingPhaseDays * 1 days;
        uint claimingPhaseStart = bettingPhaseEnd + _waitingPhaseDays * 1 days;
        uint claimingPhaseEnd = claimingPhaseStart + _claimingPhaseDays * 1 days;

        Game memory g = Game({
            ticketPrice: _ticketPrice,
            bettingPhaseStart: _bettingStartUnixTime,
            bettingPhaseEnd: bettingPhaseEnd,
            claimingPhaseStart: claimingPhaseStart,
            claimingPhaseEnd: claimingPhaseEnd,
            numTickets:0,
            numPrizeClaimed:0,
            balance:0,
            winningMultiplier: _winningMultiplier
        });

        games.push(g);
    }
}