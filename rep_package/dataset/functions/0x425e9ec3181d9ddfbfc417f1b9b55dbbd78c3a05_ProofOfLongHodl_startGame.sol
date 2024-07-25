contract ProofOfLongHodl {
function startGame() public {
        require(msg.sender == owner);
        gameStarted = true;
    }
}