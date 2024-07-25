contract ProofOfStableCoin {
function startGame() public {
        require(msg.sender == owner);
        gameStarted = true;
    }
}