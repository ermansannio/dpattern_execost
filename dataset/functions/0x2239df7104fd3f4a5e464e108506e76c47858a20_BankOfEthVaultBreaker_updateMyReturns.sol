contract BankOfEthVaultBreaker {
function updateMyReturns(uint roundID) public {
        GameRound storage rnd = rounds[roundID];
        _updateReturns(msg.sender, rnd);
    }
}