contract Timebomb {
function startGame() public {
        require(msg.sender == owner);
        gameStarted = true;
    }
}