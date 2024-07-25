contract BankOfEthVaultBreaker {
function startNewRound(address _referer) public payable {
        
        require(rounds[latestRoundID].finalized, "Previous round not finalized");
        require(rounds[latestRoundID].softDeadline < now, "Previous round still running");
        
        uint _rID = rounds.length++; // first round is 0
        GameRound storage rnd = rounds[_rID];
        latestRoundID = _rID;

        rnd.lastInvestor = msg.sender;
        rnd.price = STARTING_KEY_PRICE;
        rnd.hardDeadline = now + HARD_DEADLINE_DURATION;
        rnd.softDeadline = now + soft_deadline_duration;
        rnd.jackpot = jackpotSeed;
        jackpotSeed = 0; 

        _purchase(rnd, msg.value, _referer);
        emit RoundStarted(_rID, rnd.hardDeadline, now);
    }
}