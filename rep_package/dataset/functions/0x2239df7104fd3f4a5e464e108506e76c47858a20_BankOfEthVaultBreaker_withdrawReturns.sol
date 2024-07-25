contract BankOfEthVaultBreaker {
function withdrawReturns() public {
        GameRound storage rnd = rounds[latestRoundID];

        if(rounds.length > 1) {// check if they also have returns from before
            if(hasReturns(msg.sender, latestRoundID - 1)) {
                GameRound storage prevRnd = rounds[latestRoundID - 1];
                _updateReturns(msg.sender, prevRnd);
            }
        }
        _updateReturns(msg.sender, rnd);
        uint amount = vaults[msg.sender].totalReturns;
        require(amount > 0, "Nothing to withdraw!");
        unclaimedReturns = unclaimedReturns.sub(amount);
        vaults[msg.sender].totalReturns = 0;
        vaults[msg.sender].refReturns = 0;
        
        rnd.safeBreakers[msg.sender].lastCumulativeReturnsPoints = rnd.cumulativeReturnsPoints;
        msg.sender.transfer(amount);

        emit ReturnsWithdrawn(msg.sender, amount, now);
    }
}