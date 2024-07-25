contract Dice2Win {
function kill() external onlyOwner {
        require (lockedInBets == 0);
        selfdestruct(owner);
    }
}