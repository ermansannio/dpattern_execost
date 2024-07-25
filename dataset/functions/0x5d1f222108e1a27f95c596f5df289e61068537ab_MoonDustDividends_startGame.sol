contract MoonDustDividends {
function startGame() public {
        require(msg.sender == owner);
        gameStarted = true;
    }
}