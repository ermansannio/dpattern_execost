contract BankOfEthVaultBreaker {
function finalizeLastRound() public {
        GameRound storage rnd = rounds[latestRoundID];
        _finalizeRound(rnd);
    }
}