contract Rappo {
function startGame() public {
        require(msg.sender == owner);
        gameInitiated = true;
    }
}